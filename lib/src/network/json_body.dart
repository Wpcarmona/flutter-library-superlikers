import 'dart:convert';

import 'package:dio/dio.dart';

/// Decodifica el cuerpo de una respuesta de Superlikers a un mapa JSON.
///
/// Acepta el cuerpo ya decodificado por Dio (cuando la respuesta trae
/// `Content-Type: application/json`) o como texto. Si no es un objeto JSON
/// (por ejemplo una página HTML de un 502, o un cuerpo vacío) lanza un
/// [DioException] de tipo `badResponse` con la respuesta adjunta, en vez de
/// un `TypeError`/`FormatException`: así las apps lo manejan igual que
/// cualquier otro error de red.
Map<String, dynamic> decodeJsonBody(Response<dynamic> response) {
  final data = response.data;
  if (data is Map<String, dynamic>) return data;
  if (data is Map) return Map<String, dynamic>.from(data);
  if (data is String && data.isNotEmpty) {
    try {
      final decoded = jsonDecode(data);
      if (decoded is Map) return Map<String, dynamic>.from(decoded);
    } catch (_) {
      // Se reporta abajo como respuesta inválida.
    }
  }
  throw DioException(
    requestOptions: response.requestOptions,
    response: response,
    type: DioExceptionType.badResponse,
    message: 'La respuesta de Superlikers no es un objeto JSON válido.',
  );
}
