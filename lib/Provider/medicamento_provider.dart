import 'package:flutter/material.dart';
import 'package:infoclin_913/Api/Medicamento_api.dart';
import 'package:infoclin_913/domain/Medicamentos.dart';

class MedicamentoProvider extends ChangeNotifier {
  final MedicamentoApi _medicamentoApi = MedicamentoApi();

  List<Medicamento> _listaMedicamentos = [];
  bool _carregando = false;
  String? _erro;
  bool _expandido = false;

  // Getters
  List<Medicamento> get listaMedicamentos => _listaMedicamentos;
  bool get carregando => _carregando;
  String? get erro => _erro;
  bool get expandido => _expandido;
  int get tamanhoLista => _expandido ? _listaMedicamentos.length : 0;

  // Carrega medicamentos da API
  Future<void> carregarMedicamentos({int limite = 30}) async {
    if (_listaMedicamentos.isEmpty) {
      _carregando = true;
      _erro = null;
      notifyListeners();

      try {
        _listaMedicamentos = await _medicamentoApi.listarMedicamentos(limite: limite);
        _expandido = true;
        _carregando = false;
        notifyListeners();
      } catch (e) {
        _erro = 'Erro ao carregar medicamentos: ${e.toString()}';
        _carregando = false;
        notifyListeners();
      }
    } else {
      toggleExpandir();
    }
  }

  // Alterna entre expandir/recolher a lista
  void toggleExpandir() {
    _expandido = !_expandido;
    notifyListeners();
  }

  // Recarrega os medicamentos (força atualização)
  Future<void> recarregarMedicamentos({int limite = 30}) async {
    _listaMedicamentos.clear();
    _expandido = false;
    await carregarMedicamentos(limite: limite);
  }

  // Limpa os dados
  void limpar() {
    _listaMedicamentos.clear();
    _carregando = false;
    _erro = null;
    _expandido = false;
    notifyListeners();
  }
}