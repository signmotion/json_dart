# JSON Dart

![Cover - JSON Dart](https://raw.githubusercontent.com/signmotion/json_dart/master/images/cover.webp)

[![GitHub License](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![Pub Package](https://img.shields.io/badge/doc-json_dart-blue)](https://pub.dartlang.org/packages/json_dart)
[![Build Status](https://github.com/signmotion/json_dart/actions/workflows/dart-ci.yml/badge.svg)](https://github.com/signmotion/json_dart/actions/workflows/dart-ci.yml)
[![Publisher](https://img.shields.io/pub/publisher/json_dart)](https://pub.dev/publishers/syrokomskyi.com)

The well-tested helpers for convenient handling of JSON in Dart.
Feel free to use it in your awesome project.

## Usage

### Bluring Key Fields

```dart
print({'api_key': '12345-my-key-value'}.blured());
```

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

```text
{ok: true}
```

## Welcome

Requests and suggestions are warmly welcome.

This package is open-source, stable and well-tested. Development happens on
[GitHub](https://github.com/signmotion/json_dart). Feel free to report issues
or create a pull-request there.

General questions are best asked on
[StackOverflow](https://stackoverflow.com/questions/tagged/json_dart).

## TODO

- All feautures into `README`.
- The types from the package [pure_dart_ui](https://pub.dev/packages/pure_dart_ui).
