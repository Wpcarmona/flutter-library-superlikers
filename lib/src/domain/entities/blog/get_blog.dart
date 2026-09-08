class GetBlog {
  final String ok;
  final GetBlogObject object;

  GetBlog({
    required this.ok,
    required this.object,
  });
}

class GetBlogObject {
  final String id;
  final bool admin;
  final bool archived;
  final String atype;
  final dynamic category;
  final String executeDate;
  final int extraPoints;
  final String moderation;
  final String ownerName;
  final int points;
  final String state;
  final dynamic team;
  final String permalink;
  final dynamic shortUrl;
  final dynamic facebookTabUrl;
  final int votesCount;
  final int votesAverage;
  final int votesUp;
  final int votesDown;
  final String title;
  final String body;
  final dynamic editableBy;
  final dynamic deleteableBy;
  final int createdAt;
  final String format;
  final List<dynamic> tags;
  final List<dynamic> participantsTags;

  GetBlogObject({
    required this.id,
    required this.admin,
    required this.archived,
    required this.atype,
    required this.category,
    required this.executeDate,
    required this.extraPoints,
    required this.moderation,
    required this.ownerName,
    required this.points,
    required this.state,
    required this.team,
    required this.permalink,
    required this.shortUrl,
    required this.facebookTabUrl,
    required this.votesCount,
    required this.votesAverage,
    required this.votesUp,
    required this.votesDown,
    required this.title,
    required this.body,
    required this.editableBy,
    required this.deleteableBy,
    required this.createdAt,
    required this.format,
    required this.tags,
    required this.participantsTags,
  });
}
