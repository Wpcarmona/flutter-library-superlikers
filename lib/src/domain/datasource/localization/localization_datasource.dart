import '../../entities/entities.dart';

abstract class LocalizationDatasource {
  Future<Zona> getZonas({required String zona});

  Future<Region> getRegions({required String region});

  Future<CrTienda> getCRTiendas({
    required String plaza,
    String q,
    String limit,
  });
}
