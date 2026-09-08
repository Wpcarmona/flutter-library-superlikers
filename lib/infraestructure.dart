/// Implementaciones concretas del SDK: modelos JSON (`fromJson`/`toJson`),
/// mappers modelo -> entidad, datasource (Dio) y repository.
///
/// Se importa con alias, por convención `as data`, porque sus modelos
/// (ej. `Participant`) comparten nombre con las entidades de dominio
/// expuestas por `package:superlikers_core/superlikers_core.dart`:
///
/// ```dart
/// import 'package:superlikers_core/superlikers_core.dart';
/// import 'package:superlikers_core/infraestructure.dart' as data;
///
/// final AuthRepository authRepository = data.AuthRepositoryImpl();
/// ```
library;

export 'src/infraestructure/infraestructure.dart';
