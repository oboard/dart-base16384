# dart_base16384

Base16384 编码的 Dart 实现。Base16384 是一种编码方式，使用 UTF-16 字符集中的常用字符来编码二进制数据。

## 特性

- 纯 Dart 实现
- 支持编码和解码
- 高效的二进制数据处理

## 使用

```dart
import 'package:dart_base16384/dart_base16384.dart';

void main() {
  final base16384 = Base16384();
  print(base16384.encodeString('123456789'));
}
```
