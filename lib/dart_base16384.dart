import 'dart:convert';
import 'dart:typed_data';

class Base16384 {
  TypedDataList<int> align({
    required TypedDataList<int> input,
    required TypedDataList<int> output,
    required int sWidth,
    required int tWidth,
    required int sOffset,
    required int tOffset,
  }) {
    final mask = (1 << tWidth) - 1;
    var offset = 0, rest = 0;
    var i = 0, j = 0;
    final inputLength = input.length;
    final outputLength = output.length;

    while (i < inputLength) {
      final char = input[i++] - sOffset;
      offset += sWidth;

      while (offset >= tWidth) {
        offset -= tWidth;
        output[j++] = (rest + (char >> offset) + tOffset).clamp(0, 0xFFFF);
        if (j == outputLength) return output;
        rest = 0;
      }

      rest += (char << (tWidth - offset)) & mask;
    }

    if (offset > 0) output[j] = rest + tOffset;
    return output;
  }

  static final _utf8Encoder = utf8.encoder;
  static final _utf8Decoder = utf8.decoder;

  Uint16List encode(Uint8List input) {
    final outputLength = (input.length * 4 / 7).ceil() + 1;
    final output = Uint16List(outputLength);
    align(
      input: input,
      output: output,
      sWidth: 8,
      tWidth: 14,
      sOffset: 0,
      tOffset: 0x4e00,
    );
    output[outputLength - 1] = input.length % 7 + 0x3d00;
    return output;
  }

  Uint8List decode(Uint16List input) {
    if (input.isEmpty || input.length == 1) return Uint8List(0);

    final length = input.length - 1;
    final residue = input[length] - 0x3d00;
    final validResidue = (residue > 0 && residue <= 7) ? residue : 7;

    final outLen = (length ~/ 4) * 7 + (length % 4 > 0 ? validResidue : 0);
    final output = Uint8List(outLen);

    align(
      input: input.sublist(0, length),
      output: output,
      sWidth: 14,
      tWidth: 8,
      sOffset: 0x4e00,
      tOffset: 0,
    );

    var lastNonZero = outLen - 1;
    while (lastNonZero >= 0 && output[lastNonZero] == 0) {
      lastNonZero--;
    }

    return lastNonZero < 0 ? Uint8List(0) : output.sublist(0, lastNonZero + 1);
  }

  String toSource8(Uint8List input) => _utf8Decoder.convert(input);

  String toSource(Uint16List input) => String.fromCharCodes(input);

  String encodeString(String source) =>
      toSource(encode(Uint8List.fromList(_utf8Encoder.convert(source))));

  String decodeString(String source) =>
      toSource8(decode(Uint16List.fromList(source.codeUnits)));
}
