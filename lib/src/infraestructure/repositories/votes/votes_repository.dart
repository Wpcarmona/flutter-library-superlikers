import '../../../domain/datasource/votes/votes_datasource.dart';
import '../../../domain/entities/votes/votes.dart';
import '../../../domain/repositories/votes/votes_repository.dart';
import '../../datasource/votes/votes_datasource.dart';

class VotesRepositoryImpl extends VotesRepository {
  final VotesDatasource datasource;

  VotesRepositoryImpl([VotesDatasource? datasource])
    : datasource = datasource ?? VotesDatasourceImpl();

  @override
  Future<CountVotesPublication> countVotesPublication({
    String? distinctId,
    required String targetId,
  }) {
    return datasource.countVotesPublication(
      distinctId: distinctId,
      targetId: targetId,
    );
  }

  @override
  Future<CreateVote> createVote({
    required String distinctId,
    required String targetId,
    required String category,
    bool? toggle,
  }) {
    return datasource.createVote(
      distinctId: distinctId,
      targetId: targetId,
      category: category,
      toggle: toggle,
    );
  }

  @override
  Future<DeleteVote> deleteVote({
    required String distinctId,
    required String targetId,
  }) {
    return datasource.deleteVote(distinctId: distinctId, targetId: targetId);
  }

  @override
  Future<UpdateVote> updateVote({
    required String distinctId,
    required String targetId,
    required String category,
  }) {
    return datasource.updateVote(
      distinctId: distinctId,
      targetId: targetId,
      category: category,
    );
  }
}
