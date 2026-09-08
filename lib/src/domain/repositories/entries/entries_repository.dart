import '../../entities/entities.dart';

abstract class EntriesRepository {
  Future<ListEntries> getListEntries({
    String? token,
    String? category,
    String? moderation,
    String? type,
    String? atype,
    String? after,
    String? before,
    bool? offetPaginated,
    num? page,
    num? limit,
    String? distinctId,
    bool? hideUndo,
    required Map<String, dynamic> dateFilter,
    String? view,
    String? order,
  });
}
