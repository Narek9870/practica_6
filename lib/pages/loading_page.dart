import 'package:flutter/material.dart';
import '../routes.dart'; // Подключаем наши маршруты

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    // Имитация инициализации (загрузки) - ждем 4 секунды
    Future.delayed(const Duration(seconds: 4), () {
      if (!mounted) return; // Проверка, что виджет еще существует

      // Переход на экран логина с ЗАМЕНОЙ (pushReplacementNamed)
      Navigator.pushReplacementNamed(context, Routes.login);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Иконка по макету
            Icon(
              Icons.storage,
              size: 100,
              color: Colors.blue,
            ),
            SizedBox(height: 20),
            // НАЗВАНИЕ ПРИЛОЖЕНИЯ
            Text(
              'СИСТЕМЫ СУБД',
              style: TextStyle(
                fontFamily: 'CustomFont', // Наш шрифт
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}