import 'package:flutter/material.dart';
import '../domain/cancer.dart';

class CardCancer extends StatefulWidget {
  final Cancer cancer;

  CardCancer({
    required this.cancer,
    super.key,
  });

  @override
  State<CardCancer> createState() => _CardCancerState();
}

class _CardCancerState extends State<CardCancer> {
  Cancer get cancer => widget.cancer;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Nome
          Row(
            children: [
              buildText(
                text: cancer.nomeCancer,
                fontSize: 17.0,
                fontWeight: FontWeight.w600,
              ),
              const Spacer(),
              const Icon(Icons.local_hospital, size: 16, color: Color(0xFF87CEEB)),
            ],
          ),
          const SizedBox(height: 16),

          // Forma de diagnóstico
          buildText(
            text: "Diagnóstico: ${cancer.formadiagnostico}",
          ),

          // Nível de gravidade
          buildText(
            text: 'Gravidade: ${cancer.nivelGravidadedoCancer}',
            fontWeight: FontWeight.w600,
            color: const Color(0xFF87CEEB),
          ),
        ],
      ),
    );
  }

  Widget buildText({
    required String text,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
  }) {
    return Text(
      text,
      style: TextStyle(
        color: color ?? Colors.black,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
