import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infoclin_913/api/place_api.dart';
import 'package:infoclin_913/fake_api.dart';

class Clinicasrecomendadas extends StatefulWidget {
  const Clinicasrecomendadas({super.key});

  @override
  State<Clinicasrecomendadas> createState() => _ClinicasrecomendadasState();
}

class _ClinicasrecomendadasState extends State<Clinicasrecomendadas> {
  List<String> hospitalNames = [];
  List<String> clinicasNames = [];

  @override
  void initState() {
    loadState();
    setState(() {

    });
    super.initState();
  }

  loadState() async {
    hospitalNames = await PropertiesApi().findHospitalsByCity("Arapiraca");
    clinicasNames = await ClinicasApi().findClinicasByCity("Arapiraca");
  }

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
              child: ListView.builder(
                itemCount: hospitalNames.length,
                itemBuilder: (context, i) {
                  return Text(
                    hospitalNames[i],
                    style: GoogleFonts.cairo(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFE8F0FE),
                border: Border.all(color: Color(0xFF4A90E2), width: 1.5),
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.all(12),
              margin: EdgeInsets.symmetric(vertical: 8),
              child: ListView.builder(
                itemCount: clinicasNames.length,
                itemBuilder: (context, i) {
                  return Text(
                    clinicasNames[i],
                    style: GoogleFonts.cairo(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
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
