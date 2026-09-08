class CountVotesPublication {
  final String ok;
  final CountVotesData data;

  CountVotesPublication({
    required this.ok,
    required this.data,
  });
}

class CountVotesData {
  final dynamic currentParticipantVotedCategory;
  final int likes;
  final int supports;
  final int interests;
  final int curiosities;

  CountVotesData({
    required this.currentParticipantVotedCategory,
    required this.likes,
    required this.supports,
    required this.interests,
    required this.curiosities,
  });
}
