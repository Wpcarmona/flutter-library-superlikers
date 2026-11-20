import 'package:flutter_test/flutter_test.dart';
import 'package:superlikers_core/infraestructure.dart' as data;
import 'package:superlikers_core/superlikers_core.dart' as domain;

void main() {
  test('LoginResponse tolera campos faltantes o nulos', () {
    final login = data.LoginResponse.fromJson({'ok': true, 'participant': null});
    expect(login.ok, 'true');
    expect(login.token, '');
    expect(login.message, '');
  });

  test('ParticipantPublicInfoResponse tolera tipos inesperados', () {
    final info = data.ParticipantPublicInfoResponse.fromJson({
      'ok': true,
      'object': {
        'uid': 123,
        'points': '10.5',
        'bad_email': 'true',
        'last_activity_at': 'no-es-fecha',
        'tags': ['a', null, 2],
        'campo_propio': 'x',
      },
    }).object;
    expect(info.uid, '123');
    expect(info.points, 10.5);
    expect(info.badEmail, isTrue);
    expect(info.lastActivityAt, DateTime.fromMillisecondsSinceEpoch(0));
    expect(info.tags, ['a', '2']);
    expect(info.properties['campo_propio'], 'x');
  });

  test('ParticipantPublicInfoResponse sin object no lanza', () {
    expect(() => data.ParticipantPublicInfoResponse.fromJson({}), returnsNormally);
  });

  test('ranking avanzado conserva data y points_by_ptype de cualquier campaign', () {
    final list = data.RankingMapper.toEntityList(
      data.AdvancedRankingResponse.fromJson({
        'ok': true,
        'data': [
          {
            'name': 'Ana',
            'points': '12',
            'ranking': 1.0,
            'points_by_ptype': {'xp': 5},
            'data': {'email': 'a@b.c', 'avatar_profile': 'https://x/y.png', 'rol': 'mesero'},
          },
          'no-es-mapa',
        ],
      }),
    );
    expect(list, hasLength(1));
    final row = list.single;
    expect(row.points, 12);
    expect(row.ranking, 1);
    expect(row.pointsByPtype, {'xp': 5});
    expect(row.data['avatar_profile'], 'https://x/y.png');
    expect(row.data['nombres'], ''); // campos tipados conservan su default
  });

  test('ranking del participante no requiere el schema de OXXO', () {
    final domain.AdvancedRanking rank = data.ParticipantMapper.participantRankToEntity(
      data.ParticipantRankingResponse.fromJson({
        'ok': 'true',
        'data': {
          'name': 'Ana',
          'last_name': 'Pérez',
          'points': 7,
          'ranking': 3,
          'data': {'email': 'a@b.c', 'rol': 'bartender'},
        },
      }),
    );
    expect(rank.name, 'Ana');
    expect(rank.lastName, 'Pérez');
    expect(rank.ranking, 3);
    expect(rank.data['rol'], 'bartender');
  });
}
