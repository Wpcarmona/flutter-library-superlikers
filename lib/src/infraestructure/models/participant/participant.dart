class Participant {
  String id;
  String email;
  String name;
  String avatar;
  String uid;
  dynamic uidType;
  String state;
  Map<String, dynamic> properties;

  Participant({
    required this.id,
    required this.email,
    required this.name,
    required this.avatar,
    required this.uid,
    required this.uidType,
    required this.state,
    this.properties = const {},
  });

  static const _knownKeys = {
    '_id',
    'email',
    'name',
    'avatar',
    'uid',
    'uid_type',
    'state',
  };

  factory Participant.fromJson(Map<String, dynamic> json) => Participant(
        id: json["_id"] ?? '',
        email: json["email"] ?? '',
        name: json["name"] ?? '',
        avatar: json["avatar"] ?? '',
        uid: json["uid"] ?? '',
        uidType: json["uid_type"],
        state: json["state"] ?? '',
        properties: Map<String, dynamic>.from(json)
          ..removeWhere((key, _) => _knownKeys.contains(key)),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "email": email,
        "name": name,
        "avatar": avatar,
        "uid": uid,
        "uid_type": uidType,
        "state": state,
        ...properties,
      };
}
