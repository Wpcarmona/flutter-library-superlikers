import '../../../domain/entities/entities.dart' as domain;
import '../../models/models.dart' as infra;

class EntriesMapper {
  static domain.ListEntries listEntriesToEntity(infra.EntriesResponseApi response) {
    return domain.ListEntries(
      ok: response.ok,
      data: domain.DataEntries(
        nextPageToken: response.data.nextPageToken,
        previousPageToken: response.data.previousPageToken,
        entries: response.data.entries
            .map((e) => domain.ListEntriesResponse(
                  activityCount: e.activityCount,
                  category: e.category,
                  createdAt: e.createdAt.toLocal().toIso8601String(),
                  asForm: e.asForm,
                  id: e.id,
                  moderation: e.moderation,
                  points: e.points,
                  name: e.name,
                  slug: e.slug,
                  state: e.state,
                  data: e.data.toJson(),
                  participantUid: e.participant.uid,
                  prize: e.prize != null ? _prizeToEntity(e.prize!) : null,
                  redemptionState: e.redemptionState,
                  source: e.source,
                  gift: e.gift,
                  redemption: e.redemption != null ? _redemptionToEntity(e.redemption!) : null,
                ))
            .toList(),
      ),
    );
  }

  static domain.EntryRedemption _redemptionToEntity(infra.EntryRedemptionResponse r) {
    return domain.EntryRedemption(
      id: r.id,
      createdAt: r.createdAt.toLocal().toIso8601String(),
      points: r.points,
      prizeName: r.prizeName,
      code: r.code,
      state: r.state,
    );
  }

  static domain.EntryPrize _prizeToEntity(infra.EntryPrizeResponse p) {
    return domain.EntryPrize(
      id: p.id,
      type: p.type,
      category: p.category,
      description: p.description,
      name: p.name,
      points: p.points,
      imageUrl: p.imageUrl,
      prizeImageUrl: p.prizeImageUrl,
      redeemable: p.redeemable,
      tags: p.tags,
      tc: p.tc,
      quantity: p.quantity,
      quantityAvailable: p.quantityAvailable,
      expirationDays: p.expirationDays,
      unlimited: p.unlimited,
      eid: p.eid,
      prizeDetails: p.prizeDetails != null
          ? domain.EntryPrizeDetails(
              value: p.prizeDetails!.value,
              description: p.prizeDetails!.description,
            )
          : null,
    );
  }
}
