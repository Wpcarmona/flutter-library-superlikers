import '../../../domain/domain.dart';
import '../../datasource/datasource.dart';

class PrizeRepositoryImpl extends PrizeRepository {
  final PrizesDatasource datasource;

  PrizeRepositoryImpl([PrizesDatasource? datasource])
      : datasource = datasource ?? PrizeDatasourceImpl();

  @override
  Future<RewardCheck> checkRedeemReward({
    required String distinctId,
    required String rewardId,
  }) {
    return datasource.checkRedeemReward(
      distinctId: distinctId,
      rewardId: rewardId,
    );
  }

  @override
  Future<List<Reward>> getPrizes({
    num? page,
    num? limit,
    List<String>? tags,
    bool? redeemable,
    bool? fitsPoints,
    String? distinctId,
    Map<String, dynamic>? sort,
  }) {
    return datasource.getPrizes(
      page: page,
      limit: limit,
      tags: tags,
      redeemable: redeemable,
      fitsPoints: fitsPoints,
      distinctId: distinctId,
      sort: sort,
    );
  }

  @override
  Future<RewardRedeem> rewardRedeem({
    required String distinctId,
    required String rewardId,
    Map<String, dynamic>? formData,
    String? category,
  }) {
    return datasource.rewardRedeem(
      distinctId: distinctId,
      rewardId: rewardId,
      formData: formData,
      category: category,
    );
  }
}
