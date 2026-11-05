import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // ПОДКЛЮЧИЛИ БИБЛИОТЕКУ
import 'routes.dart';

// Подключаем наши экраны и BLoC
import 'pages/loading_page.dart';
import 'pages/login_page.dart';
import 'pages/register_page.dart';
import 'pages/home_page.dart';
import 'pages/detail_page.dart';
import 'pages/profile_page.dart';
import 'pages/bloc/dbms_bloc.dart'; // НАШ BLOC

void main() {
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

        // Оборачиваем HomePage в BlocProvider и сразу отправляем событие загрузки
        Routes.home: (context) => BlocProvider(
          create: (_) => DbmsBloc()..add(const LoadDbmsEvent()),
          child: const HomePage(),
        ),

        Routes.detail: (context) => const DetailPage(),
        Routes.profile: (context) => const ProfilePage(),
      },
    );
  }
}