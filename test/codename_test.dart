import 'package:codename_encoder/codename_encoder.dart';
import 'package:test/test.dart';

void main() {
  group('Codename Mapper', () {
    test('Expected', expectedTest);
    test('Errors', errorTest);
  });
}

CodenameMapper setup() {
  final mapper = CodenameMapper();
  mapper.addStringEncoder('a', intListEncoder);
  mapper.addStringEncoder('t', intEncoder);
  return mapper;
}

void expectedTest() {
  final mapper = setup();
  expect(mapper.encodeValue('a', '[2048]'), 'aLErY');
  expect(mapper.encodeValue('t', '[2048]'), 'tTCiCGg==');
  expect(mapper.decodeValue('aLErY'), '[2048]');
  expect(mapper.decodeValue('tTCiCGg=='), '[2048]');
}

void errorTest() {
  final mapper = setup();

  expect(() => mapper.addStringEncoder('', intEncoder),
      throwsA((val) => val is AssertionError));
  expect(() => mapper.addStringEncoder('asf', intEncoder),
      throwsA((val) => val is AssertionError));
  expect(() => mapper.addStringEncoder('a', intEncoder), throwsArgumentError);
  expect(() => mapper.encodeValue('b', ''), throwsArgumentError);
  expect(() => mapper.decodeValue(''), throwsA((val) => val is AssertionError));
  expect(() => mapper.decodeValue('b'), throwsArgumentError);
}
