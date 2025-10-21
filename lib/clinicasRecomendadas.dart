import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Clinicasrecomendadas extends StatefulWidget {
  const Clinicasrecomendadas({super.key});

  @override
  State<Clinicasrecomendadas> createState() => _ClinicasrecomendadasState();
}

class _ClinicasrecomendadasState extends State<Clinicasrecomendadas> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildappbar(),
        body: ListView(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFE8F0FE),
                border: Border.all(color: Color(0xFF4A90E2), width: 1.5),
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.all(12),
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '',
                    style: GoogleFonts.cairo(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('', style: GoogleFonts.cairo(fontSize: 13)),
                  SizedBox(height: 8),

                  Text(
                    '',
                    style: GoogleFonts.cairo(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('', style: GoogleFonts.cairo(fontSize: 13)),
                  SizedBox(height: 8),

                  Text(
                    '',
                    style: GoogleFonts.cairo(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('', style: GoogleFonts.cairo(fontSize: 13)),
                  SizedBox(height: 8),

                  Text(
                    '',
                    style: GoogleFonts.cairo(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('', style: GoogleFonts.cairo(fontSize: 13)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildappbar() {
    return AppBar(
      centerTitle: true,
      backgroundColor: Color(0xFF7cb2d6),
      toolbarHeight: 180,
      leading: IconButton(
        onPressed: () {},
        icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 35),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.place, size: 55, color: Colors.red),
        ),
      ],
      title: Column(
        children: [
          Text(
            'CLINICAS',
            maxLines: 2,
            style: GoogleFonts.cinzel(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            'HOSPITALARES',
            maxLines: 2,
            style: GoogleFonts.cinzel(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),

        ],
      ),
    );
  }
}
