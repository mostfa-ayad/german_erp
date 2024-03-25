import 'package:flutter/material.dart';

class AppTheme {
  static OutlineInputBorder _border({Color color = Colors.blueAccent}) =>
      OutlineInputBorder(borderSide: BorderSide(width: 2, color: color));
  static ThemeData get light => ThemeData.light(useMaterial3: true).copyWith(
      inputDecorationTheme: InputDecorationTheme(
          focusedBorder: _border(color: Colors.greenAccent),
          enabledBorder: _border()),
      colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Colors.blueAccent,
          onPrimary: Colors.amber,
          secondary: Colors.greenAccent,
          onSecondary: Colors.yellow,
          error: Colors.redAccent,
          onError: Colors.deepOrangeAccent,
          background: Colors.white,
          onBackground: Colors.white24,
          surface: Colors.grey,
          onSurface: Colors.indigo));
}
