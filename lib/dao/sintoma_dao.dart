import 'package:infoclin_913/domain/sintoma.dart';
import "package:sqflite/sqflite.dart";
import '../database/database_helper.dart';


class SintomaDao {
  Future<List<Sintoma>> listarSintomas() async {
    Database db = await DBHelper().initDB();
    String sql = 'SELECT * FROM Sintoma;';
    var result = await db.rawQuery(sql);

    List<Sintoma> listaSintomas = [];


    for (var json in result) {
      Sintoma sintoma = Sintoma.fromJson(json);
    listaSintomas.add(sintoma);
    }
    //for (var map in result) {
    //   SintomaDao sintoma = SintomaDao.fromMap(map);
    //   listaSintomas.add(sintoma);
    // }

    return listaSintomas;

  }
}
