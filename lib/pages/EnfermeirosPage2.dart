import 'package:flutter/material.dart';
import 'package:infoclin_913/providers/enfermeiros_provider.dart';
import 'package:infoclin_913/widgets/CardEnfermeiros.dart';
import 'package:provider/provider.dart';

import 'enfermeirosPage.dart';

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
          padding: const EdgeInsets.all(20),
          child: buildList(provider),
        ),
      ),
    );
  }

  Widget buildList(EnfermeirosProvider provider) {
    if (provider.isLoading) {
      return const Center(child: CircularProgressIndicator());
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
