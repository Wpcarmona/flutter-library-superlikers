import '../participant/participant.dart';

class Comment {
  final String id;
  final bool admin;
  final bool archived;
  final String atype;
  final String category;
  final DateTime executeDate;
  final int extraPoints;
  final String moderation;
  final String ownerName;
  final int points;
  final String state;
  final dynamic team;
  final Participant participant;
  final dynamic editableBy;
  final dynamic deleteableBy;
  final bool voted;
  final String body;
  final List<String> tags;
  final List<String> participantsTags;

  Comment({
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
    required this.participant,
    required this.editableBy,
    required this.deleteableBy,
    required this.voted,
    required this.body,
    required this.tags,
    required this.participantsTags,
  });
}

class ListComments {
  final String ok;
  final int page;
  final int pageSize;
  final int totalPages;
  final int totalData;
  final List<Comment> comments;

  ListComments({
    required this.ok,
    required this.page,
    required this.pageSize,
    required this.totalPages,
    required this.totalData,
    required this.comments,
  });
}
