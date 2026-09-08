import '../../../domain/domain.dart';
import '../../datasource/datasource.dart';

class RedeemedPrizeRepositoryImpl extends RedeemedPrizeRepository {
  final RedeemedPrizeDatasource datasource;

  RedeemedPrizeRepositoryImpl([RedeemedPrizeDatasource? datasource])
      : datasource = datasource ?? RedeemedPrizeDatasourceImpl();

  @override
  Future<List<RedeemedPrize>> getRedeemedPrizesByCategory({
    required String category,
  }) {
    return datasource.getRedeemedPrizesByCategory(category: category);
  }
}
