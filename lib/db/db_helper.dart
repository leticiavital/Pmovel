import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  Future<Database> initDB() async {
    String path = await getDatabasesPath();
    String dbName = 'exames.db';

    // C:/aqrquivos/jkdahsdja/airbnb.db
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
    String sql = '''CREATE TABLE Exames (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    genero varchar(20),
    nome varchar(50),
    indicacao varchar(100),
    frequencia varchar(100),
    porquefazer varchar(200)
    );''';

    await db.execute(sql);

    sql =
    "INSERT INTO exames (genero, nome, indicacao,frequencia,porquefazer) VALUES ('homem','Hemograma completo', 'A partir dos 20 anos','Anualmente','Avaliar anemia, infecções e estado geral de saúde');";
    await db.execute(sql);

  }
}