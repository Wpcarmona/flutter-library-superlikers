import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';

import 'session_expired_interceptor.dart';

/// Certificado raíz de la CA que emite el certificado de *.superlikers.com
/// (cadena: *.superlikers.com -> Amazon RSA 2048 M04 -> Amazon Root CA 1).
/// Se fija la CA raíz —no el certificado final— para que las renovaciones
/// automáticas del certificado (AWS Certificate Manager las rota
/// periódicamente) no rompan la app: mientras el certificado siga siendo
/// emitido por esta CA, la conexión sigue validando correctamente.
const _amazonRootCa1Pem = '''
-----BEGIN CERTIFICATE-----
MIIEkjCCA3qgAwIBAgITBn+USionzfP6wq4rAfkI7rnExjANBgkqhkiG9w0BAQsF
ADCBmDELMAkGA1UEBhMCVVMxEDAOBgNVBAgTB0FyaXpvbmExEzARBgNVBAcTClNj
b3R0c2RhbGUxJTAjBgNVBAoTHFN0YXJmaWVsZCBUZWNobm9sb2dpZXMsIEluYy4x
OzA5BgNVBAMTMlN0YXJmaWVsZCBTZXJ2aWNlcyBSb290IENlcnRpZmljYXRlIEF1
dGhvcml0eSAtIEcyMB4XDTE1MDUyNTEyMDAwMFoXDTM3MTIzMTAxMDAwMFowOTEL
MAkGA1UEBhMCVVMxDzANBgNVBAoTBkFtYXpvbjEZMBcGA1UEAxMQQW1hem9uIFJv
b3QgQ0EgMTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBALJ4gHHKeNXj
ca9HgFB0fW7Y14h29Jlo91ghYPl0hAEvrAIthtOgQ3pOsqTQNroBvo3bSMgHFzZM
9O6II8c+6zf1tRn4SWiw3te5djgdYZ6k/oI2peVKVuRF4fn9tBb6dNqcmzU5L/qw
IFAGbHrQgLKm+a/sRxmPUDgH3KKHOVj4utWp+UhnMJbulHheb4mjUcAwhmahRWa6
VOujw5H5SNz/0egwLX0tdHA114gk957EWW67c4cX8jJGKLhD+rcdqsq08p8kDi1L
93FcXmn/6pUCyziKrlA4b9v7LWIbxcceVOF34GfID5yHI9Y/QCB/IIDEgEw+OyQm
jgSubJrIqg0CAwEAAaOCATEwggEtMA8GA1UdEwEB/wQFMAMBAf8wDgYDVR0PAQH/
BAQDAgGGMB0GA1UdDgQWBBSEGMyFNOy8DJSULghZnMeyEE4KCDAfBgNVHSMEGDAW
gBScXwDfqgHXMCs4iKK4bUqc8hGRgzB4BggrBgEFBQcBAQRsMGowLgYIKwYBBQUH
MAGGImh0dHA6Ly9vY3NwLnJvb3RnMi5hbWF6b250cnVzdC5jb20wOAYIKwYBBQUH
MAKGLGh0dHA6Ly9jcnQucm9vdGcyLmFtYXpvbnRydXN0LmNvbS9yb290ZzIuY2Vy
MD0GA1UdHwQ2MDQwMqAwoC6GLGh0dHA6Ly9jcmwucm9vdGcyLmFtYXpvbnRydXN0
LmNvbS9yb290ZzIuY3JsMBEGA1UdIAQKMAgwBgYEVR0gADANBgkqhkiG9w0BAQsF
AAOCAQEAYjdCXLwQtT6LLOkMm2xF4gcAevnFWAu5CIw+7bMlPLVvUOTNNWqnkzSW
MiGpSESrnO09tKpzbeR/FoCJbM8oAxiDR3mjEH4wW6w7sGDgd9QIpuEdfF7Au/ma
eyKdpwAJfqxGF4PcnCZXmTA5YpaP7dreqsXMGz7KQ2hsVxa81Q4gLv7/wmpdLqBK
bRRYh5TmOTFffHPLkIhqhBGWJ6bt2YFGpn6jcgAKUj6DiAdjd4lpFw85hdKrCEVN
0FE6/V1dN2RMfjCyVSRCnTawXZwXgWHxyvkQAiSr6w10kY17RSlQOYiypok1JR4U
akcjMS9cmvqtmg5iUaQqqcT5NJ0hGA==
-----END CERTIFICATE-----
''';

const _connectTimeout = Duration(seconds: 15);
const _receiveTimeout = Duration(seconds: 30);
const _sendTimeout = Duration(seconds: 30);

/// Fija (pinning) las conexiones de [dio] a la CA raíz de
/// *.superlikers.com: rechaza cualquier certificado que no encadene a esa
/// CA, incluso si el sistema operativo confía en él. No tiene efecto si el
/// adapter de [dio] no es el `IOHttpClientAdapter` por defecto (por ejemplo
/// en test o en web) — ahí la conexión sigue validando contra el trust
/// store del sistema, solo que sin el pinning adicional.
void applyCertificatePinning(Dio dio) {
  final adapter = dio.httpClientAdapter;
  if (adapter is! IOHttpClientAdapter) return;

  adapter.createHttpClient = () {
    final context = SecurityContext(withTrustedRoots: false);
    context.setTrustedCertificatesBytes(_amazonRootCa1Pem.codeUnits);
    return HttpClient(context: context);
  };
}

/// Crea un [Dio] con certificate pinning ([applyCertificatePinning]),
/// [SessionExpiredInterceptor], timeouts razonables y sin redirects
/// automáticos ya aplicados. Es lo que usan internamente los datasource
/// del SDK.
///
/// Controles de seguridad aplicados:
/// - **Certificate pinning** a la CA raíz de `*.superlikers.com`.
/// - **Solo HTTPS**: [baseUrl] debe empezar con `https://`, para no enviar
///   por error `apiKey`/tokens en texto plano.
/// - **Sin redirects automáticos** (`followRedirects: false`): evita que un
///   3xx downgradee una llamada de https a http sin que el caller se
///   entere; el datasource recibe la respuesta 3xx tal cual.
/// - **Timeouts** de conexión/envío/recepción, para no dejar conexiones
///   (y credenciales en memoria) colgadas indefinidamente.
Dio createPinnedDio({required String baseUrl}) {
  if (!baseUrl.startsWith('https://')) {
    throw ArgumentError.value(
      baseUrl,
      'baseUrl',
      'Debe ser una URL https:// (no se permite texto plano)',
    );
  }

  final dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: _connectTimeout,
      receiveTimeout: _receiveTimeout,
      sendTimeout: _sendTimeout,
      followRedirects: false,
    ),
  );
  applyCertificatePinning(dio);
  dio.interceptors.add(SessionExpiredInterceptor());
  return dio;
}
