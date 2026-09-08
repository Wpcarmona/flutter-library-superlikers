import '../../entities/votes/votes.dart';

abstract class VotesDatasource {
  Future<CountVotesPublication> countVotesPublication({
    String? distinctId,
    required String targetId,
  });

  Future<CreateVote> createVote({
    required String distinctId,
    required String targetId,
    required String category,
    bool? toggle,
  });

  Future<DeleteVote> deleteVote({
    required String distinctId,
    required String targetId,
  });

  Future<UpdateVote> updateVote({
    required String distinctId,
    required String targetId,
    required String category,
  });
}
