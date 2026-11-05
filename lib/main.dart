import 'package:flutter/material.dart';
import 'routes.dart'; // Подключаем наши адреса

// Подключаем все экраны
import 'pages/loading_page.dart';
import 'pages/login_page.dart';
import 'pages/register_page.dart';
import 'pages/home_page.dart';
import 'pages/detail_page.dart';
import 'pages/profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // 1. Стартовый экран по умолчанию - Заставка
      initialRoute: Routes.loading,

      // 2. Карта маршрутов (словарь путей)
      routes: {
        Routes.loading: (context) => const LoadingPage(),
        Routes.login: (context) => const LoginPage(),
        Routes.register: (context) => const RegisterPage(),
        Routes.home: (context) => const HomePage(),
        Routes.detail: (context) => const DetailPage(),
        Routes.profile: (context) => const ProfilePage(),
      },
    );
  }
}