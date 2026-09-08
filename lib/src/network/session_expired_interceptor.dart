import 'package:dio/dio.dart';

typedef SessionExpiredCallback = void Function();

/// La app consumidora lo asigna una sola vez (por ejemplo desde su
/// AuthNotifier) para poder cerrar la sesión desde este interceptor sin que
/// este paquete dependa de ningún manejador de estado en particular.
SessionExpiredCallback? onSessionExpired;

/// Cierra la sesión ante cualquier 401 de una llamada que sí llevaba
/// `Authorization`. Se excluyen a propósito las llamadas SIN
/// `Authorization` (login, verificación de contraseña, etc.): un 401 ahí
/// normalmente significa "credenciales incorrectas", no "sesión expirada".
class SessionExpiredInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final hadAuthHeader = err.requestOptions.headers['Authorization'] != null;
    if (err.response?.statusCode == 401 && hadAuthHeader) {
      onSessionExpired?.call();
    }
    handler.next(err);
  }
}
