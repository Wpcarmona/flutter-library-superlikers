/// Lectura tolerante de campos JSON de Superlikers.
///
/// El backend a veces omite campos, manda `null`, números como texto o
/// booleanos como `0/1`. Un cast directo lanza un `TypeError` que las apps no
/// esperan; estas funciones devuelven un valor por defecto en su lugar.
library;

String readString(dynamic value, [String fallback = '']) =>
    value == null ? fallback : value.toString();

String? readStringOrNull(dynamic value) => value?.toString();

int readInt(dynamic value, [int fallback = 0]) {
  if (value is int) return value;
  if (value is num) return value.round();
  if (value is String) {
    final v = value.trim();
    return int.tryParse(v) ?? double.tryParse(v)?.round() ?? fallback;
  }
  if (value is bool) return value ? 1 : 0;
  return fallback;
}

int? readIntOrNull(dynamic value) => value == null ? null : readInt(value);

double readDouble(dynamic value, [double fallback = 0]) {
  if (value is num) return value.toDouble();
  if (value is String) return double.tryParse(value.trim()) ?? fallback;
  return fallback;
}

num readNum(dynamic value, [num fallback = 0]) {
  if (value is num) return value;
  if (value is String) return num.tryParse(value.trim()) ?? fallback;
  return fallback;
}

bool readBool(dynamic value, [bool fallback = false]) {
  if (value is bool) return value;
  if (value is num) return value != 0;
  if (value is String) {
    final v = value.trim().toLowerCase();
    if (v == 'true' || v == '1') return true;
    if (v == 'false' || v == '0') return false;
  }
  return fallback;
}

bool? readBoolOrNull(dynamic value) => value == null ? null : readBool(value);

DateTime readDate(dynamic value) {
  if (value is String) {
    final parsed = DateTime.tryParse(value);
    if (parsed != null) return parsed;
  }
  if (value is int) return DateTime.fromMillisecondsSinceEpoch(value);
  return DateTime.fromMillisecondsSinceEpoch(0);
}

List<String> readStringList(dynamic value) => value is List
    ? [for (final x in value) if (x != null) x.toString()]
    : <String>[];

Map<String, dynamic> readMap(dynamic value) =>
    value is Map ? Map<String, dynamic>.from(value) : <String, dynamic>{};
