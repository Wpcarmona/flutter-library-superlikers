import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../config/environment.dart';
import '../../../domain/domain.dart';
import '../../../network/pinned_dio.dart';
import '../../mappers/goal/goals.dart';
import '../../models/models.dart';

class GoalDatasourceImpl extends GoalDatasource {
  final dio = createPinnedDio(baseUrl: Environment.baseUrl);

  List<IndexGoals> _goalsIndexFromResponse(Map<String, dynamic> json) {
    final challengeResponse = GoalIndexResponse.fromJson(json);
    return challengeResponse.data.goals
        .map(GoalMapper.getGoalIndexToEntity)
        .toList();
  }

  List<GoalsParticipant> _goalsParticipantFromResponse(
    Map<String, dynamic> json,
  ) {
    final goalParticipant = GoalParticipantResponse.fromJson(json);
    return goalParticipant.data.goalStatuses
        .map(GoalMapper.getGoalsToEntity)
        .toList();
  }

  AcceptGoals _jsonToAcceptGoals(Map<String, dynamic> json) {
    final acceptGoalsResponse = AcceptGoalsResponse.fromJson(json);
    return AcceptGoalMapper.acceptGoalToEntity(acceptGoalsResponse);
  }

  UnacceptGoals _jsonToUnacceptGoals(Map<String, dynamic> json) {
    final unacceptGoalsResponse = UnnacceptGoalsResponse.fromJson(json);
    return UnacceptGoalMapper.unacceptGoalToEntity(unacceptGoalsResponse);
  }

  @override
  Future<List<IndexGoals>> getGoalsIndex({
    required bool enabled,
    required List<String> tags,
    num? page,
    num? limit,
    String? sponsorId,
    bool? trending,
    String? q,
  }) async {
    final response = await dio.post(
      '/goals/index',
      data: {
        'api_key': Environment.apiKey,
        'campaign': Environment.campaign,
        'enabled': enabled,
        'tags': tags,
        'page': ?page,
        'limit': ?limit,
        'sponsor_id': ?sponsorId,
        'trending': ?trending,
        'q': ?q,
      },
    );
    final Map<String, dynamic> responseData = jsonDecode(response.data);
    return _goalsIndexFromResponse(responseData);
  }

  @override
  Future<List<GoalsParticipant>> getGoalsParticipant({
    required String token,
    required List<String> tags,
    required String distictId,
    int page = 1,
  }) async {
    final response = await dio.post(
      '/participants/goals',
      options: Options(headers: {'Authorization': 'Bearer $token'}),
      data: {
        'api_key': Environment.apiKey,
        'campaign': Environment.campaign,
        'distinct_id': distictId,
        'tags': tags,
        'page': page,
      },
    );
    final Map<String, dynamic> responseData = jsonDecode(response.data);
    return _goalsParticipantFromResponse(responseData);
  }

  @override
  Future<AcceptGoals> acceptGoals({
    required String goalId,
    required String distinctId,
    String? uidType,
  }) async {
    final response = await dio.post(
      '/participants/goals/accept',
      data: {
        'api_key': Environment.apiKey,
        'campaign': Environment.campaign,
        'goal_id': goalId,
        'distinct_id': distinctId,
        'uid_type': ?uidType,
      },
    );
    final Map<String, dynamic> responseData = jsonDecode(response.data);
    return _jsonToAcceptGoals(responseData);
  }

  @override
  Future<UnacceptGoals> unacceptGoals({
    required String goalId,
    required String distinctId,
    String? uidType,
  }) async {
    final response = await dio.post(
      '/participants/goals/unaccept',
      data: {
        'api_key': Environment.apiKey,
        'campaign': Environment.campaign,
        'goal_id': goalId,
        'distinct_id': distinctId,
        'uid_type': ?uidType,
      },
    );
    final Map<String, dynamic> responseData = jsonDecode(response.data);
    return _jsonToUnacceptGoals(responseData);
  }

  @override
  Future<GoalStatusInfo> getGoalStatus({
    required String token,
    required String goalId,
  }) async {
    final response = await dio.post(
      '/microsite/participants/goals/status',
      options: Options(headers: {'Authorization': 'Bearer $token'}),
      data: {
        'api_key': Environment.apiKey,
        'campaign': Environment.campaign,
        'goal_id': goalId,
      },
    );
    final Map<String, dynamic> responseData = jsonDecode(response.data);
    return GoalMapper.getGoalStatusInfoToEntity(GoalStatusInfoResponse.fromJson(responseData));
  }
}
