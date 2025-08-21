import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infoclin2/domain/medico.dart';

class CardMedico extends StatefulWidget {
  Medico medico;

  CardMedico({
    required this.medico,
    super.key,
  });

  @override
  State<CardMedico> createState() => _CardMedicoState();
}

class _CardMedicoState extends State<CardMedico> {
  // String get urlImage => widget.urlImage;
  Medico get medico => widget.medico;

  // String getUrlImage {
  //   return widget.urlImage;
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(medico.urlImage),
          ),
          SizedBox(height: 16),
          Row(
            children: [
              buildText(
                text: medico.nome,
                fontSize: 17.0,
                fontWeight: FontWeight.w600,
              ),
              Spacer(),
              Icon(Icons.star, size: 16),
              buildText(
                text: '4.76',
                fontSize: 16.0,
                color: Colors.black,
              ),
            ],
          ),
          buildText(text: widget.medico.especialidade),
          buildText(text: widget.medico.estado),
          buildText(
            text: '\$${widget.medico.email} total',
            fontWeight: FontWeight.w600,
          ),
        ],
      ),
    );
  }

  buildText({required text, color, fontSize, fontWeight}) {
    return Text(
      text,
      style: GoogleFonts.inter(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}