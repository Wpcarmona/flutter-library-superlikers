import 'superlikers_config.dart';

/// Fachada de sólo lectura sobre [SuperlikersConfig], pensada para que los
/// datasource lean de aquí (`Environment.baseUrl`, `Environment.apiKey`,
/// `Environment.campaign`) igual que en los proyectos originales.
class Environment {
  static String get baseUrl => SuperlikersConfig.baseUrl;
  static String get campaign => SuperlikersConfig.campaign;
  static String get apiKey => SuperlikersConfig.apiKey;
}
