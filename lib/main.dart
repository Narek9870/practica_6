import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'routes.dart';
import 'di.dart'; // ПОДКЛЮЧАЕМ НАШ DI-КОНТЕЙНЕР

import 'pages/loading_page.dart';
import 'pages/login_page.dart';
import 'pages/register_page.dart';
import 'pages/home_page.dart';
import 'pages/detail_page.dart';
import 'pages/profile_page.dart';
import 'pages/bloc/dbms_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // Обязательно для работы с локальной БД
  setupDI(); // Запускаем DI-контейнер перед стартом приложения

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.loading,
      routes: {
        Routes.loading: (context) => const LoadingPage(),
        Routes.login: (context) => const LoginPage(),
        Routes.register: (context) => const RegisterPage(),

        // БЕРЕМ BLOC ИЗ КОНТЕЙНЕРА (getIt)
        Routes.home: (context) => BlocProvider(
          create: (_) => getIt<DbmsBloc>()..add(const LoadDbmsEvent()),
          child: const HomePage(),
        ),

        Routes.detail: (context) => const DetailPage(),
        Routes.profile: (context) => const ProfilePage(),
      },
    );
  }
}