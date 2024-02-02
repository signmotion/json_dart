part of '../../json_dart.dart';

extension JsonCleanProto3Ext on JsonMap {
  /// Replace all value of fields with "key-named" value to [replacer].
  Map<String, dynamic> blured({
    List<String> nameContains = const <String>[
      'key',
      'passw',
      'psw',
      'secret',
    ],
    String replacer = '*',
  }) =>
      map((k, v) {
        var r = v;
        if (v is String) {
          if (nameContains
              .firstWhere(
                (nc) => k.contains(nc),
                orElse: () => '',
              )
              .isNotEmpty) {
            r = v.replaceAll(RegExp(r'.'), replacer);
          }
        }

        return MapEntry(k, r);
      });

  /// Removes all empty fields. The "empty fields" according to Proto3:
  /// https://protobuf.dev/programming-guides/proto3/#default
  /// !) Pay attention on the nested maps. See tests.
  Map<String, dynamic> get jsonWithSignificantFields => map((k, v) =>
      MapEntry(k, v is Map<String, dynamic> ? v.jsonWithSignificantFields : v))
    ..removeWhere((k, v) =>
        (v == null) ||
        (v is bool && !v) ||
        (v is int && v == 0) ||
        (v is double && (v == 0.0 || v == -0.0)) ||
        (v is String && v.isEmpty) ||
        (v is Enum && v.index == 0) ||
        (v is List && v.isEmpty) ||
        (v is Map && v.isEmpty) ||
        (v is Set && v.isEmpty) ||
        false);

  String get sJsonWithSignificantFields => '$jsonWithSignificantFields';
}
