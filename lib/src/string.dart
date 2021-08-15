import 'package:codename_encoder/codename_encoder.dart';

final stringEncoder = CharMapStringEncoder(charMap: _STRING_ENCODER_CHARS);

const _STRING_ENCODER_CHARS = {
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
  '[': 11,
  ']': 12,
  ',': 13,
  ' ': 14,
  '"': 15,
  'a': 16,
  'b': 17,
  'c': 18,
  'd': 19,
  'e': 20,
  'f': 21,
  'g': 22,
  'h': 23,
  'i': 24,
  'j': 25,
  'k': 26,
  'l': 27,
  'm': 28,
  'n': 29,
  'o': 30,
  'p': 31,
  'q': 32,
  'r': 33,
  's': 34,
  't': 35,
  'u': 36,
  'v': 37,
  'w': 38,
  'x': 39,
  'y': 40,
  'z': 41,
  '.': 42,
};
