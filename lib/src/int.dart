import 'package:codename_encoder/src/encoder.dart';

/// This is more specialized than [intEncoder] since it only allows lists. So it ends up taking less space.
final intListEncoder = CharMapStringEncoder(charMap: _INT_LIST_ENCODER_CHARS);

/// This is more specialized than [intEncoder] since it only allows maps. So it ends up taking less space.
final intMapEncoder = CharMapStringEncoder(charMap: _INT_MAP_ENCODER_CHARS);
final intEncoder = CharMapStringEncoder(charMap: _INT_ENCODER_CHARS);

const _INT_LIST_ENCODER_CHARS = {
  '0': 0,
  '1': 1,
  '2': 2,
  '3': 3,
  '4': 4,
  '5': 5,
  '6': 6,
  '7': 7,
  '8': 8,
  '9': 9,
  '.': 10,
  '[': 11,
  ']': 12,
  ',': 13,
  '"': 14,
};
const _INT_MAP_ENCODER_CHARS = {
  '0': 0,
  '1': 1,
  '2': 2,
  '3': 3,
  '4': 4,
  '5': 5,
  '6': 6,
  '7': 7,
  '8': 8,
  '9': 9,
  '.': 10,
  '{': 11,
  '}': 12,
  ',': 13,
  '"': 14,
  ':': 15,
};

const _INT_ENCODER_CHARS = {
  ..._INT_LIST_ENCODER_CHARS,
  '^': 15,
  '{': 16,
  '}': 17,
  ':': 18,
  '-': 19,
  '/': 20,
  '?': 21,
  '!': 22,
  '<': 23,
  '>': 24,
  ';': 25,
  "'": 26,
  '@': 27,
  '\$': 28,
  '#': 29,
  '%': 30,
};
