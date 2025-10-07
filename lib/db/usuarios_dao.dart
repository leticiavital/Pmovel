import 'package:infoclin_913/domain/usuario.dart';
import 'package:sqflite/sqflite.dart';
import 'db_helper.dart';

class UsuariosDao {
  Future<List<Usuario>> listarUsuarios() async {
    Database db = await DBHelper().initDB();
    String sql = 'SELECT * FROM Usuario;';
    var result = await db.rawQuery(sql);

    List<Usuario> listaUsuarios = [];
    return listaUsuarios;
  }

    Future<bool> login(String email, String senha) async {
      Database db = await DBHelper().initDB();
      String sql = 'SELECT * FROM Usuario WHERE '
          'email = ? AND '
          'senha = ? ';
      var result = await db.rawQuery(sql, [email, senha]);
      return result.isNotEmpty;

  }

  Future<void> save(Usuario u) async {
    Database db = await DBHelper().initDB();
    db.insert('Usuario', u.toJson());
  }
}
