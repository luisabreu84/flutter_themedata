import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: const Color(0xffFFFBF4),
    primary: Colors.blueGrey.shade100,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.blueGrey.shade100,
    selectedItemColor: Colors.white,
    unselectedItemColor: Colors.black,
  ),
  textTheme: const TextTheme(
    displayMedium: TextStyle(fontSize: 24, color: Colors.black),
  )
);

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    background: Colors.grey,
    primary: Colors.black12,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.black12,
    selectedItemColor: Colors.white,
    unselectedItemColor: Colors.black,
  ),
  textTheme: const TextTheme(
    displayMedium: TextStyle(fontSize: 24, color: Colors.white),
  )
);