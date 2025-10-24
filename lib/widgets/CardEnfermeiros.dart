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
        color: const Color(0xFFe8f0ff),
        border: Border.all(color: const Color(0xFF4A90E2), width: 2.5),
        borderRadius: BorderRadius.circular(40),
      ),
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(1000),
            child: Image.network(widget.enfermeiros.urlImage,
              width: 80,
              height: 80,
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.enfermeiros.nome,
                  style: GoogleFonts.cairo(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text(
                  widget.enfermeiros.cargo,
                  style: GoogleFonts.cairo(
                      color: Colors.black87,
                      fontSize: 14,
                      fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  widget.enfermeiros.turno,
                  style: GoogleFonts.cairo(
                      color: Color(0xFF4A90E2),
                      fontSize: 14,
                      fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  widget.enfermeiros.status,
                  style: GoogleFonts.cairo(
                      color: Color(0xFF4A90E2),
                      fontSize: 14,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
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