import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infoclin_913/Domain/doctors.dart';
import 'package:infoclin_913/api_medico/doctors_api.dart';
import 'package:infoclin_913/pages/enfermeirosPage.dart';
import 'package:path/path.dart';

class UTI_page2 extends StatefulWidget {

  const UTI_page2({Key? key}) : super(key: key);

  @override
  State<UTI_page2> createState() => _UTI_page2();
}

class _UTI_page2 extends State<UTI_page2> {

  late Future<List<Doctors>> futureDoctors;

  @override
  void initState() {
    super.initState();
    futureDoctors = DoctorsApi().findDoctors();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:
      Scaffold(
        appBar: buildAppBar(),
        backgroundColor: Color(0xffeff9ff),
        body: Padding(padding: EdgeInsets.all(15),
        child:
        FutureBuilder(
          future: futureDoctors,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text('UM ERRO FOI ENCONTRADO'));
            }
            if (snapshot.hasData) {
              List<Doctors>? doctors = snapshot.data;
              return ListView.builder(
                itemCount: doctors?.length,
                itemBuilder: (context, index) {
                  return buildDoctos(doctors![index]);
                },
              );
            }
            return Center(child: CircularProgressIndicator(),);
          },
        ),
      ),
    ),
    );
  }
}

  buildAppBar() {
    return AppBar(
        toolbarHeight: 140,
        centerTitle: true,
        backgroundColor: Color(0xFF7cb2d6),
        title: Column(
    children: [
      Text(
          'UTI',
          maxLines: 10,
          style: GoogleFonts.cinzel(
              fontSize: 40, fontWeight: FontWeight.w600, color: Colors.white),
        ),
      Text('MÉDiCOS',
      style: GoogleFonts.cinzel(
          color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 19
      ),
      ),
      ],
    ),
    );
  }

buildDoctos(Doctors doctors) {
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
          child: Image.asset(
            'assets/iconDoctor.png',
            width: 80,
            height: 80,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                doctors.name,
                style: GoogleFonts.cairo(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                doctors.phone,
                style: GoogleFonts.cairo(
                  color: Colors.black87,
                  fontSize: 14,
                  fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 6),
              Text(
                doctors.specialties.isNotEmpty
                    ? doctors.specialties.join(", ")
                    : "Especialidade não informada",
                style: GoogleFonts.cairo(
                  color: Color(0xFF0b6cad),
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



