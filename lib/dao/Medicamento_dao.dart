import 'package:infoclin_913/domain/Medicamentos.dart';
import 'package:infoclin_913/Api/Medicamento_api.dart';


class MedicamentoDao {
  final MedicamentoApi _api = MedicamentoApi();


  Future<List<Medicamento>> buscarMedicamentos({
    int limite = 30,
    int offset = 0,
  }) async {
    try {
      return await _api.listarMedicamentos(
        limite: limite,
        offset: offset,
      );
    } catch (e) {
      throw Exception('Erro no DAO ao buscar medicamentos: $e');
    }
  }


  /// Retorna quantidade de medicamentos
  int contarMedicamentos(List<Medicamento> medicamentos) {
    return medicamentos.length;
  }
}
