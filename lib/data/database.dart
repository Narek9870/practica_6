import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:injectable/injectable.dart';

// Этот файл сгенерируется автоматически чуть позже, пока будет светиться красным!
part 'database.g.dart';

//ОПИСЫВАЕМ ТАБЛИЦУ (Как в SQL)
@DataClassName('DbmsRow') // Чтобы имя не конфликтовало с нашей моделью Dbms
class DbmsTable extends Table {
  IntColumn get id => integer().autoIncrement()(); // Уникальный ID
  TextColumn get name => text()();                 // Название
  TextColumn get desc => text()();                 // Описание
  TextColumn get imagePath => text()();            // Путь к картинке
}

//ФУНКЦИЯ ОТКРЫТИЯ СОЕДИНЕНИЯ С ФАЙЛОМ БАЗЫ НА ТЕЛЕФОНЕ
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    return driftDatabase(
      name: 'dbms_drift.db', // Так будет называться файл в памяти телефона
      native: const DriftNativeOptions(
        databaseDirectory: getApplicationSupportDirectory, // Системная папка
      ),
    );
  });
}

//САМА БАЗА ДАННЫХ
@lazySingleton // Аннотация для DI-контейнера (создастся только когда понадобится)
@DriftDatabase(tables: [DbmsTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1; // Версия базы данных

  //СТРАТЕГИЯ МИГРАЦИЙ И ПЕРВИЧНОЕ ЗАПОЛНЕНИЕ
  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async {
      await m.createAll(); // Создаем пустую таблицу

      // Сразу заполняем её стартовыми данными (batch - выполнение за один проход)
      await batch((batch) {
        batch.insertAll(dbmsTable, [
          DbmsTableCompanion.insert(
            name: '1. PostgreSQL',
            desc: 'Мощная объектно-реляционная СУБД',
            imagePath: 'assets/images/1.png',
          ),
          DbmsTableCompanion.insert(
            name: '2. MySQL',
            desc: 'Самая популярная СУБД для веб-сайтов',
            imagePath: 'assets/images/2.png',
          ),
          DbmsTableCompanion.insert(
            name: '3. Oracle DB',
            desc: 'Надежная корпоративная база данных',
            imagePath: 'assets/images/3.png',
          ),
          DbmsTableCompanion.insert(
            name: '4. MongoDB',
            desc: 'Документоориентированная NoSQL БД',
            imagePath: 'assets/images/4.png',
          ),
          DbmsTableCompanion.insert(
            name: '5. Redis',
            desc: 'СУБД типа "ключ-значение" в памяти',
            imagePath: 'assets/images/5.png',
          ),
        ]);
      });
    },
  );
}