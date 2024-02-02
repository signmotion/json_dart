import 'package:json_dart/json_dart.dart';
import 'package:test/test.dart';
import 'package:vector_math/vector_math.dart';

import 'helpers/types.dart';

void main() {
  test('sjson encodable object', () {
    expect(Vector2(1.0, -2).sjson, '[\n  1.0,\n  -2.0\n]');
  });

  test('sjsonInLine encodable object', () {
    expect(Vector2(1.0, -2).sjsonInLine, '[1.0,-2.0]');
  });

  test('sjsonInLineWithoutWrappers encodable object', () {
    expect(Vector2(1.0, -2).sjsonInLineWithoutWrappers, '1.0,-2.0');
  });

  test('sjson non-encodable object', () {
    expect(
      const NonEncodableObject().sjson,
      '"Instance of \'NonEncodableObject\'"',
    );
  });

  test('sjson array with null object', () {
    expect([null, 12].sjson, '[\n  null,\n  12\n]');
  });

  test('sjsonInLine array with null object', () {
    expect([null, 12].sjsonInLine, '[null,12]');
  });

  test('sjsonInLineWithoutWrappers array with null object', () {
    expect([null, 12].sjsonInLineWithoutWrappers, 'null,12');
  });

  test('sjsonWithoutWrappers array with non-encodable objects', () {
    expect(
      [const NonEncodableObject()].sjsonWithoutWrappers,
      '"Instance of \'NonEncodableObject\'"',
    );
  });

  test('sjsonInLineWithoutWrappers array with non-encodable object', () {
    expect(
      [const NonEncodableObject()].sjsonInLineWithoutWrappers,
      '"Instance of \'NonEncodableObject\'"',
    );
  });

  test('sjsonWithoutWrappers array', () {
    expect([10, 11, 12].sjsonWithoutWrappers, '10,\n11,\n12');
  });

  test('sjsonInLineWithoutWrappers array', () {
    expect([10, 11, 12].sjsonInLineWithoutWrappers, '10,11,12');
  });

  test('sjsonWithoutWrappers array with null object', () {
    expect(
      [null, 12].sjsonWithoutWrappers,
      'null,\n12',
    );
  });

  test('sjsonInLineWithoutWrappers array with null object', () {
    expect(
      [null, 12].sjsonInLineWithoutWrappers,
      'null,12',
    );
  });

  test('sjsonWithoutWrappers object', () {
    expect({'t': 1}.sjsonWithoutWrappers, '"t": 1');
    expect({'a': 1, 'b': 2}.sjsonWithoutWrappers, '"a": 1,\n"b": 2');
    expect(
        {
          'o': {'u': 1}
        }.sjsonWithoutWrappers,
        '"o": {\n  "u": 1\n}');
  });

  test('sjsonInLineWithoutWrappers object', () {
    expect({'t': 1}.sjsonInLineWithoutWrappers, '"t":1');
    expect({'a': 1, 'b': 2}.sjsonInLineWithoutWrappers, '"a":1,"b":2');
    expect(
        {
          'o': {'u': 1}
        }.sjsonInLineWithoutWrappers,
        '"o":{"u":1}');
  });

  test('sjsonWithoutWrappers string', () {
    expect('"abc def"'.sjsonWithoutWrappers, 'abc def');
    expect('"abc\ndef"'.sjsonWithoutWrappers, 'abc\ndef');

    expect('""'.sjsonWithoutWrappers, '');
    expect('"    "'.sjsonWithoutWrappers, '');
    expect('"\n\n"'.sjsonWithoutWrappers, '');
  });

  test('sjsonWithoutWrappers bool', () {
    expect('true'.sjsonWithoutWrappers, 'true');
    expect('false'.sjsonWithoutWrappers, 'false');
  });

  test('sjsonWithoutWrappers num', () {
    expect('12345'.sjsonWithoutWrappers, '12345');
    expect('1234.5'.sjsonWithoutWrappers, '1234.5');
  });

  test('sjsonWithoutWrappers null', () {
    expect('null'.sjsonWithoutWrappers, 'null');
  });
}
