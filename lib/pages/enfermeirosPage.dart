import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infoclin_913/Domain/enfermeiros.dart';
import 'package:infoclin_913/api_medico/enfermeiros_api.dart';

class Enfermeirospage extends StatefulWidget {
  const Enfermeirospage({super.key});

  @override
  State<Enfermeirospage> createState() => _EnfermeirospageState();
}

class _EnfermeirospageState extends State<Enfermeirospage> {

  late Future<List<Enfermeiros>> futurelistEnfermeiros;

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
    return SafeArea(child: Scaffold(
    ),
    );
  }
  }

