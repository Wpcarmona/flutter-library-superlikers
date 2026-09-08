import '../../../domain/domain.dart';
import '../../../network/pinned_dio.dart';
import '../../mappers/mapper.dart';
import '../../models/models.dart';

/// Este módulo habla con un microservicio de localización distinto del
/// backend principal de Superlikers (no usa `Environment.baseUrl`).
class LocalizationDatasourceImpl extends LocalizationDatasource {
  final dio = createPinnedDio(
    baseUrl: 'https://2glhvdb3bhrh3kgqmfpvhw25w40gmmxt.lambda-url.us-east-1.on.aws',
  );

  Zona _jsonToZona(Map<String, dynamic> json) {
    final zonaResponse = ZonaResponse.fromJson(json);
    return LocalizationMapper.zonaToEntity(zonaResponse);
  }

  Region _jsonToRegion(Map<String, dynamic> json) {
    final regionResponse = RegionResponse.fromJson(json);
    return LocalizationMapper.regionToEntity(regionResponse);
  }

  CrTienda _jsonToCrTienda(Map<String, dynamic> json) {
    final crTiendaResponse = TiendaResponse.fromJson(json);
    return LocalizationMapper.crTiendaToEntity(crTiendaResponse);
  }

  @override
  Future<Zona> getZonas({required String zona}) async {
    final response = await dio.get('/regiones');

    final Map<String, dynamic> responseData =
        response.data as Map<String, dynamic>;

    return _jsonToZona(responseData);
  }

  @override
  Future<Region> getRegions({required String region}) async {
    final response = await dio.get(
      '/plazas?region=${Uri.encodeQueryComponent(region)}',
    );
    final Map<String, dynamic> responseData =
        response.data as Map<String, dynamic>;
    return _jsonToRegion(responseData);
  }

  @override
  Future<CrTienda> getCRTiendas({
    required String plaza,
    String q = '',
    String limit = '10',
  }) async {
    final response = await dio.get(
      '/tiendas?plaza=${Uri.encodeQueryComponent(plaza)}'
      '&q=${Uri.encodeQueryComponent(q)}'
      '&limit=${Uri.encodeQueryComponent(limit)}',
    );
    final Map<String, dynamic> responseData =
        response.data as Map<String, dynamic>;
    return _jsonToCrTienda(responseData);
  }
}
