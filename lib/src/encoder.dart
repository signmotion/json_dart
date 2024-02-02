part of '../json_dart.dart';

String jsonEncoder(
  dynamic o, {
  String indent = '  ',
  Object? Function(dynamic object)? toEncodable,
}) =>
    convert.JsonEncoder.withIndent(
      indent.isEmpty ? null : indent,
      toEncodable ?? (o) => '$o',
    ).convert(o);
