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
    "INSERT INTO Medico(nome, especialidade, estado, email, urlImage) VALUES ('Dra Fernanda Oliveira' ,'Neurologia', 'AL', 'drafernanda@gmail.com', 'assets/medica.jpg');";
    await db.execute(sql);

    sql =
    "INSERT INTO Medico(nome, especialidade, estado, email, urlImage) VALUES ('Dr Rafael' ,'Neurologia', 'AL', 'dr1rafael@gmail.com', 'assets/medico2.png');";
    await db.execute(sql);

    sql =
    "INSERT INTO Medico(nome, especialidade, estado, email, urlImage) VALUES ('Dra Luciana' ,'Cardiologia', 'PE', 'draluciana@gmail.com', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTbi5rgOsTgdefvGMAfB12cx_fsegh04n_QWg&s');";
    await db.execute(sql);

    sql =
    "INSERT INTO Medico(nome, especialidade, estado, email, urlImage) VALUES ('Dr Roberto' ,'Cardiologia', 'PE', 'dr2roberto@gmail.com', '');";
    await db.execute(sql);
  }

}