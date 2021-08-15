import 'dart:convert';

import 'package:codename_encoder/codename_encoder.dart';
import 'package:test/test.dart';

void main() {
  group('IntListStringEncoder', () {
    test('Encoding', encodingTest);
    test('Decoding', decodingTest);
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
const TEST_DATA_6 = 10240;

const TEST_DATA_1_CODE = 'oUI=';
const TEST_DATA_2_CODE = 'zOHi087k5dYN';
const TEST_DATA_3_CODE = 'zKESLiHjEyPtTDLkJUNuMtQN';
const TEST_DATA_4_CODE = 'HKtCDQ==';
const TEST_DATA_5_CODE = 'zKEbIjEeMhsSWR6iKkErMe0sMRsyLjEhPrIx4nV2aFi25CZD3Q==';
const TEST_DATA_6_CODE = 'oUIK';

void encodingTest() {
  expect(intListEncoder.encode('$TEST_DATA_1'), TEST_DATA_1_CODE);
  expect(intListEncoder.encode('$TEST_DATA_2'), TEST_DATA_2_CODE);
  expect(intListEncoder.encode('$TEST_DATA_3'), TEST_DATA_3_CODE);
  expect(intListEncoder.encode('$TEST_DATA_4'), TEST_DATA_4_CODE);
  expect(intListEncoder.encode('$TEST_DATA_5'), TEST_DATA_5_CODE);
  expect(intListEncoder.encode('$TEST_DATA_6'), TEST_DATA_6_CODE);
}

void decodingTest() {
  expect(intListEncoder.decode(TEST_DATA_1_CODE), '$TEST_DATA_1');
  expect(json.decode(intListEncoder.decode(TEST_DATA_2_CODE)), TEST_DATA_2);
  expect(json.decode(intListEncoder.decode(TEST_DATA_3_CODE)), TEST_DATA_3);
  expect(json.decode(intListEncoder.decode(TEST_DATA_4_CODE)), TEST_DATA_4);
  expect(json.decode(intListEncoder.decode(TEST_DATA_5_CODE)), TEST_DATA_5);
  expect(intListEncoder.decode(TEST_DATA_6_CODE), '$TEST_DATA_6');
}
