import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:superlikers_core/superlikers_core.dart';

Response<dynamic> _response(Object? data) => Response<dynamic>(
      requestOptions: RequestOptions(path: '/x'),
      statusCode: 200,
      data: data,
    );

void main() {
  test('decodeJsonBody acepta texto JSON y mapas ya decodificados', () {
    expect(decodeJsonBody(_response('{"ok":"true"}')), {'ok': 'true'});
    expect(decodeJsonBody(_response({'ok': true})), {'ok': true});
  });

  test('decodeJsonBody convierte cuerpos inválidos en DioException', () {
    for (final body in ['<html>502</html>', '', null, '[1,2]']) {
      expect(
        () => decodeJsonBody(_response(body)),
        throwsA(isA<DioException>()
            .having((e) => e.type, 'type', DioExceptionType.badResponse)),
        reason: 'body: $body',
      );
    }
  });
}
