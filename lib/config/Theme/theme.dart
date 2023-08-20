import 'package:flutter/material.dart';

class ThemeApp {
  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      appBarTheme: const AppBarTheme(
        centerTitle: false,
        elevation: 10,
        backgroundColor: Colors.black,
        toolbarTextStyle: TextStyle(
          color: Colors.white,
        ),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
