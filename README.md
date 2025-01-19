<!-- [![Pub Version](https://img.shields.io/pub/v/dart_base16384)](https://pub.dev/packages/dart_base16384) -->
[![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/oboard/dart-base16384/dart.yml?branch=main)](https://github.com/oboard/dart-base16384/actions)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Platform](https://img.shields.io/badge/Platform-Android%20%7C%20iOS%20%7C%20Linux%20%7C%20macOS%20%7C%20Windows%20%7C%20Web-blue)](https://github.com/oboard/dart-base16384)

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
