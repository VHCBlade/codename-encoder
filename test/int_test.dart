import 'dart:convert';

import 'package:codename_encoder/codename_encoder.dart';
import 'package:test/test.dart';

void main() {
  group('IntListStringEncoder', () {
    test('Encoding', () => encodingTest(intListEncoder));
  });
  group('IntEncoder', () {
    test('Encoding', () => encodingTest(intEncoder));
    test('Encoding', () => encodingTest(stringEncoder));
  });
}

const TEST_DATA_1 = 1024;
const TEST_DATA_2 = [
  [1, 2, 3],
  [4, 5, 6]
];
const TEST_DATA_3 = [
  [1021, 2123, 3132],
  [4234, 5234, 6234],
];
const TEST_DATA_4 = [1.024];
const TEST_DATA_5 = [
  [10.12213, 123.12195, 1200214.213],
  [213.123, 21312, 32.132, 576786856.4, 6234],
];

void encodingTest(StringEncoder encoder) {
  print(encoder.encode('$TEST_DATA_1'));
  print(encoder.encode('$TEST_DATA_2'));
  print(encoder.sanitzeForEncoding('$TEST_DATA_2'));
  print(encoder.encode('$TEST_DATA_2').length);
  print(encoder.sanitzeForEncoding('$TEST_DATA_2').length);
  print(encoder.encode(jsonEncode('$TEST_DATA_3')));
  print(encoder.sanitzeForEncoding('$TEST_DATA_3'));
  print(encoder.encode('$TEST_DATA_3').length);
  print(encoder.sanitzeForEncoding('$TEST_DATA_3').length);
  print(encoder.encode(jsonEncode('$TEST_DATA_4')));
  print(encoder.sanitzeForEncoding('$TEST_DATA_4'));
  print(encoder.encode('$TEST_DATA_4').length);
  print(encoder.sanitzeForEncoding('$TEST_DATA_4').length);
  print(encoder.encode('$TEST_DATA_5'));
  print(encoder.sanitzeForEncoding('$TEST_DATA_5'));
  print(encoder.encode('$TEST_DATA_5').length);
  print(encoder.sanitzeForEncoding('$TEST_DATA_5').length);
}
