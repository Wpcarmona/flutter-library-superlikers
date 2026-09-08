import '../../../domain/entities/votes/votes.dart' as domain;
import '../../models/votes/votes.dart' as infra;

class VotesMapper {
  static domain.CreateVote getCreateVoteToEntity(infra.VotesResponse response) {
    return domain.CreateVote(
      ok: response.ok,
      message: response.message,
    );
  }

  static domain.UpdateVote getUpdateVoteToEntity(infra.VotesResponse response) {
    return domain.UpdateVote(
      ok: response.ok,
      message: response.message,
    );
  }

  static domain.DeleteVote getDeleteVoteToEntity(infra.VotesResponse response) {
    return domain.DeleteVote(
      ok: response.ok,
      message: response.message,
    );
  }

  static domain.CountVotesPublication countVotesPublicationToEntity(infra.CountVotesPublicationResponse response) {
    return domain.CountVotesPublication(
      ok: response.ok,
      data: domain.CountVotesData(
        currentParticipantVotedCategory: response.data.currentParticipantVotedCategory,
        likes: response.data.likes,
        supports: response.data.supports,
        interests: response.data.interests,
        curiosities: response.data.curiosities,
       ),
    );
  }
}
