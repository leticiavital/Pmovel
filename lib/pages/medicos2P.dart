import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infoclin_913/Domain/doctors.dart';
import 'package:infoclin_913/providers/doctros_provider.dart';
import 'package:provider/provider.dart';

class Medicos2p extends StatefulWidget {
  const Medicos2p({Key? key}) : super(key: key);

  @override
  State<Medicos2p> createState() => _Medicos2pState();
}

class _Medicos2pState extends State<Medicos2p> {
  @override
  void initState() {
    super.initState();

    /*Future.microtask: é uma forma de adiar a execução de uma função
    para depois que a tela e o BuildContext estejam prontos.
    Serve para evita erros ao chamar métodos do Provider no initState(),
    garantindo que o código seja executado de forma segura logo após a criação do widget.*/
    Future.microtask(() =>
        context.read<DoctorsProvider>().loadDoctors()
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<DoctorsProvider>();

    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(),
        backgroundColor: Color(0xffeff9ff),
        body: Padding(
          padding: EdgeInsets.all(15),
          child: buildDoctors2(provider),
        ),
      ),
    );
  }

  Widget buildDoctors2(DoctorsProvider provider) {
    if (provider.isLoading) {
      return Center(child: CircularProgressIndicator());
    }

    if (provider.error != null) {
      return Center(child: Text(provider.error!));
    }

    return ListView.builder(
      itemCount: provider.doctors.length,
      itemBuilder: (context, index) {
        return buildDoctos(provider.doctors[index]);
      },
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
            fontSize: 40,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        Text(
          'MÉDICOS',
          style: GoogleFonts.cinzel(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 19,
          ),
        ),
      ],
    ),
  );
}

buildDoctos(Doctors doctors) {
  return Container(
    decoration: BoxDecoration(
      color:  Color(0xFFe8f0ff),
      border: Border.all(color: Color(0xFF4A90E2), width: 2.5),
      borderRadius: BorderRadius.circular(40),
    ),
    padding: EdgeInsets.all(12),
    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
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
        SizedBox(width: 20),
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
              SizedBox(height: 4),
              Text(
                doctors.phone,
                style: GoogleFonts.cairo(
                  color: Colors.black87,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 6),
              Text(
                doctors.specialties.isNotEmpty
                    ? doctors.specialties.join(", ")
                    : "Especialidade não informada",
                style: GoogleFonts.cairo(
                  color: Color(0xFF0b6cad),
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
