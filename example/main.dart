// ignore_for_file: avoid_print

import 'package:json_dart/json_dart.dart';

void main() {
  // bluring a key
  print({'api_key': '12345-my-key-value'}.blured());

  // keepeing significant fields only
  print(<String, dynamic>{
    // null
    'null': null,
    // bool
    'false_bool': false,
    'ok': true,
    // int
    'zero_int': 0,
    // double
    'positive_zero_double': 0.0,
    'negative_zero_double': -0.0,
    // string
    'empty_string': '',
    // list
    'empty_list': <int>[],
    // map
    'empty_map': <String, dynamic>{},
    // set
    'empty_set': <int>{},
  }.jsonWithSignificantFields);
}
