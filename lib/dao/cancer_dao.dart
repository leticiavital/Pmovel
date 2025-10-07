
import "package:infoclin_913/domain/cancer.dart";
import 'package:sqflite/sqflite.dart';
import '../database/database_helper.dart';

class CancerDao {
  Future<List<Cancer>> listarCanceres() async {
    Database db = await DBHelper().initDB();
    String sql = 'SELECT * FROM Cancer;';
    var result = await db.rawQuery(sql);

    List<Cancer> listaCanceres = [];

    for (var json in result) {
      Cancer cancer = Cancer.fromJson(json);
      listaCanceres.add(cancer);
    }

    return listaCanceres;

  }

//APAGAR LINHA ABAIXO 
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
