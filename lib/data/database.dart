import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:injectable/injectable.dart';

part 'database.g.dart';

@DataClassName('DbmsRow')
class DbmsTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get desc => text()();
  TextColumn get imagePath => text()();
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    return driftDatabase(
      name: 'dbms_drift.db',
      native: const DriftNativeOptions(
        databaseDirectory: getApplicationSupportDirectory,
      ),
    );
  });
}

@lazySingleton
@DriftDatabase(tables: [DbmsTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async {
      await m.createAll();

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
