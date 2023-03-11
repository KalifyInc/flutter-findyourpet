import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  get darkTheme => ThemeData(
      primarySwatch: Colors.teal,
      appBarTheme: const AppBarTheme(
          color: Colors.black12,
          systemOverlayStyle: SystemUiOverlayStyle.light),
      brightness: Brightness.dark,
      canvasColor: const Color.fromRGBO(40, 42, 54, 1),
      cardColor: const Color.fromRGBO(26, 26, 34, 1),
      bottomNavigationBarTheme:
          const BottomNavigationBarThemeData(backgroundColor: Colors.black12));
}
