import 'package:flutter/material.dart';

final colorMid = HexColor.fromHex('#FFC300');
final colorDark = HexColor.fromHex('#DFAB00');
final colorLight = HexColor.fromHex('#FFD240');

const lsatTextStyle = TextStyle(
  fontSize: 22,
  fontStyle: FontStyle.normal,
  color: Colors.black87,
);

var lsatTheme = ThemeData(
  brightness: Brightness.light, // light or dark mode
  primarySwatch: Colors.orange,
  primaryColor: colorMid,
  scaffoldBackgroundColor: HexColor.fromHex('#FFF8DF'),
  // colorScheme: ColorScheme.fromSeed(
  //   seedColor: Colors.purple,
  //   brightness: Brightness.light
  // )

);

var lsatBackground = Colors.orange;

class HexColor {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length <= 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));

    return Color(int.parse(buffer.toString(), radix: 16));
  }
}