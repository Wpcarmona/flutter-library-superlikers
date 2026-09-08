import '../../entities/entities.dart';

abstract class LocalizationRepository {
  Future<Zona> getZonas({required String zona});

  Future<Region> getRegions({required String region});

  Future<CrTienda> getCRTiendas({
    required String plaza,
    String q,
    String limit,
  });
}
