import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import '../routes.dart';
import 'profile_page.dart';
import 'bloc/dbms_bloc.dart'; // Подключаем BLoC
import '../models/dbms.dart'; // Подключаем модель

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const _DbmsListContent(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
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

class _DbmsListContent extends StatelessWidget {
  const _DbmsListContent();

  @override
  Widget build(BuildContext context) {
    final double platformPadding =
    (kIsWeb ||
        defaultTargetPlatform == TargetPlatform.windows ||
        defaultTargetPlatform == TargetPlatform.macOS ||
        defaultTargetPlatform == TargetPlatform.linux)
        ? 50.0
        : 20.0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('СИСТЕМЫ СУБД', style: TextStyle(fontFamily: 'CustomFont')),
        backgroundColor: Colors.lightGreenAccent,
        centerTitle: true,
      ),
      // BLOC BUILDER
      body: BlocBuilder<DbmsBloc, DbmsState>(
        builder: (context, state) {
          // 1. СОСТОЯНИЕ: СТАРТ
          if (state is DbmsInitial) {
            return const Center(child: Text('Ожидание загрузки данных...'));
          }
          //СОСТОЯНИЕ: ЗАГРУЗКА
          else if (state is DbmsLoading) {
            return const Center(child: CircularProgressIndicator()); // Крутящийся индикатор
          }
          //СОСТОЯНИЕ: ОШИБКА
          else if (state is DbmsError) {
            return Center(child: Text(state.message));
          }
          //СОСТОЯНИЕ: ДАННЫЕ УСПЕШНО ЗАГРУЖЕНЫ
          else if (state is DbmsLoaded) {
            final dbmsList = state.dbmsList; // Получаем наши данные из BLoC

            return LayoutBuilder(
              builder: (context, constraints) {
                bool isWideScreen = constraints.maxWidth > 600;

                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 100,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: dbmsList.length, // Берем из BLoC
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
                                child: Image.asset(dbmsList[index].imagePath, fit: BoxFit.cover),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: platformPadding),
                      Expanded(
                        child: isWideScreen
                            ? GridView.builder(
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 3,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          itemCount: dbmsList.length, // Берем из BLoC
                          itemBuilder: (context, index) => _buildCard(context, index, dbmsList),
                        )
                            : ListView.builder(
                          itemCount: dbmsList.length, // Берем из BLoC
                          itemBuilder: (context, index) => _buildCard(context, index, dbmsList),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }

          return const SizedBox.shrink(); // Заглушка, если ничего не подошло
        },
      ),
    );
  }

  // Обновили метод карточки, теперь он принимает данные (List<Dbms>)
  Widget _buildCard(BuildContext context, int index, List<Dbms> dbmsList) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        leading: const Icon(Icons.storage, color: Colors.blue, size: 30),
        title: Text(dbmsList[index].name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(dbmsList[index].desc),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          Navigator.pushNamed(
            context,
            Routes.detail,
            arguments: {
              'name': dbmsList[index].name,
              'desc': dbmsList[index].desc,
              'image': dbmsList[index].imagePath,
            },
          );
        },
      ),
    );
  }
}