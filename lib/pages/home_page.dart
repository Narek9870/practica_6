import 'package:flutter/material.dart';
import '../routes.dart';
import 'profile_page.dart';
import 'package:flutter/foundation.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Индекс для нижнего меню (0 - Главная, 1 - Профиль)
  int _selectedIndex = 0;

  // Наши экраны для переключения в меню
  final List<Widget> _screens = [
    const _DbmsListContent(), // Наш список СУБД
    const ProfilePage(),      // Ваш экран профиля
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // IndexedStack позволяет переключать экраны без потери их состояния
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),

      // Нижнее меню
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.lightGreenAccent.shade100,
        indicatorColor: Colors.lightGreenAccent,
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Главная',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Профиль',
          ),
        ],
      ),
    );
  }
}


// ВНУТРЕННИЙ КЛАСС: САМ СПИСОК СУБД (АДАПТИВНЫЙ И ПЛАТФОРМОЗАВИСИМЫЙ)
class _DbmsListContent extends StatelessWidget {
  const _DbmsListContent();

  final List<Map<String, String>> dbmsList = const [
    {'name': '1. PostgreSQL', 'desc': 'Мощная объектно-реляционная СУБД'},
    {'name': '2. MySQL', 'desc': 'Самая популярная СУБД для веб-сайтов'},
    {'name': '3. Oracle DB', 'desc': 'Надежная корпоративная база данных'},
    {'name': '4. MongoDB', 'desc': 'Документоориентированная NoSQL БД'},
    {'name': '5. Redis', 'desc': 'СУБД типа "ключ-значение" в памяти'},
  ];

  @override
  Widget build(BuildContext context) {
    //АДАПТИВНЫЕ ОТСТУПЫ
    final double platformPadding =
    (kIsWeb ||
        defaultTargetPlatform == TargetPlatform.windows ||
        defaultTargetPlatform == TargetPlatform.macOS ||
        defaultTargetPlatform == TargetPlatform.linux)
        ? 50.0  // Если это Браузер или ПК - отступ 50
        : 20.0; // Если это Телефон - отступ 20

    return Scaffold(
      appBar: AppBar(
        title: const Text('СИСТЕМЫ СУБД', style: TextStyle(fontFamily: 'CustomFont')),
        backgroundColor: Colors.lightGreenAccent,
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Проверяем ширину экрана для сетки
          bool isWideScreen = constraints.maxWidth > 600;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Карусель картинок
                SizedBox(
                  height: 100,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    separatorBuilder: (_, __) => const SizedBox(width: 16),
                    itemBuilder: (context, index) {
                      return Container(
                        width: 140,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1.5),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(13.0),
                          child: Image.asset('assets/images/${index + 1}.png', fit: BoxFit.cover),
                        ),
                      );
                    },
                  ),
                ),

                //ПРИМЕНЯЕМ НАШ ПЛАТФОРМЕННЫЙ ОТСТУП
                SizedBox(height: platformPadding),

                // АДАПТИВНЫЙ СПИСОК
                Expanded(
                  child: isWideScreen
                      ? GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: dbmsList.length,
                    itemBuilder: (context, index) => _buildCard(context, index),
                  )
                      : ListView.builder(
                    itemCount: dbmsList.length,
                    itemBuilder: (context, index) => _buildCard(context, index),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // Метод для создания карточки
  Widget _buildCard(BuildContext context, int index) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        leading: const Icon(Icons.storage, color: Colors.blue, size: 30),
        title: Text(dbmsList[index]['name']!, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(dbmsList[index]['desc']!),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          Navigator.pushNamed(
            context,
            Routes.detail,
            arguments: {
              'name': dbmsList[index]['name'],
              'desc': dbmsList[index]['desc'],
              'image': 'assets/images/${index + 1}.png',
            },
          );
        },
      ),
    );
  }
}