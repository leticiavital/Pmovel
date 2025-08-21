import ‘package:flutter/material.dart’;

import ‘package:infoclin/domain/tratamento.dart’;

class CardTratamento extends StatefulWidget {
  Tratamento tratamento;

  CardTratamento({
    required this.tratamento,
    super.key,
  });

  @override
  State<CardTratamento> createState() => _CardTratamentoState();
}

class _CardTratamentoState extends State<CardTratamento> {
  Tratamento get tratamento => widget.tratamento;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Color(0xFFE3F2FD),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Color(0xFF87CEEB), width: 2),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                buildText(
                  text: tratamento.nome,
                  fontSize: 17.0,
                  fontWeight: FontWeight.w600,
                ),
                Spacer(),
                Icon(Icons.healing, size: 16, color: Color(0xFF87CEEB)),
                buildText(
                  text: tratamento.eficacia,
                  fontSize: 14.0,
                  color: Color(0xFF87CEEB),
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
            buildText(text: tratamento.tipo),
            buildText(text: tratamento.descricao),
            buildText(
              text: ‘Efeitos: ${tratamento.efeitosColaterais.join(”, “)}’,
              fontSize: 12.0,
              color: Colors.red[600],
            ),
          ],
        ),
      ),
    );
  }

  }
}
