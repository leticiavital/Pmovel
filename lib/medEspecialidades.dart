import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infoclin_913/Domain/Organizacao.dart';
import 'package:infoclin_913/api/organicao_api.dart';
import 'package:infoclin_913/tela_map.dart';

class Medespecialidades extends StatefulWidget {
  const Medespecialidades({Key? key}) : super(key: key);

  @override
  State<Medespecialidades> createState() => _MedespecialidadesState();
}

class _MedespecialidadesState extends State<Medespecialidades> {
  late Future<List<Organizations>> futureOrg;

  @override
  void initState() {
    super.initState();
    futureOrg = OrganicaoApi().findEsp();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(),
        backgroundColor: const Color(0xffeff9ff),
        body: FutureBuilder<List<Organizations>>(
          future: futureOrg,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(child: Text('Erro encontrado'));
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('Nenhuma especialidade encontrada'));
            }

            List<Organizations> organizations = snapshot.data!;
            return ListView.builder(
              itemCount: organizations.length,
              itemBuilder: (context, index) {
                return buildEsp(organizations[index]);
              },
            );
          },
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      toolbarHeight: 140,
      centerTitle: true,
      title: Text(
        'Clínicas especializadas',
        style: GoogleFonts.cinzel(
          fontSize: 40,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        maxLines: 2,
      ),
      backgroundColor: const Color(0xFF7cb2d6),
    );
  }

  Widget buildEsp(Organizations organizations) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.blue,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            organizations.name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          const Text(
            "Especialidades:",
            style: TextStyle(
              color: Colors.white70,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 6),

          Text(
            organizations.specialties.isNotEmpty
                ? organizations.specialties.join(', ')
                : 'Nenhuma especialidade cadastrada.',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),

          const SizedBox(height: 20),

          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => MapScreen(organization: organizations),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
              ),
              child: const Text(
                "Ver no mapa",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
