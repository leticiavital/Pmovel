import 'package:flutter/material.dart';
import 'package:infoclin_913/domain/tratamento.dart';

class CardTratamento extends StatelessWidget {
  final Tratamento tratamento;

  const CardTratamento({Key? key, required this.tratamento}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tratamento.nomeTratamento,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Indicação: ${tratamento.indicacaoTratamento}",
              style: const TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 8),
            Text(
              tratamento.descricaoTratamento,
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 12),
            Text(
              "Efeitos Colaterais:",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            ...tratamento.efeitosColaterais.map((efeito) => Text("- $efeito")),
          ],
        ),
      ),
    );
  }
}
