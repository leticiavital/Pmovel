import 'package:flutter/material.dart';
import 'package:infoclin_913/domain/sintoma.dart';
import 'package:infoclin_913/dao/sintoma_dao.dart';

class SintomasCard extends StatefulWidget {
  const SintomasCard({Key? key}) : super(key: key);

  @override
  State<SintomasCard> createState() => _SintomasCardState();
}

class _SintomasCardState extends State<SintomasCard> {
  late Future<List<Sintoma>> _listaSintomas;
  final SintomaDao _dao = SintomaDao();

  @override
  void initState() {
    super.initState();
    _listaSintomas = _dao.listarSintomas();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Sintoma>>(
      future: _listaSintomas,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text("Erro: ${snapshot.error}"));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text("Nenhum sintoma encontrado."));
        } else {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              Sintoma sintoma = snapshot.data![index];
              return Card(
                child: ListTile(
                  title: Text(sintoma.nomeSintoma),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(sintoma.descricaoDoSintoma),
                      Text("Urgência: ${sintoma.nivelUrgencia}"),
                    ],
                  ),
                  leading: const Icon(Icons.local_hospital),
                ),
              );
            },
          );
        }
      },
    );
  }
}
