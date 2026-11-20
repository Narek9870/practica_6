import 'package:injectable/injectable.dart';
import '../models/dbms.dart';
import 'database.dart' as db; // Подключаем файл базы данных с префиксом

@lazySingleton // Говорим DI-контейнеру: создай этот репозиторий, когда он впервые понадобится
class DbmsRepository {
  final db.AppDatabase _db;

  // Репозиторий просит базу данных через конструктор (Внедрение зависимости!)
  DbmsRepository(this._db);

  // Метод получения всех СУБД из базы
  Future<List<Dbms>> fetchDbmsList() async {
    // 1. Просим Drift достать все строки из таблицы
    final List<db.DbmsRow> rows = await _db.select(_db.dbmsTable).get();

    // 2. Превращаем каждую строку (DbmsRow) в нашу модель (Dbms)
    return rows.map((row) => Dbms(
      id: row.id,
      name: row.name,
      desc: row.desc,
      imagePath: row.imagePath,
    )).toList();
  }
}