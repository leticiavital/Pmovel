import 'package:infoclin_913/exames.dart';
import 'package:sqflite/sqflite.dart';
import 'db_helper.dart';

class ExamesDao {
  Future<List<Exames>> listarExames() async {
    Database db = await DBHelper().initDB();
    String sql = 'SELECT * FROM Exames;';
    var result = await db.rawQuery(sql);

    List<Exames> listaExames = [];

    // ForEach
    for (var json in result) {
    Exames exames = Exames.fromJson(json);
      listaExames.add(exames);
    }

    return listaExames;
  }
  Future<List<Exames>> listarexamesGeneroIdade(String genero, String idade) async {
    Database db = await DBHelper().initDB();
    String sql = 'SELECT * FROM Exames WHERE genero = ? and idade = ?;';
    var result = await db.rawQuery(sql, [genero, idade]);

    List<Exames> listaExames = [];

    // ForEach
    for (var json in result) {
      Exames exames = Exames.fromJson(json);
      listaExames.add(exames);
    }

    return listaExames;
  }

}