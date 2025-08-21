import 'package:sqflite/sqflite.dart';
import '../domain/medico.dart';
import 'db_helper.dart';

class MedicosDao {
  Future<List<Medico>> listarMedicos() async {
    Database db = await DBHelper().initDB();
    String sql = 'SELECT * FROM Medico;';
    var result = await db.rawQuery(sql);

    List<Medico> listaMedicos = [];

    await Future.delayed(Duration(seconds: 3));

    // ForEach
    for (var json in result) {
      Medico medico = Medico.fromJson(json);
      listaMedicos.add(medico);
    }

    return listaMedicos;
  }
}