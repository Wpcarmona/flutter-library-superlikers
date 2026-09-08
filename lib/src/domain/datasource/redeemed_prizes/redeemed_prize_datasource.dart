import '../../entities/entities.dart';

abstract class RedeemedPrizeDatasource {
  Future<List<RedeemedPrize>> getRedeemedPrizesByCategory({
    required String category,
  });
}
