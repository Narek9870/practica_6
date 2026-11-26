import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'routes.dart';
import 'di.dart';

import 'pages/loading_page.dart';
import 'pages/login_page.dart';
import 'pages/register_page.dart';
import 'pages/home_page.dart';
import 'pages/detail_page.dart';
import 'pages/profile_page.dart';
import 'pages/bloc/dbms_bloc.dart';

import 'theme/theme_cubit.dart';
import 'theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupDI();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ThemeCubit>(),
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,

            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            themeMode: themeMode,

            initialRoute: Routes.loading,
            routes: {
              Routes.loading: (context) => const LoadingPage(),
              Routes.login: (context) => const LoginPage(),
              Routes.register: (context) => const RegisterPage(),
              Routes.home: (context) => BlocProvider(
                create: (_) => getIt<DbmsBloc>()..add(const LoadDbmsEvent()),
                child: const HomePage(),
              ),
              Routes.detail: (context) => const DetailPage(),
              Routes.profile: (context) => const ProfilePage(),
            },
          );
        },
      ),
    );
  }
}
