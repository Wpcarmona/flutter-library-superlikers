/// Configuración global del SDK: ambiente (dev/prod) y credenciales del
/// cliente actual (campaign + apiKey).
///
/// Cada app consumidora llama a [setupDev] o [setupProd] una sola vez, al
/// arrancar (en su `main_dev.dart` / `main_prod.dart`), pasando la
/// `campaign` y el `apiKey` que le correspondan a ese cliente. Las URLs base
/// de dev/prod son las mismas para todos los clientes, así que viven aquí.
class SuperlikersConfig {
  static const String _devBaseUrl = 'https://api.superlikerslabs.com/v1';
  static const String _prodBaseUrl = 'https://api.superlikers.com/v1';

  static late String _flavor;
  static late String _campaign;
  static late String _apiKey;

  static String get flavor => _flavor;
  static bool get isDev => _flavor == 'dev';
  static bool get isProd => _flavor == 'prod';

  static String get baseUrl => isProd ? _prodBaseUrl : _devBaseUrl;
  static String get campaign => _campaign;
  static String get apiKey => _apiKey;

  static void setupDev({required String campaign, required String apiKey}) {
    _flavor = 'dev';
    _campaign = campaign;
    _apiKey = apiKey;
  }

  static void setupProd({required String campaign, required String apiKey}) {
    _flavor = 'prod';
    _campaign = campaign;
    _apiKey = apiKey;
  }
}
