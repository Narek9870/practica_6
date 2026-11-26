import 'package:injectable/injectable.dart';
import '../models/dbms.dart';
import 'database.dart' as db;

@lazySingleton
class DbmsRepository {
  final db.AppDatabase _db;

  DbmsRepository(this._db);

  Future<List<Dbms>> fetchDbmsList() async {
    final List<db.DbmsRow> rows = await _db.select(_db.dbmsTable).get();

    return rows.map((row) => Dbms(
      id: row.id,
      name: row.name,
      desc: row.desc,
      imagePath: row.imagePath,
    )).toList();
  }
}
