import 'package:codename_encoder/src/encoder.dart';

/// This is more specialized than [intEncoder] since it only allows lists. So it ends up taking less space.
///
/// Works on doubles as well, despite the name.
final intListEncoder = CharMapStringEncoder(charMap: _INT_LIST_ENCODER_CHARS);

/// Works on doubles as well, despite the name.
final intEncoder = CharMapStringEncoder(charMap: _INT_ENCODER_CHARS);

const _INT_LIST_ENCODER_CHARS = {
  '1': 1,
  '2': 2,
  '3': 3,
  '4': 4,
  '5': 5,
  '6': 6,
  '7': 7,
  '8': 8,
  '9': 9,
  '0': 10,
  '.': 11,
  '[': 12,
  ']': 13,
  ',': 14,
  '-': 15,
};

const _INT_ENCODER_CHARS = {
  ..._INT_LIST_ENCODER_CHARS,
  '{': 16,
  '}': 17,
  ':': 18,
  '/': 20,
  '?': 21,
  '!': 22,
  '<': 23,
  '>': 24,
  '^': 25,
  "'": 26,
  '@': 27,
  '\$': 28,
  '#': 29,
  '%': 30,
  '"': 31,
};
