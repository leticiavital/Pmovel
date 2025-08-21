import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  Future<Database> initDB() async {
    String path = await getDatabasesPath();
    String dbName = 'uti.db';

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
    String sql = '''CREATE TABLE Medico(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      nome VARCHAR(80),
      especialidade VARCHAR(30),
      estado VARCHAR(50),
      email VARCHAR(30),
      urlImage TEXT
      );''';

    await db.execute(sql);

    sql =
    "INSERT INTO Medico(nome, especialidade, estado, email, urlImage) VALUES ('Dra Fernanda' ,'Neurologia', 'Alagoas', 'drafernanda@gmail.com', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQPd1ag04qAxUqyFsA1waifXN9eNnce45gdKQ&s');";
    await db.execute(sql);
  }
}