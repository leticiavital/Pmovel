import 'package:flutter/material.dart';
import 'package:infoclin_913/domain/Medicamentos.dart';


class CardMedicamento extends StatefulWidget {
  final Medicamento medicamento;
  const CardMedicamento({Key? key, required this.medicamento}) : super(key: key);


  @override
  State<CardMedicamento> createState() => _CardMedicamentoState();
}


class _CardMedicamentoState extends State<CardMedicamento> {
  bool _expandido = false;


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.symmetric(vertical: 6, horizontal: 4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Color(0xFF87CEEB).withOpacity(0.3), width: 1),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Color(0xFF87CEEB).withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.medication,
                      size: 24,
                      color: Color(0xFF87CEEB),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildText(
                          text: widget.medicamento.nomeMedicamento,
                          maxLines: _expandido ? null : 2,
                        ),
                        SizedBox(height: 4),
                        _buildText(
                          text: widget.medicamento.principioAtivo,
                          style: TextStyle(fontStyle: FontStyle.italic),
                          maxLines: _expandido ? null : 1,
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      _expandido ? Icons.expand_less : Icons.expand_more,
                      color: Color(0xFF87CEEB),
                      size: 28,
                    ),
                    onPressed: () {
                      setState(() {
                        _expandido = !_expandido;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildText({required String text, TextStyle? style, int? maxLines}) {
    return Text(
      text,
      style: style ?? TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.grey[800]),
      maxLines: maxLines,
      overflow: maxLines == null ? null : TextOverflow.ellipsis,
    );
  }


  Widget _buildDetalheItem({
    required IconData icon,
    required String titulo,
    required String valor,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 18, color: Color(0xFF87CEEB)),
        SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                titulo,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 2),
              Text(
                valor,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey[800],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
