import 'dart:convert';

import 'package:codename_encoder/codename_encoder.dart';
import 'package:test/test.dart';

void main() {
  group('IntStringEncoder', () {
    test('Encoding', encodingTest);
    test('Decoding', decodingTest);
  });
}

const TEST_DATA_1 = 1024;
const TEST_DATA_2 = {
  '1': {'1': 1, '2': 2, '3': 3}
};
const TEST_DATA_3 = [
  [1021, 2123, 3132],
  [4234, 5234, 6234],
];
const TEST_DATA_4 = [1.024];
const TEST_DATA_5 = [
  [10.12213, 123.12195, 1200214.213],
  [213.123, 21312, 32.132, 576786856.4, 6234],
];
const TEST_DATA_6 = 102401024010240;

const TEST_DATA_1_CODE = 'QQkC';
const TEST_DATA_2_CODE = '8Icv4Q9fBvfFl8L98eWIEQ==';
const TEST_DATA_3_CODE = 'jAUlghNBDDfCEM0xIgZxRQzijBikNQ==';
const TEST_DATA_4_CODE = 'LCwlSAM=';
const TEST_DATA_5_CODE =
    'jAW1ghBhuCDGCiKk4oJQSgSyRBjNMRHGCmI4EUYQbogVhnDlmIMMKmYRZ8QgrQE=';
const TEST_DATA_6_CODE = 'QQmighJEBSWIAg==';

void encodingTest() {
  expect(intEncoder.encode('$TEST_DATA_1'), TEST_DATA_1_CODE);
  expect(intEncoder.encode(jsonEncode(TEST_DATA_2)), TEST_DATA_2_CODE);
  expect(intEncoder.encode(jsonEncode(TEST_DATA_3)), TEST_DATA_3_CODE);
  expect(intEncoder.encode(jsonEncode(TEST_DATA_4)), TEST_DATA_4_CODE);
  expect(intEncoder.encode(jsonEncode(TEST_DATA_5)), TEST_DATA_5_CODE);
  expect(intEncoder.encode('$TEST_DATA_6'), TEST_DATA_6_CODE);
}

void decodingTest() {
  expect(intEncoder.decode(TEST_DATA_1_CODE), '$TEST_DATA_1');
  expect(jsonDecode(intEncoder.decode(TEST_DATA_2_CODE)), TEST_DATA_2);
  expect(jsonDecode(intEncoder.decode(TEST_DATA_3_CODE)), TEST_DATA_3);
  expect(jsonDecode(intEncoder.decode(TEST_DATA_4_CODE)), TEST_DATA_4);
  expect(jsonDecode(intEncoder.decode(TEST_DATA_5_CODE)), TEST_DATA_5);
  expect(intEncoder.decode(TEST_DATA_6_CODE), '$TEST_DATA_6');
}
