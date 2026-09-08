/// Config, entidades de dominio y contratos (datasource/repository
/// abstractos) compartidos entre las apps Flutter de Superlikers.
///
/// Uso típico en el `main_dev.dart` / `main_prod.dart` de cada app:
///
/// ```dart
/// import 'package:superlikers_core/superlikers_core.dart';
///
/// void main() {
///   SuperlikersConfig.setupDev(
///     campaign: 'uo',
///     apiKey: 'aaa138b17fe628900805dba5650c0b98',
///   );
///   app.bootstrap();
/// }
/// ```
///
/// Las implementaciones concretas (modelos JSON, mappers, datasource y
/// repository impl) están en `package:superlikers_core/infraestructure.dart`
/// — se importa aparte, normalmente con alias (`as data`), porque sus
/// modelos comparten nombre con las entidades de dominio de aquí (por
/// ejemplo `Participant`).
library;

export 'src/config/config.dart';
export 'src/network/network.dart';
export 'src/services/services.dart';
export 'src/domain/domain.dart';
