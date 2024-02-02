import 'package:json_dart/json_dart.dart';
import 'package:test/test.dart';

import 'helpers/types.dart';

void main() {
  test('blured', () {
    expect({'api_key': '12345-ab'}.blured(), {'api_key': '********'});
    expect({'password': '12345-ab'}.blured(), {'password': '********'});
    expect({'passw': '12345-ab'}.blured(), {'passw': '********'});
    expect({'psw': '12345-ab'}.blured(), {'psw': '********'});
    expect({'pswd': '12345-ab'}.blured(), {'pswd': '********'});
    expect({'my_passw': '12345-ab'}.blured(), {'my_passw': '********'});
    expect({'my_secret': '12345-ab'}.blured(), {'my_secret': '********'});
    expect({'my_secret': ' 12345-ab  '}.blured(), {'my_secret': '***********'});

    expect({'my_field': 'abc  '}.blured(), {'my_field': 'abc  '});
  });

  test('jsonWithSignificantFields', () {
    const json = <String, dynamic>{
      // null
      'null': null,
      // bool
      'false_bool': false,
      'true_bool': true,
      // int
      'zero_int': 0,
      'positive_int': 12,
      'negative_int': -12,
      // double
      'positive_zero_double': 0.0,
      'negative_zero_double': -0.0,
      'positive_double': 1.2,
      'negative_double': -1.2,
      'positive_infinity_double': double.infinity,
      'negative_infinity_double': double.negativeInfinity,
      'nan_double': double.nan,
      // string
      'empty_string': '',
      'spaced_string': '    ',
      'filled_string': 'a bcd efghijkl',
      // enum
      'first_enum': TestEnum.unspecified,
      'second_enum': TestEnum.a,
      // list
      'empty_list': <int>[],
      'one_empty_element_list': <int>[0],
      'two_empty_elements_list': <int>[0, 0],
      'list': <int>[1, 2],
      // map
      'empty_map': <String, dynamic>{},
      'one_empty_element_map': <String, dynamic>{'': 0},
      'one_not_empty_value_element_map': <String, dynamic>{'': 12},
      'one_not_empty_key_element_map': <String, dynamic>{'a': 0},
      'two_empty_values_elements_map': <String, dynamic>{'a': 0, 'b': 0},
      'map': <String, dynamic>{'a': 1, 'b': 2},
      // set
      'empty_set': <int>{},
      'one_empty_element_set': <int>{0},
      'set': <int>{1, 2},
    };

    expect(
        json.jsonWithSignificantFields.keys,
        {
          // bool
          'true_bool': true,
          // int
          'positive_int': 12,
          'negative_int': -12,
          // double
          'positive_double': 1.2,
          'negative_double': -1.2,
          'positive_infinity_double': double.infinity,
          'negative_infinity_double': double.negativeInfinity,
          'nan_double': double.nan,
          // string
          'spaced_string': '    ',
          'filled_string': 'a bcd efghijkl',
          // enum
          'second_enum': TestEnum.a,
          // list
          'one_empty_element_list': <int>[0],
          'two_empty_elements_list': <int>[0, 0],
          'list': <int>[1, 2],
          // map
          'one_not_empty_value_element_map': <String, dynamic>{'': 12},
          'map': <String, dynamic>{'a': 1, 'b': 2},
          // set
          'one_empty_element_set': <int>{0},
          'set': <int>{1, 2},
        }.keys);
  });
}
