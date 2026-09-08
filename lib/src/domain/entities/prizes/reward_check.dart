class RewardCheck {
  final String ok;
  final bool isavailable;
  final bool isredeemable;
  final bool isparticipantcanredeem;
  final String errorParticipantCheck;

  RewardCheck({
    required this.ok,
    required this.isavailable,
    required this.isredeemable,
    required this.isparticipantcanredeem,
    required this.errorParticipantCheck,
  });
}
