class ListEntries {
  final String ok;
  final DataEntries data;

  ListEntries({
    required this.ok,
    required this.data,
  });
}

class DataEntries {
  final num previousPageToken;
  final num nextPageToken;
  final List<ListEntriesResponse> entries;

  DataEntries({
    required this.previousPageToken,
    required this.nextPageToken,
    required this.entries,
  });
}

class ListEntriesResponse {
  final num activityCount;
  final String category;
  final String createdAt;
  final String moderation;
  final num points;
  final String state;
  final String id;
  final String slug;
  final String name;
  final bool asForm;
  final Map<String, dynamic>? data;
  final String participantUid;
  final EntryPrize? prize;
  final String? redemptionState;
  final String? source;
  final bool gift;
  final EntryRedemption? redemption;

  ListEntriesResponse({
    required this.activityCount,
    required this.category,
    required this.createdAt,
    required this.moderation,
    required this.points,
    required this.state,
    required this.id,
    required this.slug,
    required this.name,
    required this.asForm,
    this.data,
    this.participantUid = '',
    this.prize,
    this.redemptionState,
    this.source,
    this.gift = false,
    this.redemption,
  });
}

class EntryRedemption {
  final String id;
  final String createdAt;
  final num points;
  final String? prizeName;
  final String? code;
  final String? state;

  EntryRedemption({
    required this.id,
    required this.createdAt,
    required this.points,
    this.prizeName,
    this.code,
    this.state,
  });
}

class EntryPrize {
  final String id;
  final String type;
  final String category;
  final String description;
  final String name;
  final num points;
  final String imageUrl;
  final String prizeImageUrl;
  final bool redeemable;
  final List<String> tags;
  final String tc;
  final num quantity;
  final num quantityAvailable;
  final num expirationDays;
  final bool unlimited;
  final String? eid;
  final EntryPrizeDetails? prizeDetails;

  EntryPrize({
    required this.id,
    required this.type,
    required this.category,
    required this.description,
    required this.name,
    required this.points,
    required this.imageUrl,
    required this.prizeImageUrl,
    required this.redeemable,
    required this.tags,
    required this.tc,
    required this.quantity,
    required this.quantityAvailable,
    required this.expirationDays,
    required this.unlimited,
    this.eid,
    this.prizeDetails,
  });
}

class EntryPrizeDetails {
  final String value;
  final String description;

  EntryPrizeDetails({required this.value, required this.description});
}
