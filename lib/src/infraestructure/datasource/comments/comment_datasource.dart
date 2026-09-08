import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../config/environment.dart';
import '../../../domain/domain.dart';
import '../../../network/pinned_dio.dart';
import '../../mappers/mapper.dart';
import '../../models/models.dart';

class CommentDatasourceImpl extends CommentDatasource {
  final dio = createPinnedDio(baseUrl: Environment.baseUrl);

  Map<String, dynamic> _parseResponse(dynamic raw) =>
      raw is String ? jsonDecode(raw) : Map<String, dynamic>.from(raw as Map);

  @override
  Future<ListComments> listComments({
    required String token,
    required String targetId,
  }) async {
    final response = await dio.post(
      '/microsite/comments/list',
      options: Options(headers: {'Authorization': 'Bearer $token'}),
      data: {
        'api_key': Environment.apiKey,
        'campaign': Environment.campaign,
        'target_id': targetId,
      },
    );
    final responseData = _parseResponse(response.data);
    return CommentMapper.listCommentsToEntity(ListCommentsResponse.fromJson(responseData));
  }

  @override
  Future<CommentActivityResult> createComment({
    required String token,
    required String targetId,
    required String body,
    String? category,
    List<String>? tags,
    String? pushRedirectUrl,
  }) async {
    final response = await dio.post(
      '/microsite/comments',
      options: Options(headers: {'Authorization': 'Bearer $token'}),
      data: {
        'api_key': Environment.apiKey,
        'campaign': Environment.campaign,
        'target_id': targetId,
        'comment': {
          'body': body,
          if (category != null) 'category': category,
          if (tags != null && tags.isNotEmpty) 'tags': tags,
          if (pushRedirectUrl != null) 'push_redirect_url': pushRedirectUrl,
        },
      },
    );
    final responseData = _parseResponse(response.data);
    return CommentMapper.commentActivityResultToEntity(
      CommentActivityResultResponse.fromJson(responseData),
    );
  }

  @override
  Future<CommentActivityResult> updateComment({
    required String token,
    required String targetId,
    required String commentId,
    required String body,
    String? category,
    List<String>? tags,
    String? pushRedirectUrl,
  }) async {
    final response = await dio.post(
      '/microsite/comments/update',
      options: Options(headers: {'Authorization': 'Bearer $token'}),
      data: {
        'api_key': Environment.apiKey,
        'campaign': Environment.campaign,
        'target_id': targetId,
        'comment_id': commentId,
        'comment': {
          'body': body,
          if (category != null) 'category': category,
          if (tags != null && tags.isNotEmpty) 'tags': tags,
          if (pushRedirectUrl != null) 'push_redirect_url': pushRedirectUrl,
        },
      },
    );
    final responseData = _parseResponse(response.data);
    return CommentMapper.commentActivityResultToEntity(
      CommentActivityResultResponse.fromJson(responseData),
    );
  }

  @override
  Future<DeleteComment> deleteComment({
    required String token,
    required String distinctId,
    required String targetId,
    required String commentId,
  }) async {
    final response = await dio.post(
      '/microsite/comments/delete',
      options: Options(headers: {'Authorization': 'Bearer $token'}),
      data: {
        'api_key': Environment.apiKey,
        'campaign': Environment.campaign,
        'distinct_id': distinctId,
        'target_id': targetId,
        'comment_id': commentId,
      },
    );
    final responseData = _parseResponse(response.data);
    return CommentMapper.deleteCommentToEntity(DeleteCommentResponse.fromJson(responseData));
  }
}
