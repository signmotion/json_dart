# JSON Dart

![Cover - JSON Dart](https://raw.githubusercontent.com/signmotion/json_dart/master/images/cover.webp)

[![GitHub License](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/signmotion/json_dart/master/LICENSE)

The well-tested extensions for convenient handling of JSON in Dart.

## Usage

### Bluring Key Fields

```dart
print({'api_key': '12345-my-key-value'}.blured());
```

Output:

```text
{api_key: ******************}
```

### Keepeing Significant Fields Only

```dart
const json = <String, dynamic>{
  'null': null,
  'false_bool': false,
  'ok': true,
  'zero_int': 0,
  'positive_zero_double': 0.0,
  'negative_zero_double': -0.0,
  'empty_string': '',
  'empty_list': <int>[],
  'empty_map': <String, dynamic>{},
  'empty_set': <int>{},
};
print(json.jsonWithSignificantFields);
```

Output:

```text
{ok: true}
```

## License

[MIT](LICENSE)

## Welcome

This package is open-source, stable and well-tested. Development happens on
[GitHub](https://github.com/signmotion/json_dart). Feel free to report issues
or create a pull-request there.

General questions are best asked on
[StackOverflow](https://stackoverflow.com/questions/tagged/json_dart).

## TODO

- All feautures into `README`.
- The types from the package [pure_dart_ui](https://pub.dev/packages/pure_dart_ui).
