import 'package:infoclin_913/domain/Saude.dart';
import 'package:infoclin_913/Api/Saude_api.dart';


class SaudeDao {
  final SaudeApi _api = SaudeApi();

  Future<List<ArtigoSaude>> buscarArtigos() async {
    try {
      return await _api.listarArtigos();
    } catch (e) {
      throw Exception('Erro no DAO ao buscar artigos: $e');
    }
  }


  List<ArtigoSaude> filtrarPorAutor(
      List<ArtigoSaude> artigos,
      String nomeAutor,
      ) {
    return artigos
        .where((artigo) =>
        artigo.autor.toLowerCase().contains(nomeAutor.toLowerCase()))
        .toList();
  }

  List<ArtigoSaude> filtrarPorTitulo(
      List<ArtigoSaude> artigos,
      String palavraChave,
      ) {
    return artigos
        .where((artigo) =>
        artigo.titulo.toLowerCase().contains(palavraChave.toLowerCase()))
        .toList();
  }


  bool validarLista(List<ArtigoSaude> artigos) {
    return artigos.isNotEmpty;
  }

  int contarArtigos(List<ArtigoSaude> artigos) {
    return artigos.length;
  }

  ArtigoSaude? buscarPorId(List<ArtigoSaude> artigos, String id) {
    try {
      return artigos.firstWhere((artigo) => artigo.id == id);
    } catch (e) {
      return null;
    }
  }
}

