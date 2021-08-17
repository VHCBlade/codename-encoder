import 'package:codename_encoder/codename_encoder.dart';

class CodenameMapper {
  final Map<String, StringEncoder> encoderMap = {};

  void addStringEncoder(String val, StringEncoder encoder) {
    assert(val.length == 1);

    if (encoderMap.containsKey(val)) {
      throw ArgumentError('$val key is already mapped to an encoder!');
    }
    encoderMap[val] = encoder;
  }

  String encodeValue(String encoderKey, String value) {
    if (!encoderMap.containsKey(encoderKey)) {
      throw ArgumentError('No encoder to match the $encoderKey');
    }

    final encoder = encoderMap[encoderKey]!;
    return '$encoderKey${encoder.encode(value)}';
  }

  String decodeValue(String value) {
    assert(value.isNotEmpty);

    final encoderKey = value.substring(0, 1);

    if (!encoderMap.containsKey(encoderKey)) {
      throw ArgumentError('No encoder to match the $encoderKey');
    }

    final encoder = encoderMap[encoderKey]!;
    return encoder.decode(value.substring(1));
  }
}
