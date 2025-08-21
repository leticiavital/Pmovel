import 'package:infoclin_913/%20database/database_helper.dart';
import "package:infoclin_913/domain/cancer.dart";
import 'package:sqflite/sqflite.dart';

class CancerDao {
  Future<List<Cancer>> listarCanceres() async {
    Database db = await DBHelper().initDB();
    String sql = 'SELECT * FROM CANCER;';
    var result = await db.rawQuery(sql);

    List<Cancer> listaCanceres = [];

    await Future.delayed(Duration(seconds: 2));

// ForEach
    for (var json in result) {
    Cancer cancer = Cancer.fromJson(json);
    listaCanceres.add(cancer);
    }

    return listaCanceres;

  }

  Future<List<Cancer>> buscarPorSintoma(String sintoma) async {
    Database db = await DBHelper().initDB();
    String sql = 'SELECT * FROM Cancer WHERE sintomas LIKE ?';
    var result = await db.rawQuery(sql, ['%$sintoma%']);

    List<Cancer> listaCanceres = [];

    for (var json in result) {
    Cancer cancer = Cancer.fromJson(json);
    listaCanceres.add(cancer);
    }

    return listaCanceres;


  }
}
