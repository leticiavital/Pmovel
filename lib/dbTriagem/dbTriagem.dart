import



'dart:async';
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
      idade INTEGER,
      sexo TEXT,
      doencaHeriditaria TEXT, 
      sintoma TEXT
      );''';

    await db.execute(sql);

    sql =
    "INSERT INTO Triagem(idade, sexo, doencaHereditaria, sintoma) VALUES (28 ,'Feminino', null, 'Dor de cabeça');";
    await db.execute(sql);
  }

}