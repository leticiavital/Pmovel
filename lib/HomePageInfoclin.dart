import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:infoclin_913/Api/Saude_api.dart';
import 'package:infoclin_913/domain/Saude.dart';
import 'package:infoclin_913/widgets/cardSaude.dart';
import 'package:infoclin_913/widgets/cardMedicamentos.dart';
import 'package:infoclin_913/Provider/medicamento_provider.dart';


class infoClinHomePage extends StatefulWidget {
  const infoClinHomePage({super.key});

  @override
  State<infoClinHomePage> createState() => _infoClinHomePageState();
}

class _infoClinHomePageState extends State<infoClinHomePage> {
  int tamanhoListaArtigos = 0;
  List<ArtigoSaude> listaArtigos = [];
  bool carregandoArtigos = false;
  String? erroArtigos;

  // API de Saúde
  final SaudeApi _saudeApi = SaudeApi();

  Future<void> carregarArtigos() async {
    if (listaArtigos.isEmpty) {
      setState(() {
        carregandoArtigos = true;
        erroArtigos = null;
      });

      try {
        listaArtigos = await _saudeApi.listarArtigos();
        setState(() {
          carregandoArtigos = false;
          tamanhoListaArtigos = listaArtigos.length;
        });
      } catch (e) {
        setState(() {
          erroArtigos = 'Erro ao carregar artigos';
          carregandoArtigos = false;
        });
      }
    } else {
      setState(() {
        tamanhoListaArtigos = tamanhoListaArtigos == 0 ? listaArtigos.length : 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: ListView(
          children: [
            _buildHeader(context),
            SizedBox(height: 12),
            _buildSubtitle(),
            _buildLogo(),
            SizedBox(height: 12),
            _buildArtigosSection(context),
            SizedBox(height: 12),
            _buildMedicamentosSection(context),
            SizedBox(height: 16),
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  // Widgets builders
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Color(0xFF87CEEB),
      title: Text(
        'INFOCLIN',
        style: TextStyle(
          color: Colors.white,
          fontSize: 27,
          letterSpacing: 3.5,
          fontWeight: FontWeight.w500,
        ),
      ),
      centerTitle: true,
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 16),
          child: Icon(
            Icons.home,
            color: Colors.white,
            size: 29,
          ),
        ),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      height: 50,
      decoration: BoxDecoration(
        color: Color(0xFF87CEEB),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Center(
        child: Text(
          'ENFERMARIA',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.2,
          ),
        ),
      ),
    );
  }

  Widget _buildSubtitle() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Text(
        'ACESSE INFORMAÇÕES SOBRE MEDICAMENTOS E ARTIGOS DE SAÚDE',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontSize: 12,
          fontWeight: FontWeight.w500,
          height: 1.3,
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Image.asset(
      'assets/simbolo.png',
      width: 100,
      height: 100,
    );
  }


  Widget _buildArtigosSection(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'INFORMAÇÕES E ARTIGOS SOBRE SAÚDE:',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.w500,
              height: 1.3,
            ),
          ),
        ),
        SizedBox(height: 20),
        _buildArtigosButton(context),
        SizedBox(height: 12),
        _buildArtigosList(),
      ],
    );
  }

  Widget _buildArtigosButton(BuildContext context) {
    return GestureDetector(
      onTap: carregarArtigos,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.85,
        decoration: BoxDecoration(
          color: Color(0xFFE3F2FD),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Color(0xFF87CEEB), width: 3),
        ),
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 15),
        child: Text(
          'ACESSO À SAÚDE',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey[700],
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildArtigosList() {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: tamanhoListaArtigos,
      itemBuilder: (context, i) {
        return CardSaude(artigo: listaArtigos[i]);
      },
    );
  }

  Widget _buildMedicamentosSection(BuildContext context) {
    return Consumer<MedicamentoProvider>(
      builder: (context, medicamentoProvider, child) {
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'CONSULTE INFORMAÇÕES SOBRE MEDICAMENTOS:',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  height: 1.3,
                ),
              ),
            ),
            SizedBox(height: 20),
            _buildMedicamentosButton(context, medicamentoProvider),
            SizedBox(height: 20),
            _buildMedicamentosList(medicamentoProvider),
          ],
        );
      },
    );
  }

  Widget _buildMedicamentosButton(BuildContext context, MedicamentoProvider provider) {
    return GestureDetector(
      onTap: () => provider.carregarMedicamentos(),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.85,
        decoration: BoxDecoration(
          color: const Color(0xFFE3F2FD),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: const Color(0xFF87CEEB), width: 3),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        child: Text(
          'MEDICAMENTOS',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey[700],
            fontSize: 13,
            fontWeight: FontWeight.w600,
            height: 1.2,
          ),
        ),
      ),
    );
  }

  Widget _buildMedicamentosList(MedicamentoProvider provider) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: provider.tamanhoLista,
      itemBuilder: (context, i) {
        return CardMedicamento(medicamento: provider.listaMedicamentos[i]);
      },
    );
  }

  Widget _buildFooter() {
    return Column(
      children: [
        Image.asset(
          'assets/med.png',
          width: 80,
          height: 80,
        ),
        SizedBox(height: 20),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'MANTENHA-SE INFORMADO SOBRE MEDICAMENTOS E CUIDADOS COM A SAÚDE.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: 12,
              fontWeight: FontWeight.w600,
              height: 1.3,
            ),
          ),
        ),
        SizedBox(height: 16),
      ],
    );
  }
}