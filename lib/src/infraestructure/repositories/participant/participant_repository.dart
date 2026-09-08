import '../../../domain/domain.dart';
import '../../datasource/datasource.dart';

class ParticipantRepositoryImpl extends ParticipantRepository {
  final ParticipantDatasource datasource;

  ParticipantRepositoryImpl([ParticipantDatasource? datasource])
      : datasource = datasource ?? ParticipantDatasourceImpl();

  @override
  Future<ParticipantPublicInfo> getParticipantPublicInfo({required String token}) {
    return datasource.getParticipantPublicInfo(token: token);
  }

  @override
  Future<AdvancedRanking> getParticipantRanking({
    required String apiKey,
    required String campaign,
    required String distinctId,
  }) {
    return datasource.getParticipantRanking(
      apiKey: apiKey,
      campaign: campaign,
      distinctId: distinctId,
    );
  }

  @override
  Future<UpdateAvatar> updateAvatar({
    required String token,
    required String distinctId,
    required String url,
  }) {
    return datasource.updateAvatar(token: token, distinctId: distinctId, url: url);
  }

  @override
  Future<UpdateUser> updateUser({
    required String token,
    required String distinctId,
    String? name,
    String? phone,
    String? cargo,
    String? fcmToken,
    String? autorizationNumber,
  }) {
    return datasource.updateUser(
      token: token,
      distinctId: distinctId,
      name: name,
      phone: phone,
      cargo: cargo,
      fcmToken: fcmToken,
      autorizationNumber: autorizationNumber,
    );
  }

  @override
  Future<List<Participant>> searchParticipants({
    required String token,
    List<String>? tags,
  }) {
    return datasource.searchParticipants(token: token, tags: tags);
  }

  @override
  Future<ParticipantPoints> getParticipantPoints({required String token}) {
    return datasource.getParticipantPoints(token: token);
  }

  @override
  Future<RedeemPoints> redeemPoints({required String token, required num points}) {
    return datasource.redeemPoints(token: token, points: points);
  }
}
