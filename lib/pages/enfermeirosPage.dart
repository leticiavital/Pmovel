import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infoclin_913/Domain/enfermeiros.dart';
import 'package:infoclin_913/api_medico/enfermeiros_api.dart';
import 'package:infoclin_913/widgets/CardEnfermeiros.dart';

class Enfermeirospage extends StatefulWidget {

  @override
  State<Enfermeirospage> createState() => _EnfermeirospageState();
}

class _EnfermeirospageState extends State<Enfermeirospage> {

  late Future<List<Enfermeiros1>> futurelistEnfermeiros;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    futurelistEnfermeiros = EnfermeirosApi().findAll();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(),
        body: Padding(
        padding: EdgeInsets.all(20),
    // FOR
    child: FutureBuilder<List<Enfermeiros1>>(
    future: futurelistEnfermeiros,
    builder: (context, snapshot) {
    if (snapshot.hasData) {
    List<Enfermeiros1> lista = snapshot.requireData;
    return buildListView(lista);
    }

    return Center(child: CircularProgressIndicator());
    },
    ),
    ),
    ),
    );
  }

  buildListView(List<Enfermeiros1> listaEnfermeiros) {
    return ListView.builder(
      itemCount: listaEnfermeiros.length,
      itemBuilder: (context, i) {
        return Cardenfermeiros(
          enfermeiros: listaEnfermeiros[i],
        );
      },
        );
  }
  }
buildAppBar() {
  return AppBar(
    toolbarHeight: 140,
    centerTitle: true,
    backgroundColor: Color(0xFF7cb2d6),
    title: Text(
      'ENFERMEIROS',
      maxLines: 10,
      style: GoogleFonts.cinzel(
          fontSize: 40, fontWeight: FontWeight.w600, color: Colors.white),
    ),
  );
}