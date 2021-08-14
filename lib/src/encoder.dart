import 'dart:convert';
import 'dart:math';

import 'dart:typed_data';

abstract class StringEncoder {
  /// if [sanitized] is true, will run the [sanitizedForEncoding] function before encoding the string.
  String encode(String source, {bool sanitized = true});
  String decode(String source);

  /// Sanitizes the [source] by removing/replacing any values that can't show up.
  String sanitzeForEncoding(String source);
}

/// Encodes Strings based on the [charMap] that this is initialized with.
///
/// If the string that is attempted to be [encode]d contains values that don't exist in the [charMap] the function will fail.
class CharMapStringEncoder implements StringEncoder {
  final Map<String, int> charMap;
  late final bitsUsed = _bitsUsed;
  late final int chunksPerInt = _MAX_BITS_USED ~/ bitsUsed;
  final String Function(String) mapInvalidCharacter;
  static const _MAX_BITS_USED = 64;

  int get _bitsUsed {
    for (var i = 0; true; i++) {
      if (pow(2, i) >= charMap.length) {
        return i;
      }
    }
  }

  /// Assumes that [charMap] will never change. Value map must have at most 2^64 entries.
  CharMapStringEncoder(
      {required this.charMap,
      this.mapInvalidCharacter = _defaultMapInvalidCharacter});

  static String _defaultMapInvalidCharacter(String value) => '';

  @override
  String decode(String source) {
    // TODO: implement decode
    throw UnimplementedError();
  }

  @override
  String encode(String source, {bool sanitized = true}) {
    if (sanitized) {
      source = sanitzeForEncoding(source);
    }
    final intList = <int>[];
    for (var i = 0; i < source.length / chunksPerInt; i++) {
      final stringChunk = source.substring(
          i * chunksPerInt, min(source.length, (i + 1) * chunksPerInt));
      print(stringChunk);

      final encodedString = encodeStringChunk(stringChunk);

      intList.addAll(_convertIntToByteList(encodedString));
    }

    _removeTrailingZeroes(intList);

    return base64Encode(Uint8List.fromList(intList));
  }

  List<int> _convertIntToByteList(int value) =>
      Uint8List(8)..buffer.asInt64List()[0] = value;
  void _removeTrailingZeroes(List<int> list) {
    if (list.isEmpty) {
      return;
    }
    while (list[list.length - 1] == 0) {
      list.removeLast();
      if (list.isEmpty) {
        return;
      }
    }
  }

  /// Encodes the [stringChunk] into the bits of an int.
  int encodeStringChunk(String stringChunk) {
    if (stringChunk.length > chunksPerInt) {
      throw ArgumentError(
          '$charMap does not support encoding strings that are of size ${stringChunk.length} (MaxSize: $chunksPerInt).');
    }

    var retVal = 0;
    for (var i = 0; i < stringChunk.length; i++) {
      final value = stringChunk[i];
      if (!charMap.containsKey(value)) {
        throw ArgumentError(
            '$charMap does not support encoding strings with $value.');
      }

      retVal += charMap[value]! * pow(2, i * bitsUsed).toInt();
    }

    return retVal;
  }

  @override
  String sanitzeForEncoding(String source) {
    for (var i = 0; i < source.length; i++) {
      if (charMap.containsKey(source[i])) {
        continue;
      }
      final value = mapInvalidCharacter(source[i]);
      source = source.replaceRange(i, i + 1, value);
      i += value.length - 1;
    }
    return source;
  }
}

class CodeNameEncoder {}
