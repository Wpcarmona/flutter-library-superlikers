class AdvancedRanking {
  final String name;
  final String firstName;
  final String lastName;
  final int votes;
  final int points;
  final int rankingPoints;
  final int level;
  final Map<String, int> pointsByPtype;
  final dynamic colour;
  final int ranking;
  final Map<String, dynamic> data;

  AdvancedRanking({
    required this.name,
    required this.firstName,
    required this.lastName,
    required this.votes,
    required this.points,
    required this.rankingPoints,
    required this.level,
    required this.pointsByPtype,
    required this.colour,
    required this.ranking,
    required this.data,
  });
}
