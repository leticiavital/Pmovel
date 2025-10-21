import 'package:flutter/material.dart';

import 'Domain/medico2.dart';
import 'api/api_triagem.dart';



class ResultadoTriagemPage extends StatefulWidget {
  final String sintoma;

  const ResultadoTriagemPage({super.key, required this.sintoma});

  @override
  State<ResultadoTriagemPage> createState() => _ResultadoTriagemPageState();
}

class _ResultadoTriagemPageState extends State<ResultadoTriagemPage> {
  Medico? medico;
  bool carregando = true;

  @override
  void initState() {
    super.initState();
    buscarMedico();
  }

  Future<void> buscarMedico() async {
    MedicosApi api = MedicosApi();
    Medico? resultado = await api.buscarMedicoPorSintoma(widget.sintoma);
    setState(() {
      medico = resultado;
      carregando = false;
    });
  }

  AppBar buildappbar() {
    return AppBar(
      centerTitle: true,
      backgroundColor: const Color(0xFF7cb2d6),
      title: const Text(
        'Possíveis casos',
        style: TextStyle(
          fontSize: 32,
          fontFamily: 'Carrois Gothic SC',
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildappbar(),
      body: carregando
          ? const Center(child: CircularProgressIndicator())
          : medico != null
          ? Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12)),
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Médico recomendado:",
                  style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text("Nome: ${medico!.nome}", style: const TextStyle(fontSize: 16)),
                Text("Cidade: ${medico!.cidade}", style: const TextStyle(fontSize: 16)),
                Text("Telefone: ${medico!.telefone}", style: const TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ),
      )
          : const Center(
        child: Text(
          "Nenhum médico encontrado para esse sintoma.",
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
