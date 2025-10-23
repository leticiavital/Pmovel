import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infoclin_913/Domain/enfermeiros.dart';

class Cardenfermeiros extends StatefulWidget {
  Enfermeiros1 enfermeiros;

  Cardenfermeiros({
    required this.enfermeiros,
    super.key,
  });

  @override
  State<Cardenfermeiros> createState() => _CardenfermeirosState();
}

class _CardenfermeirosState extends State<Cardenfermeiros> {
  // String get urlImage => widget.urlImage;
  Enfermeiros1 get enfermeiros => widget.enfermeiros;

  // String getUrlImage {
  //   return widget.urlImage;
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFe8f0ff),
        border: Border.all(color: Color(0xFF4A90E2), width: 1.5),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
      children: [
      ClipRRect(
      child: 
          Image.network(widget.enfermeiros.urlImage,
            width: 120),
          borderRadius: BorderRadius.circular(1000),
      ),
        Spacer(),
          Column(
        children: [
          Text(
            widget.enfermeiros.nome,
            style: GoogleFonts.cinzel(color: Colors.black,
            fontWeight: FontWeight.bold),
          ),
          Text(
            widget.enfermeiros.cargo,
            style: GoogleFonts.cinzel(color: Colors.black,
            fontWeight: FontWeight.bold),
          ),
          Text(
            widget.enfermeiros.turno,
            style: GoogleFonts.cinzel(color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
          Text(
            widget.enfermeiros.status,
            style: GoogleFonts.cinzel(color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ],
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