import '../../../domain/domain.dart';
import '../../../network/json_body.dart';
import '../../../network/pinned_dio.dart';
import '../../mappers/mapper.dart';
import '../../models/models.dart';

class RedeemedPrizeDatasourceImpl extends RedeemedPrizeDatasource {
  final dio = createPinnedDio(
    baseUrl:
        'https://evmupjxo4xbboetdg3u6jmgama0zlfta.lambda-url.us-east-1.on.aws',
  );

  @override
  Future<List<RedeemedPrize>> getRedeemedPrizesByCategory({
    required String category,
  }) async {
    final response = await dio.get(
      '/',
      queryParameters: {'category': category},
    );
    final responseData = decodeJsonBody(response);

    final parsed = RedeemedPrizesResponse.fromJson(responseData);
    return parsed.data.map(RedeemedPrizesMapper.redeemedPrizeToEntity).toList();
  }
}
