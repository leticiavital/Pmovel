import 'package:infoclin2/domain/usuario.dart';
import 'package:sqflite/sqflite.dart';
import 'db_helper.dart';

class UsuariosDao {
  Future<List<Usuario>> listarUsuarios() async {
    Database db = await DBHelper().initDB();
    String sql = 'SELECT * FROM Usuario;';
    var result = await db.rawQuery(sql);

    List<Usuario> listaUsuarios = [];

    // ForEach
    for (var json in result) {
      Usuario usuario = Usuario.fromJson(json);
      listaUsuarios.add(usuario);
    }

    return listaUsuarios;
  }

  Future<void> inserirUsuario(Usuario u) async {
    Database db = await  DBHelper().initDB();
    db.insert(
        'Usuario',
        u.toJson()
    );
  }
}