/// Llaves comunes usadas por [KeyValueStorageService] entre todas las apps.
/// Cada app puede seguir definiendo sus propias llaves adicionales
/// (por ejemplo `fcmToken`, `welcomeComplete`) como simples `String`.
class StorageKeys {
  static const String token = 'token';
  static const String uid = 'uid';
}
