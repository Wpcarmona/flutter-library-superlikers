import '../../../domain/domain.dart';
import '../../datasource/datasource.dart';

class CommentRepositoryImpl extends CommentRepository {
  final CommentDatasource datasource;

  CommentRepositoryImpl([CommentDatasource? datasource])
      : datasource = datasource ?? CommentDatasourceImpl();

  @override
  Future<ListComments> listComments({
    required String token,
    required String targetId,
  }) {
    return datasource.listComments(token: token, targetId: targetId);
  }

  @override
  Future<CommentActivityResult> createComment({
    required String token,
    required String targetId,
    required String body,
    String? category,
    List<String>? tags,
    String? pushRedirectUrl,
  }) {
    return datasource.createComment(
      token: token,
      targetId: targetId,
      body: body,
      category: category,
      tags: tags,
      pushRedirectUrl: pushRedirectUrl,
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
  }) {
    return datasource.updateComment(
      token: token,
      targetId: targetId,
      commentId: commentId,
      body: body,
      category: category,
      tags: tags,
      pushRedirectUrl: pushRedirectUrl,
    );
  }

  @override
  Future<DeleteComment> deleteComment({
    required String token,
    required String distinctId,
    required String targetId,
    required String commentId,
  }) {
    return datasource.deleteComment(
      token: token,
      distinctId: distinctId,
      targetId: targetId,
      commentId: commentId,
    );
  }
}
