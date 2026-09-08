import 'package:flutter_test/flutter_test.dart';

import 'package:superlikers_core/superlikers_core.dart';

void main() {
  test('setupDev configures the dev environment with the given credentials', () {
    SuperlikersConfig.setupDev(campaign: 'uo', apiKey: 'dev-key');

    expect(SuperlikersConfig.isDev, isTrue);
    expect(SuperlikersConfig.isProd, isFalse);
    expect(SuperlikersConfig.baseUrl, 'https://api.superlikerslabs.com/v1');
    expect(SuperlikersConfig.campaign, 'uo');
    expect(SuperlikersConfig.apiKey, 'dev-key');
    expect(Environment.baseUrl, SuperlikersConfig.baseUrl);
  });

  test('setupProd configures the prod environment with the given credentials', () {
    SuperlikersConfig.setupProd(campaign: 'uo', apiKey: 'prod-key');

    expect(SuperlikersConfig.isProd, isTrue);
    expect(SuperlikersConfig.baseUrl, 'https://api.superlikers.com/v1');
    expect(SuperlikersConfig.apiKey, 'prod-key');
  });

  test('createPinnedDio rejects a non-https baseUrl', () {
    expect(
      () => createPinnedDio(baseUrl: 'http://api.superlikers.com/v1'),
      throwsArgumentError,
    );
  });

  test('createPinnedDio accepts an https baseUrl and disables auto-redirects', () {
    final dio = createPinnedDio(baseUrl: 'https://api.superlikers.com/v1');

    expect(dio.options.baseUrl, 'https://api.superlikers.com/v1');
    expect(dio.options.followRedirects, isFalse);
  });
}
