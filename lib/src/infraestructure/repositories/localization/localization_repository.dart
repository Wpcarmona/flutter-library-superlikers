import '../../../domain/domain.dart';
import '../../datasource/datasource.dart';

class LocalizationRepositoryImpl extends LocalizationRepository {
  final LocalizationDatasource datasource;

  LocalizationRepositoryImpl([LocalizationDatasource? datasource])
      : datasource = datasource ?? LocalizationDatasourceImpl();

  @override
  Future<CrTienda> getCRTiendas({
    required String plaza,
    String q = '',
    String limit = '10',
  }) {
    return datasource.getCRTiendas(plaza: plaza, q: q, limit: limit);
  }

  @override
  Future<Zona> getZonas({required String zona}) {
    return datasource.getZonas(zona: zona);
  }

  @override
  Future<Region> getRegions({required String region}) {
    return datasource.getRegions(region: region);
  }
}
