import "package:sqflite/sqflite.dart";
import '../ database/database_helper.dart';
import 'package:infoclin_913/domain/tratamento.dart';



class TratamentoDao {
  Future<List<Tratamento>> listarTratamentos() async {
    Database db = await DBHelper().initDB();
    String sql = 'SELECT * FROM Tratamento;';
    var result = await db.rawQuery(sql);

    List<Tratamento> listaTratamentos = [];

    await Future.delayed(Duration(seconds: 2));

// ForEach
    for (var json in result) {
    Tratamento tratamento = Tratamento.fromJson(json);
    listaTratamentos.add(tratamento);
    }
    return listaTratamentos;

  }
}
