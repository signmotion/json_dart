part of '../../json_dart.dart';

/// See [ObjectJsonExt.toEncodable].
extension JsonVector2Ext on Vector2 {
  List<double> get json => [x, y];
}
