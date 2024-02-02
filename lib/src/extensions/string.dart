part of '../../json_dart.dart';

extension JsonStringExt on String {
  static const newLineN = '\n';
  static const newLineRN = '\r\n';

  JsonList get jsonList => jsonDecoder(this) as JsonList;

  JsonMap get jsonMap => jsonDecoder(this) as JsonMap;

  /// !) All whitespaces and newlines with edges will be removed.
  String get sjsonWithoutWrappers {
    final s = trim();
    if (s.startsWith('{')) {
      return _sjsonWithoutWrappers('{');
    }

    if (s.startsWith('[')) {
      return _sjsonWithoutWrappers('[');
    }

    if (s.startsWith('"')) {
      return _sjsonWithoutWrappers('"');
    }

    return s;
  }

  /// [beginWrapper] The first symbol of wrapped string.
  String _sjsonWithoutWrappers(String beginWrapper) {
    assert(beginWrapper.isNotEmpty, 'Wrapper should be defined.');

    var s = replaceFirst(beginWrapper, '');
    s = s.substring(0, s.length - beginWrapper.length);
    final lines = const convert.LineSplitter().convert(s);
    var r = lines;
    if (lines.length >= 2) {
      // take the count of spaces from the second line
      final leadingSpaces = lines[1].length - lines[1].trimLeft().length;
      if (leadingSpaces > 0) {
        r = lines
            .map((line) => line.length < leadingSpaces
                ? line
                : line.substring(leadingSpaces))
            .toList();
      }
    }

    return r.join(newLineN).trim();
  }
}
