import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../config/environment.dart';
import '../../../domain/domain.dart';
import '../../../network/pinned_dio.dart';
import '../../mappers/mapper.dart';
import '../../models/models.dart' hide Reward;

class PrizeDatasourceImpl extends PrizesDatasource {
  final dio = createPinnedDio(baseUrl: Environment.baseUrl);

  List<Reward> _jsonToRewardList(Map<String, dynamic> json) {
    final rewardResponse = RewardResponse.fromJson(json);
    return rewardResponse.object.map(PrizesMapper.rewardToEntity).toList();
  }

  RewardCheck _jsonToRewardCheck(Map<String, dynamic> json) {
    final rewardCheckResponse = RewardCheckResponse.fromJson(json);
    return PrizesMapper.rewardCheckToEntity(rewardCheckResponse);
  }

  RewardRedeem _jsonToRewardRedeem(Map<String, dynamic> json) {
    final rewardRedeemResponse = RewardRedeemResponse.fromJson(json);
    return PrizesMapper.rewardRedeemToEntity(rewardRedeemResponse);
  }

  @override
  Future<RewardCheck> checkRedeemReward({
    required String distinctId,
    required String rewardId,
  }) async {
    final response = await dio.post(
      '/rewards/$rewardId/check',
      data: {
        'api_key': Environment.apiKey,
        'campaign': Environment.campaign,
        'distinct_id': distinctId,
      },
    );
    final Map<String, dynamic> data = jsonDecode(response.data);
    return _jsonToRewardCheck(data);
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
  }) async {
    final response = await dio.get(
      '/rewards',
      queryParameters: {
        'campaign': Environment.campaign,
        'limit': limit,
        'page': page,
        if (tags != null && tags.isNotEmpty) 'tags[]': tags,
        'fits_points': ?fitsPoints,
        'redeemable': ?redeemable,
        'distinct_id': ?distinctId,
      },
      options: Options(
        headers: {'Authorization': 'Bearer ${Environment.apiKey}'},
      ),
    );
    final Map<String, dynamic> responseData = jsonDecode(response.data);
    return _jsonToRewardList(responseData);
  }

  @override
  Future<RewardRedeem> rewardRedeem({
    required String distinctId,
    required String rewardId,
    Map<String, dynamic>? formData,
    String? category,
  }) async {
    final response = await dio.post(
      '/rewards/$rewardId/redeem',
      data: {
        'api_key': Environment.apiKey,
        'campaign': Environment.campaign,
        'distinct_id': distinctId,
        'form_data': ?formData,
      },
    );
    final Map<String, dynamic> responseData = jsonDecode(response.data);
    return _jsonToRewardRedeem(responseData);
  }
}
