import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../config/environment.dart';
import '../../../domain/domain.dart';
import '../../../network/pinned_dio.dart';
import '../../mappers/mapper.dart';
import '../../models/models.dart' hide Participant;

class ParticipantDatasourceImpl extends ParticipantDatasource {
  final dio = createPinnedDio(baseUrl: Environment.baseUrl);

  ParticipantPublicInfo _jsonToParticipantPublicInfo(Map<String, dynamic> json) {
    final response = ParticipantPublicInfoResponse.fromJson(json);
    return ParticipantMapper.participantPublicInfoToEntity(response);
  }

  AdvancedRanking _jsonToParticipantRanking(Map<String, dynamic> json) {
    final participantRankResponse = ParticipantRankingResponse.fromJson(json);
    return ParticipantMapper.participantRankToEntity(participantRankResponse);
  }

  UpdateAvatar _jsonToUpdateAvatar(Map<String, dynamic> json) {
    final updateTagsResponse = UpdateParticipantAvatarResponse.fromJson(json);
    return ParticipantMapper.updateAvatarToEntity(updateTagsResponse);
  }

  UpdateUser _jsonToUpdateUser(Map<String, dynamic> json) {
    final updateTagsResponse = UpdateParticipantResponse.fromJson(json);
    return ParticipantMapper.updateUserToEntity(updateTagsResponse);
  }

  @override
  Future<ParticipantPublicInfo> getParticipantPublicInfo({
    required String token,
  }) async {
    final response = await dio.get(
      '/microsite/participants/info',
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );
    final Map<String, dynamic> responseData = jsonDecode(response.data);
    return _jsonToParticipantPublicInfo(responseData);
  }

  @override
  Future<AdvancedRanking> getParticipantRanking({
    required String apiKey,
    required String campaign,
    required String distinctId,
  }) async {
    final response = await dio.post(
      '/participants/ranks',
      data: {
        'api_key': Environment.apiKey,
        'campaign': Environment.campaign,
        'distinct_id': distinctId,
      },
    );
    final Map<String, dynamic> responseData = jsonDecode(response.data);
    return _jsonToParticipantRanking(responseData);
  }

  @override
  Future<UpdateAvatar> updateAvatar({
    required String token,
    required String distinctId,
    required String url,
  }) async {
    final response = await dio.post(
      '/participants/update',
      options: Options(headers: {'Authorization': 'Bearer $token'}),
      data: {
        'api_key': Environment.apiKey,
        'campaign': Environment.campaign,
        'distinct_id': distinctId,
        'properties': {'avatar': url},
      },
    );
    final Map<String, dynamic> responseData = jsonDecode(response.data);
    return _jsonToUpdateAvatar(responseData);
  }

  @override
  Future<UpdateUser> updateUser({
    required String token,
    required String distinctId,
    String? name,
    String? phone,
    String? cargo,
    String? fcmToken,
    String? autorizationNumber,
  }) async {
    final response = await dio.post(
      '/participants/update',
      options: Options(headers: {'Authorization': 'Bearer $token'}),
      data: {
        'api_key': Environment.apiKey,
        'campaign': Environment.campaign,
        'distinct_id': distinctId,
        'properties': {
          if (name != null) 'name': name,
          if (phone != null) 'phone': phone,
          if (cargo != null) 'cargo': cargo,
          if (fcmToken != null) 'fcm': fcmToken,
          if (autorizationNumber != null) 'autorizacion_celular': autorizationNumber,
        },
      },
    );
    final Map<String, dynamic> responseData = jsonDecode(response.data);
    return _jsonToUpdateUser(responseData);
  }

  @override
  Future<List<Participant>> searchParticipants({
    required String token,
    List<String>? tags,
  }) async {
    final response = await dio.post(
      '/microsite/participants/list',
      options: Options(headers: {'Authorization': 'Bearer $token'}),
      data: {
        'api_key': Environment.apiKey,
        'campaign': Environment.campaign,
        if (tags != null && tags.isNotEmpty) 'tags': tags,
      },
    );
    final Map<String, dynamic> responseData = jsonDecode(response.data);
    return ParticipantMapper.participantListToEntity(
      ParticipantListResponse.fromJson(responseData),
    );
  }

  @override
  Future<ParticipantPoints> getParticipantPoints({required String token}) async {
    final response = await dio.get(
      '/microsite/participants/points',
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );
    final Map<String, dynamic> responseData = jsonDecode(response.data);
    return ParticipantMapper.participantPointsToEntity(
      ParticipantPointsResponse.fromJson(responseData),
    );
  }

  @override
  Future<RedeemPoints> redeemPoints({
    required String token,
    required num points,
  }) async {
    final response = await dio.post(
      '/microsite/participants/redeem',
      options: Options(headers: {'Authorization': 'Bearer $token'}),
      data: {
        'api_key': Environment.apiKey,
        'campaign': Environment.campaign,
        'points': points,
      },
    );
    final Map<String, dynamic> responseData = jsonDecode(response.data);
    return ParticipantMapper.redeemPointsToEntity(RedeemPointsResponse.fromJson(responseData));
  }
}
