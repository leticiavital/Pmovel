import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infoclin_913/Domain/doctors.dart';
import 'package:infoclin_913/api_medico/doctors_api.dart';

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
      child: Scaffold(
        appBar: buildAppBar(),
        backgroundColor: Color(0xffeff9ff),
        body: FutureBuilder(
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
    );
  }
}

  buildAppBar() {
    return AppBar(
      toolbarHeight: 140,
      centerTitle: true,
      title: Text(
        'UTI',
        maxLines: 10,
        style: GoogleFonts.cinzel(
            fontSize: 40, fontWeight: FontWeight.w600, color: Colors.white),
      ),
      backgroundColor: Color(0xFF7cb2d6),
    );
  }

  buildDoctos(Doctors doctors) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Color(0xFF031633),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            doctors.name,
            style: TextStyle(color: Colors.white),
          ),

          Text(
            doctors.gender,
            style: TextStyle(color: Colors.white),
          ),

          Text(
            doctors.phone,
            style: TextStyle(color: Colors.white),
          ),

        ],
      ),
    );
  }

