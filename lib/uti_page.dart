import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infoclin2/domain/medico.dart';

import 'db/medicos_dao.dart';

class UTI_page extends StatefulWidget {

  const UTI_page({Key? key}) : super(key: key);

  @override
  State<UTI_page> createState() => _UTI_page();
}

class _UTI_page extends State<UTI_page> {

  String? estadoselecionado;
  String? especialidadeselecionada;

  final List<String> estados = [
    'AC',
    'AL',
    'AP',
    'AM',
    'BA',
    'CE',
    'ES',
    'GO',
    'MA',
    'MT',
    'MS',
    'MG',
    'PA',
    'PB',
    'PR',
    'PE',
    'PI',
    'RJ',
    'RN',
    'SC',
    'SE',
    'TO',
    'DF'
  ];

  final List<String> especialidades = [
    'Cardiologia',
    'Ortopedia',
    'Neurologia',
    'Pediatria',
    'Oftalmologia',
    'Dermatologia',
  ];

  List listaMedicos = [];

  loadData(String estado, String especialidade) async {
    listaMedicos = await MedicosDao().listarPorEstadoEspecialidade(estado, especialidade);
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(),
        backgroundColor: Color(0xffeff9ff),
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
              margin: EdgeInsets.all(42.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Color(0xFF7cb2d6),
              ),
              child: Center(
                child: Text('UTI',
                    style: GoogleFonts.cinzel(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.w700)),
              ),
            ),
            Row(
              children: [
                Container(
                  padding:
                  EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
                  margin: EdgeInsets.all(10.0),
                  child: Image.asset(
                    'assets/icon_medico.png',
                    width: 80,
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(0.0),
                    margin: const EdgeInsets.all(0.1),
                    child: Center(
                      child: Text(
                        'Encontrar um Oncologista perto de mim',
                        maxLines: 2,
                        style: GoogleFonts.cairo(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Row(
                children: [
                  // Dropdown de Estado
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: estadoselecionado,
                      decoration: InputDecoration(
                        labelText: "ESTADO",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      items: estados.map((String estado) {
                        return DropdownMenuItem<String>(
                          value: estado,
                          child: Text(estado),
                        );
                      }).toList(),
                      onChanged: (String? novoValor) {
                        setState(() {
                          estadoselecionado = novoValor;
                        });
                      },
                    ),
                  ),

                  SizedBox(width: 16), // Espaço entre os dois dropdowns

                  // Dropdown de Especialidade
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: especialidadeselecionada,
                      decoration: InputDecoration(
                        labelText: "ESPECIALIDADE",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      items: especialidades.map((String esp) {
                        return DropdownMenuItem<String>(
                          value: esp,
                          child: Text(esp),
                        );
                      }).toList(),

                      onChanged: (String? novaEsp) {
                        setState(() {
                          especialidadeselecionada = novaEsp;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 100, vertical: 10),
              child: ElevatedButton(
                  onPressed: () {
                    loadData(estadoselecionado!, especialidadeselecionada!);
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.blue,
                ),
                  child: const Text('PESQUISAR'),
              ),
            ),

            ListView.builder(
              shrinkWrap: true,
              itemCount: listaMedicos.length,
              itemBuilder: (context, i) {
                return buildMedico(listaMedicos[i]);
              },
            )

            ],
                      ),
                ),
    );
  }
}

buildAppBar() {
  return AppBar(
    actions: [
      IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.home,
          color: Colors.white,
          size: 40,
        ),
      ),
    ],
    toolbarHeight: 140,
    centerTitle: true,
    title: Text(
      'Infoclin',
      maxLines: 10,
      style: GoogleFonts.cinzel(
          fontSize: 40, fontWeight: FontWeight.w600, color: Colors.white),
    ),
    backgroundColor: Color(0xFF7cb2d6),
  );
}
buildMedico(Medico m){
  return Container(
    padding:
    EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
    margin: EdgeInsets.all(20.0),
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
            child: Image.asset(m.urlImage,
              width: 150,),
            borderRadius: BorderRadius.circular(1000),
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(m.nome,
              style: GoogleFonts.cairo(
                color: Colors.black,
                fontWeight: FontWeight.bold
              ),
              ),
              Text(m.estado,
              style: GoogleFonts.cairo(
                  color: Colors.black,
                  fontWeight: FontWeight.bold
              ),
              ),
              Text(m.email,
              style: GoogleFonts.cairo(
                  color: Colors.black,
                  fontWeight: FontWeight.bold
              ),),
            ],
          )

  ],
        ),
      ],
    )

  );
}


