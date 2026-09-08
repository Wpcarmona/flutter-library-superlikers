class Participant {
  final String id;
  final String email;
  final String name;
  final String avatar;
  final String uid;
  final String? uidType;
  final String state;

  /// Cualquier campo que el backend devuelva además de los de arriba.
  /// El schema del participante lo define cada campaign/cliente (ej. OXXO
  /// puede traer `plaza`/`region`/`tienda`, otro cliente puede traer
  /// `cedula`, etc.), así que no se listan como campos fijos: quedan
  /// disponibles tal cual vinieron del JSON.
  final Map<String, dynamic> properties;

  Participant({
    required this.id,
    required this.email,
    required this.name,
    required this.avatar,
    required this.uid,
    this.uidType,
    required this.state,
    this.properties = const {},
  });
}
