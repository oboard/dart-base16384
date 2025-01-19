import 'package:dart_base16384/dart_base16384.dart';
import 'package:test/test.dart';

void main() {
  final base16384 = Base16384();
  group('Base16384', () {
    test('encode', () {
      expect(base16384.encodeString(''), '㴀');
      expect(base16384.encodeString('1'), '婀㴁');
      expect(base16384.encodeString('12'), '婌渀㴂');
      expect(base16384.encodeString('123'), '婌焰㴃');
      expect(base16384.encodeString('1234'), '婌焳帀㴄');
      expect(base16384.encodeString('12345'), '婌焳廔㴅');
      expect(base16384.encodeString('123456'), '婌焳廔萀㴆');
      expect(base16384.encodeString('1234567'), '婌焳廔萷㴀');
      expect(base16384.encodeString('12345678'), '婌焳廔萷尀㴁');
      expect(base16384.encodeString('123456789'), '婌焳廔萷導帀㴂');
    });

    test('decode', () {
      expect(base16384.decodeString('㴀'), '');
      expect(base16384.decodeString('婀㴁'), '1');
      expect(base16384.decodeString('婌渀㴂'), '12');
      expect(base16384.decodeString('婌焰㴃'), '123');
      expect(base16384.decodeString('婌焳帀㴄'), '1234');
      expect(base16384.decodeString('婌焳廔㴅'), '12345');
      expect(base16384.decodeString('婌焳廔萀㴆'), '123456');
      expect(base16384.decodeString('婌焳廔萷㴀'), '1234567');
      expect(base16384.decodeString('婌焳廔萷尀㴁'), '12345678');
      expect(base16384.decodeString('婌焳廔萷導帀㴂'), '123456789');
    });
  });
}
