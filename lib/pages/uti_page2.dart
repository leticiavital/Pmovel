import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infoclin_913/Domain/medico2.dart';
import 'package:infoclin_913/api_medico/doctors_api.dart';
import 'package:infoclin_913/domain/medico.dart';
import 'package:path/path.dart';

import '../db/medicos_dao.dart';
import 'TelaMenu.dart';

class UTI_page2 extends StatefulWidget {

  const UTI_page2({Key? key}) : super(key: key);

  @override
  State<UTI_page2> createState() => _UTI_page2();
}

class _UTI_page2 extends State<UTI_page2> {

  TextEditingController credentialsController = TextEditingController();
  
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
        body: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 5.0),
                  margin: EdgeInsets.all(30.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Color(0xFF7cb2d6),
                  ),
                  child: Text('MÉDICOS RECOMENDADOS',
                    style: GoogleFonts.cinzel(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),
                  ),
                ),
                FutureBuilder(future: futureDoctors, builder: (context, snapshot){
                  if (snapshot.hasError){
                    return Center(child: Text('Um erro foi encontrado')
                    );
                  }
                  if(snapshot.hasData){
                    List<Doctors> doctors = snapshot.requireData;
                    return ListView.builder(
                      itemCount: doctors.length,
                        itemBuilder: (context, i){
                        return buildDoctors(doctors[i]);
                    }
                    );
                  }
                    return Center(child: CircularProgressIndicator());
                }
                ),
            ]
        ),
        ],
      ),
    ),
    );
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
}

buildDoctors(Doctors doctors){
  return Container(
    padding:
    EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
    margin: EdgeInsets.all(16.0),
    decoration: BoxDecoration(
        color: Color(0xFF7cb2d6),
        borderRadius: BorderRadius.circular(20)
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            ClipRRect(
              child: Image.asset('',
                width: 150,),
              borderRadius: BorderRadius.circular(1000),
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(doctors.name,
                  style: GoogleFonts.cairo(
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}

