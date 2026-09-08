import 'dart:convert';

import '../../../config/environment.dart';
import '../../../domain/datasource/votes/votes_datasource.dart';
import '../../../domain/entities/votes/votes.dart';
import '../../../network/pinned_dio.dart';
import '../../mappers/votes/votes_mapper.dart';
import '../../models/votes/votes.dart';

class VotesDatasourceImpl extends VotesDatasource {
  final dio = createPinnedDio(baseUrl: Environment.baseUrl);

  CreateVote _jsonToCreateVote(Map<String, dynamic> json) {
    final createVoteResponse = VotesResponse.fromJson(json);
    return VotesMapper.getCreateVoteToEntity(createVoteResponse);
  }

  DeleteVote _jsonToDeleteVote(Map<String, dynamic> json) {
    final deleteVoteResponse = VotesResponse.fromJson(json);
    return VotesMapper.getDeleteVoteToEntity(deleteVoteResponse);
  }

  UpdateVote _jsonToUpdateVote(Map<String, dynamic> json) {
    final updateVoteResponse = VotesResponse.fromJson(json);
    return VotesMapper.getUpdateVoteToEntity(updateVoteResponse);
  }

  CountVotesPublication _jsonToCountVotesPublication(Map<String, dynamic> json) {
    final countVotesPublicationResponse = CountVotesPublicationResponse.fromJson(json);
    return VotesMapper.countVotesPublicationToEntity(countVotesPublicationResponse);
  }

  Map<String, dynamic> _parseResponse(dynamic raw) =>
      raw is String ? jsonDecode(raw) : Map<String, dynamic>.from(raw as Map);

  @override
  Future<CountVotesPublication> countVotesPublication({String? distinctId, required String targetId}) async {
    final response = await dio.post(
      '/votes/target_count',
      data: {
        'api_key': Environment.apiKey,
        'campaign': Environment.campaign,
        'distinct_id': distinctId,
        'target_id': targetId,
      }
    );
    final Map<String, dynamic> responseData = _parseResponse(response.data);
    return _jsonToCountVotesPublication(responseData);
  }

  @override
  Future<CreateVote> createVote({required String distinctId, required String targetId, required String category, bool? toggle}) async {
    final response = await dio.post(
      '/votes',
      data: {
        'api_key': Environment.apiKey,
        'campaign': Environment.campaign,
        'distinct_id': distinctId,
        'target_id': targetId,
        'category': category,
        'toggle': toggle,
      }
    );
    final Map<String, dynamic> responseData = _parseResponse(response.data);
    return _jsonToCreateVote(responseData);
  }

  @override
  Future<DeleteVote> deleteVote({required String distinctId, required String targetId}) async {
    final response = await dio.delete(
      '/votes/delete',
      data: {
        'api_key': Environment.apiKey,
        'campaign': Environment.campaign,
        'distinct_id': distinctId,
        'target_id': targetId,
      }
    );
    final Map<String, dynamic> responseData = _parseResponse(response.data);
    return _jsonToDeleteVote(responseData);
  }

  @override
  Future<UpdateVote> updateVote({required String distinctId, required String targetId, required String category}) async {
    final response = await dio.put(
      '/votes/update',
      data: {
        'api_key': Environment.apiKey,
        'campaign': Environment.campaign,
        'distinct_id': distinctId,
        'target_id': targetId,
        'category': category,
      }
    );
    final Map<String, dynamic> responseData = _parseResponse(response.data);
    return _jsonToUpdateVote(responseData);
  }
}
