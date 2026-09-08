/// Formz inputs con validaciones reutilizables entre las apps Flutter de
/// Superlikers (email, password, teléfono, OTP, etc). Cada input expone sus
/// reglas (largo mínimo/máximo, requisitos de password, patrón, etc) como
/// parámetros opcionales en el constructor para poder ajustarlas por app sin
/// tener que tocar la librería.
///
/// Se exporta por separado de `superlikers_core.dart` para que quien solo
/// necesite la capa de datos no cargue con la dependencia de `formz`.
library;

export 'src/inputs/inputs.dart';
