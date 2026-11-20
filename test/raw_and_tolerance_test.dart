import 'package:flutter_test/flutter_test.dart';
import 'package:superlikers_core/infraestructure.dart' as data;

void main() {
  test('Reward conserva el JSON original y tolera localizable numérico', () {
    final response = data.RewardResponse.fromJson({
      'ok': true,
      'object': [
        {
          '_id': 'r1',
          'name': 'Premio',
          'points': '100',
          'metadata': {
            'localizable': 1,
            'brands': [
              {'brand_id': 7, 'name': 'Marca'}
            ],
          },
          'sponsor': 'Coca-Cola',
        },
        'no-es-mapa',
      ],
    });
    final reward = data.PrizesMapper.rewardToEntity(response.object.single);
    expect(reward.points, 100);
    expect(reward.raw['sponsor'], 'Coca-Cola');
    expect((reward.raw['metadata'] as Map)['brands'], isNotEmpty);
  });

  test('Respuestas sin listas ni objetos anidados no lanzan', () {
    expect(() => data.RewardResponse.fromJson({'ok': 'true'}), returnsNormally);
    expect(() => data.AchievementResponse.fromJson({}), returnsNormally);
    expect(() => data.EntriesResponseApi.fromJson({'ok': 'true'}), returnsNormally);
  });
}
