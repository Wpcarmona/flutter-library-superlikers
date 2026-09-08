import '../../../domain/entities/entities.dart' as domain;
import '../../models/models.dart' as infra;
import '../participant/participant_mapper.dart';

class CommentMapper {
  static domain.ListComments listCommentsToEntity(infra.ListCommentsResponse response) =>
      domain.ListComments(
        ok: response.ok,
        page: response.data.page,
        pageSize: response.data.pageSize,
        totalPages: response.data.totalPages,
        totalData: response.data.totalData,
        comments: response.data.comments
            .map(
              (c) => domain.Comment(
                id: c.id,
                admin: c.admin,
                archived: c.archived,
                atype: c.atype,
                category: c.category,
                executeDate: c.executeDate,
                extraPoints: c.extraPoints,
                moderation: c.moderation,
                ownerName: c.ownerName,
                points: c.points,
                state: c.state,
                team: c.team,
                participant: ParticipantMapper.toEntity(c.participant),
                editableBy: c.editableBy,
                deleteableBy: c.deleteableBy,
                voted: c.voted,
                body: c.body,
                tags: c.tags,
                participantsTags: c.participantsTags,
              ),
            )
            .toList(),
      );

  static domain.CommentActivityResult commentActivityResultToEntity(
    infra.CommentActivityResultResponse response,
  ) =>
      domain.CommentActivityResult(
        ok: response.ok,
        activityState: response.activityState,
        activityPoints: response.activityPoints,
        message: response.message,
        executionError: response.executionError,
        object: domain.CommentActivity(
          id: response.object.id,
          type: response.object.type,
          activityCount: response.object.activityCount,
          atype: response.object.atype,
          category: response.object.category,
          moderation: response.object.moderation,
          points: response.object.points,
          state: response.object.state,
          createdAt: response.object.createdAt,
          module: response.object.module,
          name: response.object.name,
          team: response.object.team,
          participant: ParticipantMapper.toEntity(response.object.participant),
          votesCount: response.object.votesCount,
          tags: response.object.tags,
          participantsTags: response.object.participantsTags,
          pushRedirectUrl: response.object.pushRedirectUrl,
        ),
      );

  static domain.DeleteComment deleteCommentToEntity(infra.DeleteCommentResponse response) =>
      domain.DeleteComment(
        ok: response.ok,
        activityState: response.activityState,
        activityPoints: response.activityPoints,
        message: response.message,
      );
}
