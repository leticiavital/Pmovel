import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  Future<Database> initDB() async {
    String path = await getDatabasesPath();
    String dbName = 'triagem.db';

    // C:/aqrquivos/jkdahsdja/uti.db
    String dbPath = join(path, dbName);
    Database database = await openDatabase(
      dbPath,
      version: 1,
      onCreate: onCreate,
    );

    print(dbPath);
    return database;
  }

  Future<void> onCreate(Database db, int version) async {
    String sql = '''CREATE TABLE Triagem(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      sexo TEXT,
      idade INTEGER,
      sintoma TEXT
      );''';

    await db.execute(sql);

    sql =
    "INSERT INTO Triagem(idade, sexo, sintoma) VALUES (28 ,'Feminino', 'Dor de cabeça');";
    await db.execute(sql);
  }

}