part of '../../json_dart.dart';

extension JsonObjectExt on Object {
  /// Returns formatted JSON in string.
  String get sjson => jsonEncoder(this, toEncodable: toEncodable);

  /// JSON in one line string.
  String get sjsonInLine =>
      jsonEncoder(this, indent: '', toEncodable: toEncodable);

  /// JSON in one line string without wrappers.
  String get sjsonInLineWithoutWrappers => sjsonInLine.sjsonWithoutWrappers;

  /// For encode the specific objects.
  static Object toEncodable(dynamic o) {
    if (o is Vector2) {
      return o.json;
    }

    return '$o';
  }

  static String s(dynamic v) => v == null ? 'null' : (v as Object).sjson;
}
