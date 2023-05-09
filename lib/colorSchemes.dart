//Names: Batool, Christian, Inaya, Kevine
//Description: colorSchemes --> File for storing app style preset values,
//similar to CSS style sheets and converting hex colors
// Class: CSI CUE 2023

import 'package:flutter/material.dart';

// App colors
final colorMid = HexColor.fromHex('#FFC300');
final colorDark = HexColor.fromHex('#DFAB00');
final colorLight = HexColor.fromHex('#FFD240');
final colorBackground = HexColor.fromHex('#FFF8DF');
final greenShade =  Colors.green[200];

// Font style
const lsatTextStyle = TextStyle(
  fontSize: 22,
  fontStyle: FontStyle.normal,
  color: Colors.black87,
);

// Default theme
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

// Background color
var lsatBackground = Colors.orange;

// Makes hex value color from standard color
class HexColor {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length <= 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));

    return Color(int.parse(buffer.toString(), radix: 16));
  }
}