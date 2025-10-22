import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infoclin_913/api/place_api.dart';
import 'apiFake/fake_api.dart';

class Clinicasrecomendadas extends StatefulWidget {
  const Clinicasrecomendadas({super.key});

  @override
  State<Clinicasrecomendadas> createState() => _ClinicasrecomendadasState();
}

class _ClinicasrecomendadasState extends State<Clinicasrecomendadas> {
  late Future<Map<String, List<String>>> futureData;

  @override
  void initState() {
    super.initState();
    futureData = loadData();
  }

  Future<Map<String, List<String>>> loadData() async {
    // Use findAllHospitals() para buscar todos os hospitais
    final hospitals = await PropertiesApi().findHospitalsByCity("Arapiraca");
    final clinicas = await ClinicasApi().findClinicasByCity("Arapiraca");

    return {
      'hospitals': hospitals,
      'clinicas': clinicas,
    };
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildappbar(),
        body: FutureBuilder<Map<String, List<String>>>(
          future: futureData,
          builder: (context, snapshot) {
            // Estado de carregamento
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      color: Color(0xFF4A90E2),
                      strokeWidth: 3,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Carregando hospitais e clínicas...',
                      style: GoogleFonts.cairo(
                        fontSize: 16,
                        color: Color(0xFF4A90E2),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              );
            }

            // Estado de erro
            if (snapshot.hasError) {
              return Center(
                child: Padding(
                  padding: EdgeInsets.all(24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.error_outline,
                        size: 70,
                        color: Colors.red[400],
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Erro ao carregar dados',
                        style: GoogleFonts.cairo(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        '${snapshot.error}',
                        style: GoogleFonts.cairo(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 24),
                      ElevatedButton.icon(
                        onPressed: () {
                          setState(() {
                            futureData = loadData();
                          });
                        },
                        icon: Icon(Icons.refresh),
                        label: Text('Tentar Novamente'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF4A90E2),
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }

            // Estado de sucesso
            if (snapshot.hasData) {
              final hospitals = snapshot.data!['hospitals']!;
              final clinicas = snapshot.data!['clinicas']!;
              final totalItens = hospitals.length + clinicas.length;

              // Se não houver dados
              if (totalItens == 0) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.search_off,
                        size: 80,
                        color: Colors.grey[400],
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Nenhum resultado encontrado',
                        style: GoogleFonts.cairo(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[700],
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Não encontramos hospitais ou clínicas',
                        style: GoogleFonts.cairo(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                );
              }

              // Lista combinada de hospitais e clínicas
              return ListView.builder(
                padding: EdgeInsets.all(16),
                itemCount: totalItens + 2, // +2 para os headers
                itemBuilder: (context, index) {
                  // Header de Hospitais
                  if (index == 0) {
                    return _buildSectionHeader(
                      'Hospitais',
                      hospitals.length,
                      Icons.local_hospital,
                      Color(0xFFE3F2FD),
                    );
                  }

                  // Lista de Hospitais
                  if (index <= hospitals.length) {
                    return _buildHospitalCard(
                      hospitals[index - 1],
                      index - 1,
                    );
                  }

                  // Header de Clínicas
                  if (index == hospitals.length + 1) {
                    return _buildSectionHeader(
                      'Clínicas',
                      clinicas.length,
                      Icons.medical_services,
                      Color(0xFFF3E5F5),
                    );
                  }

                  // Lista de Clínicas
                  int clinicaIndex = index - hospitals.length - 2;
                  return _buildClinicaCard(
                    clinicas[clinicaIndex],
                    clinicaIndex,
                  );
                },
              );
            }

            // Estado padrão
            return Center(
              child: Text(
                'Nenhum dado disponível',
                style: GoogleFonts.cairo(fontSize: 16),
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              futureData = loadData();
            });
          },
          backgroundColor: Color(0xFF4A90E2),
          child: Icon(Icons.refresh, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, int count, IconData icon, Color bgColor) {
    return Container(
      margin: EdgeInsets.only(top: 8, bottom: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF4A90E2),
            Color(0xFF7cb2d6),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF4A90E2).withOpacity(0.3),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 28,
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Text(
              title,
              style: GoogleFonts.cairo(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              '$count',
              style: GoogleFonts.cairo(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4A90E2),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHospitalCard(String name, int index) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Color(0xFF4A90E2).withOpacity(0.3), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            // Ação ao clicar no hospital
            print('Hospital clicado: $name');
          },
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF4A90E2),
                        Color(0xFF7cb2d6),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.local_hospital,
                      color: Colors.white,
                      size: 26,
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: GoogleFonts.cairo(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 14,
                            color: Colors.grey[600],
                          ),
                          SizedBox(width: 4),
                          Text(
                            'Hospital',
                            style: GoogleFonts.cairo(
                              fontSize: 13,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                  color: Color(0xFF4A90E2),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildClinicaCard(String name, int index) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Color(0xFF9C27B0).withOpacity(0.3), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            // Ação ao clicar na clínica
            print('Clínica clicada: $name');
          },
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF9C27B0),
                        Color(0xFFBA68C8),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.medical_services,
                      color: Colors.white,
                      size: 26,
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: GoogleFonts.cairo(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 14,
                            color: Colors.grey[600],
                          ),
                          SizedBox(width: 4),
                          Text(
                            'Clínica',
                            style: GoogleFonts.cairo(
                              fontSize: 13,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                  color: Color(0xFF9C27B0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  buildappbar() {
    return AppBar(
      centerTitle: true,
      backgroundColor: Color(0xFF7cb2d6),
      toolbarHeight: 180,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 35),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.place, size: 55, color: Colors.red),
        ),
      ],
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'CLÍNICAS',
            style: GoogleFonts.cinzel(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            'HOSPITALARES',
            style: GoogleFonts.cinzel(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 12),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.25),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white.withOpacity(0.3), width: 1),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.location_city, color: Colors.white, size: 16),
                SizedBox(width: 8),
                Text(
                  'Arapiraca - AL',
                  style: GoogleFonts.cairo(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}