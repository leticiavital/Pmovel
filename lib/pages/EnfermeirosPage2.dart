import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infoclin_913/providers/enfermeiros_provider.dart';
import 'package:infoclin_913/widgets/CardEnfermeiros.dart';
import 'package:provider/provider.dart';

class Enfermeirospage2 extends StatefulWidget {
  @override
  State<Enfermeirospage2> createState() => _Enfermeirospage2State();
}

class _Enfermeirospage2State extends State<Enfermeirospage2> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        context.read<EnfermeirosProvider>().loadEnfermeiros()
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<EnfermeirosProvider>();

    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: buildEnfermeiros1(provider),
        ),
      ),
    );
  }

  buildEnfermeiros1(EnfermeirosProvider provider) {
    if (provider.isLoading) {
      return Center(child: CircularProgressIndicator());
    }

    if (provider.error != null) {
      return Center(child: Text(provider.error!));
    }

    return ListView.builder(
      itemCount: provider.enfermeiros.length,
      itemBuilder: (context, i) {
        return Cardenfermeiros(
          enfermeiros: provider.enfermeiros[i],
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


