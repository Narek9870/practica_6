import 'package:flutter/material.dart';

abstract final class AppTheme {
  //СВЕТЛАЯ ТЕМА
  static final ThemeData light = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.blue,
      brightness: Brightness.light,
    ),
    scaffoldBackgroundColor: const Color(0xFFF5F7FA), // Цвет фона экранов
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.lightGreenAccent,
      foregroundColor: Colors.black, // Цвет текста AppBar
      elevation: 0,
      centerTitle: true,
    ),
    listTileTheme: const ListTileThemeData(iconColor: Colors.blue),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(fontSize: 16, color: Colors.black87), // Основной текст
      titleMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
    ),
    cardTheme: const CardThemeData(
      color: Colors.white, // Цвет карточек
      elevation: 4,
    ),
    iconTheme: const IconThemeData(
      color: Colors.blue, // Цвет иконок
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black, // Цвет фона кнопки
        foregroundColor: Colors.white, // Цвет текста кнопки
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)), // Форма кнопки
        ),
      ),
    ),
  );

  //ТЕМНАЯ ТЕМА
  static final ThemeData dark = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF032E6D),
      brightness: Brightness.dark,
    ),
    scaffoldBackgroundColor: const Color(0xFF121212), // Темный фон экранов
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1F1F1F), // Темный фон AppBar
      foregroundColor: Colors.white, // Белый текст в AppBar
      elevation: 0,
      centerTitle: true,
    ),
    listTileTheme: const ListTileThemeData(
      iconColor: Colors.white,
      textColor: Colors.white70,
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(fontSize: 16, color: Colors.white70), // Светлый текст на темном
      titleMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
    ),
    cardTheme: const CardThemeData(
      color: Color(0xFF1E1E1E), // Цвет карточек в темной теме
      elevation: 4,
    ),
    iconTheme: const IconThemeData(
      color: Colors.white, // Белые иконки
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueGrey, // Цвет кнопки в темной теме
        foregroundColor: Colors.white, // Цвет текста
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    ),
  );
}