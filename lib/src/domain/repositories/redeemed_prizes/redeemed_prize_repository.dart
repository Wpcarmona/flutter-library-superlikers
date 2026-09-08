import '../../entities/entities.dart';

abstract class RedeemedPrizeRepository {
  Future<List<RedeemedPrize>> getRedeemedPrizesByCategory({
    required String category,
  });
}
