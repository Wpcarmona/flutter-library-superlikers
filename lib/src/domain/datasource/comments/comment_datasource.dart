import '../../entities/entities.dart';

abstract class CommentDatasource {
  Future<ListComments> listComments({
    required String token,
    required String targetId,
  });

  Future<CommentActivityResult> createComment({
    required String token,
    required String targetId,
    required String body,
    String? category,
    List<String>? tags,
    String? pushRedirectUrl,
  });

  Future<CommentActivityResult> updateComment({
    required String token,
    required String targetId,
    required String commentId,
    required String body,
    String? category,
    List<String>? tags,
    String? pushRedirectUrl,
  });

  Future<DeleteComment> deleteComment({
    required String token,
    required String distinctId,
    required String targetId,
    required String commentId,
  });
}
