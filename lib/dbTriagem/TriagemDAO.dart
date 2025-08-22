import 'package:sqflite/sqflite.dart';

import '../Domain/triagem.dart';
import 'dbTriagem.dart';

class TriagemDao {
  Future<List<Triagem>> listarTriagem() async {
    Database db = await  DBHelper().initDB();
    String sql = 'SELECT * FROM Triagem';
    var result = await db.rawQuery(sql);

    List<Triagem> listaTriagem = [];

    for (var json in result) {
      Triagem triagem = Triagem.fromJson(json);
      listaTriagem.add(triagem);
    }

    return listaTriagem;
  }

  Future<void> inserirTriagem(Triagem t) async {
    Database db = await  DBHelper().initDB();
    db.insert(
      'Triagem',
      t.toJson()
    );
  }
}

