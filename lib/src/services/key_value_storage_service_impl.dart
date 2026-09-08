import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'key_value_storage_service.dart';
import 'storage_keys.dart';

/// Guarda [StorageKeys.token] y [StorageKeys.uid] cifrados
/// (`flutter_secure_storage`); el resto va en `shared_preferences`.
///
/// Opciones explícitas de `flutter_secure_storage` para el cifrado en
/// reposo: en Android fuerza `EncryptedSharedPreferences` (respaldado por
/// el Android Keystore); en iOS usa `first_unlock` — el valor solo es
/// accesible después del primer desbloqueo tras un reinicio, y no se
/// incluye en backups de iCloud/iTunes.
class KeyValueStorageServiceImpl extends KeyValueStorageService {
  static const _secureKeys = {StorageKeys.token, StorageKeys.uid};
  static const _secureStorage = FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
    iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock),
  );

  Future<SharedPreferences> getSharedPrefs() async {
    return await SharedPreferences.getInstance();
  }

  T? _decode<T>(String raw) {
    if (T == String) return raw as T?;
    if (T == int) return int.tryParse(raw) as T?;
    if (T == bool) return (raw == 'true') as T?;
    throw UnimplementedError('Set not implemented for Type $T');
  }

  @override
  Future<T?> getValue<T>(String key) async {
    if (_secureKeys.contains(key)) {
      final secureValue = await _secureStorage.read(key: key);
      if (secureValue != null) return _decode<T>(secureValue);

      // Migración: si el usuario ya tenía el valor guardado en
      // SharedPreferences (texto plano) antes de pasar a almacenamiento
      // cifrado, se mueve en el primer read en vez de forzar un logout.
      final pref = await getSharedPrefs();
      final legacyValue = pref.getString(key);
      if (legacyValue == null) return null;
      await _secureStorage.write(key: key, value: legacyValue);
      await pref.remove(key);
      return _decode<T>(legacyValue);
    }

    final pref = await getSharedPrefs();
    switch (T) {
      case const (int):
        return pref.getInt(key) as T?;
      case const (String):
        return pref.getString(key) as T?;
      case const (bool):
        return pref.getBool(key) as T?;
      default:
        throw UnimplementedError('Set not implemented for Type ${T.runtimeType}');
    }
  }

  @override
  Future<bool> removeKey(String key) async {
    if (_secureKeys.contains(key)) {
      await _secureStorage.delete(key: key);
      final pref = await getSharedPrefs();
      await pref.remove(key); // por si queda un valor legado sin migrar
      return true;
    }

    final pref = await getSharedPrefs();
    return await pref.remove(key);
  }

  @override
  Future<void> clearAll() async {
    final pref = await getSharedPrefs();
    await pref.clear();
    for (final key in _secureKeys) {
      await _secureStorage.delete(key: key);
    }
  }

  @override
  Future<void> setKeyValue<T>(String key, T value) async {
    if (_secureKeys.contains(key)) {
      await _secureStorage.write(key: key, value: value.toString());
      return;
    }

    final pref = await getSharedPrefs();
    switch (T) {
      case const (int):
        pref.setInt(key, value as int);
        break;
      case const (String):
        pref.setString(key, value as String);
        break;
      case const (bool):
        pref.setBool(key, value as bool);
        break;
      default:
        throw UnimplementedError('Set not implemented for Type ${T.runtimeType}');
    }
  }
}
