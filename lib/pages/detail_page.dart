import 'package:flutter/material.dart';

// ИМПОРТ КНОПКИ ПЕРЕКЛЮЧЕНИЯ ТЕМЫ
import '../theme/theme_toggle_action.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Получаем данные, которые мы передали с прошлого экрана (имя, описание, картинка)
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          args['name'],
          style: const TextStyle(fontFamily: 'CustomFont'),
        ),
        centerTitle: true,
        actions: const [
          ThemeToggleAction(), // кнопка переключение темы
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Картинка по макету
            Container(
              height: 200,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1.5),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Image.asset(
                args['image'],
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 20),

            // Описание пункта N по макету
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1.5),
              ),
              child: Text(
                args['desc'],
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
    );
  }
}