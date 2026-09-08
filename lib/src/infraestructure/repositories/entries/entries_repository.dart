import '../../../domain/domain.dart';
import '../../datasource/datasource.dart';

class EntriesRepositoryImpl extends EntriesRepository {
  final EntriesDatasource datasource;

  EntriesRepositoryImpl([EntriesDatasource? datasource])
      : datasource = datasource ?? EntriesDatasourceImpl();

  @override
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
  }) {
    return datasource.getListEntries(
      token: token,
      category: category,
      moderation: moderation,
      type: type,
      atype: atype,
      after: after,
      before: before,
      offetPaginated: offetPaginated,
      page: page,
      limit: limit,
      distinctId: distinctId,
      hideUndo: hideUndo,
      dateFilter: dateFilter,
      view: view,
      order: order,
    );
  }
}
