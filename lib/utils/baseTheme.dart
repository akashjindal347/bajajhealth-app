import 'package:flutter/material.dart';

ThemeData baseTheme () {
  TextTheme _baseTextTheme(TextTheme base) {
    return base.copyWith(
      headline: base.headline.copyWith(
        fontFamily: 'Raleway',
        fontSize: 24,
        color: Color(0xFF089BAB)
      )
    );
  }
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    textTheme: _baseTextTheme(base.textTheme),
    primaryColor: Color(0xFF089BAB),
    secondaryHeaderColor: Color(0xFFFED892),
    accentColor: Color(0xFFFD8369)
  );
}