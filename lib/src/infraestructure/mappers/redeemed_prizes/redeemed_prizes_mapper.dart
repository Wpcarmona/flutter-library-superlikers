import '../../../domain/entities/entities.dart' as domain;
import '../../models/models.dart' as infra;

class RedeemedPrizesMapper {
  static domain.RedeemedPrize redeemedPrizeToEntity(infra.RedeemedPrizeData data) =>
      domain.RedeemedPrize(
        prizeId: data.prizeId,
        prizeName: data.prizeName,
        description: data.description,
        tags: data.tags,
        coins: data.coins,
        redeemedAt: data.redeemedAt,
        redemptionState: data.redemptionState,
        redemptionCode: data.redemptionCode,
        user: domain.RedeemedPrizeUser(
          name: data.user.name,
          uid: data.user.uid,
          email: data.user.email,
        ),
        matchedInCatalog: data.matchedInCatalog,
      );
}
