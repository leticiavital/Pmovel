import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infoclin_913/api/place_api.dart';
import 'package:infoclin_913/apiFake/informacoes_api.dart';
import 'package:infoclin_913/domain/informacoes.dart';
import 'domain/Place.dart';
import 'dart:math';

class Clinicasrecomendadas extends StatefulWidget {
  const Clinicasrecomendadas({super.key});

  @override
  State<Clinicasrecomendadas> createState() => _ClinicasrecomendadasState();
}

class _ClinicasrecomendadasState extends State<Clinicasrecomendadas> {
  late Future<List<Properties>> futureClinicas;
  late Future<List<Informacoes>> futureInformacoes;

  @override
  void initState() {
    super.initState();
    _loadClinicas();
  }

  void _loadClinicas() {
    setState(() {
      futureClinicas = PropertiesApi().findHospitalsByCity('Arapiraca');
      futureInformacoes = InformacoesApi().findAll();
    });
  }

  void _recarregarDados() {
    _loadClinicas();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(),
        body: FutureBuilder<List<Properties>>(
          future: futureClinicas,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircularProgressIndicator(),
                    SizedBox(height: 16),
                    Text('Carregando hospitais de Arapiraca...'),
                  ],
                ),
              );
            }

            if (snapshot.hasError) {
              return _buildErrorWidget(snapshot.error.toString());
            }

            if (snapshot.hasData) {
              final properties = snapshot.data!;
              return FutureBuilder<List<Informacoes>>(
                future: futureInformacoes,
                builder: (context, infoSnapshot) {
                  if (!infoSnapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  final informacoes = infoSnapshot.data!;
                  if (properties.isEmpty) {
                    return _buildEmptyWidget();
                  }

                  final length = min(properties.length, informacoes.length);

                  return ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    itemCount: length,
                    itemBuilder: (context, i) {
                      return _buildPropertyCard(properties[i], informacoes[i]);
                    },
                  );
                },
              );
            }

            return const Center(child: Text('Sem dados'));
          },
        ),
      ),
    );
  }

  Widget _buildPropertyCard(Properties pro, Informacoes info) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () => _mostrarInfo(info),
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.local_hospital, color: Color(0xFF7cb2d6), size: 28),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      pro.name?.isNotEmpty == true ? pro.name! : 'Hospital sem nome',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF7cb2d6),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              if (pro.formatted?.isNotEmpty == true)
                _buildInfoRow(Icons.location_on, pro.formatted!),
              if (pro.addressLine1?.isNotEmpty == true)
                _buildInfoRow(Icons.location_city, pro.addressLine1!),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton.icon(
                  onPressed: () => _mostrarInfo(info),
                  icon: const Icon(Icons.info_outline),
                  label: const Text('Informações para contato'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: Colors.grey[600]),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: 14, color: Colors.grey[800]),
            ),
          ),
        ],
      ),
    );
  }

  void _mostrarInfo(Informacoes info) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (info.phone?.isNotEmpty == true) ...[
                const Text('Telefone:', style: TextStyle(fontWeight: FontWeight.bold)),
                Text(info.phone!),
                const SizedBox(height: 12),
              ],
              if (info.email?.isNotEmpty == true) ...[
                const Text('Email:', style: TextStyle(fontWeight: FontWeight.bold)),
                Text(info.email!),
                const SizedBox(height: 12),
              ],
              if (info.website?.isNotEmpty == true) ...[
                const Text('Website:', style: TextStyle(fontWeight: FontWeight.bold)),
                Text(info.website!),
                const SizedBox(height: 12),
              ],
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Fechar'),
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      centerTitle: true,
      backgroundColor: const Color(0xFF7cb2d6),
      toolbarHeight: 160,
      elevation: 0,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 35),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.place, size: 55, color: Colors.red),
        ),
      ],
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'HOSPITAIS',
            style: GoogleFonts.cinzel(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            'ARAPIRACA - AL',
            style: GoogleFonts.cinzel(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorWidget(String msg) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 40, color: Colors.red),
          const SizedBox(height: 16),
          const Text(
            'Erro ao carregar dados',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(msg, textAlign: TextAlign.center),
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: _recarregarDados,
            icon: const Icon(Icons.refresh),
            label: const Text('Tentar novamente'),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.local_hospital, size: 60, color: Colors.grey),
          const SizedBox(height: 16),
          const Text(
            'Nenhum hospital encontrado',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text('em Arapiraca', style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: _recarregarDados,
            icon: const Icon(Icons.refresh),
            label: const Text('Recarregar'),
          ),
        ],
      ),
    );
  }
}
