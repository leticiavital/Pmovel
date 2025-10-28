import 'package:dio/dio.dart';
import 'package:infoclin_913/domain/Medicamentos.dart';

class MedicamentoApi {
  final String baseUrl = "https://bula.landin.dev.br/busca/busca-st?termo=&pagina=0";
  final Dio _dio = Dio();

  Future<List<Medicamento>> listarMedicamentos({
    int limite = 50,
    int offset = 0,
  }) async {
    final response = await _dio.get(baseUrl);

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = response.data;
      final List<dynamic> lista = jsonData['resultado'] ?? [];

      return lista
          .map((e) => Medicamento.fromJson(e))
          .toList();
    }

    // Se não for 200, retorna uma lista vazia
    return [];
  }

  /// Busca medicamentos por página (helper para paginação)
  Future<List<Medicamento>> buscarPorPagina(
      int pagina, {
        int itensPorPagina = 30,
      }) async {
    final offset = pagina * itensPorPagina;
    return await listarMedicamentos(limite: itensPorPagina, offset: offset);
  }
}
