import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infoclin_913/db/examesDao.dart';
import 'package:infoclin_913/exames.dart';

class DicasdeexamesInfoclin extends StatefulWidget {
  const DicasdeexamesInfoclin({super.key});

  @override
  State<DicasdeexamesInfoclin> createState() => _DicasdeexamesInfoclin();
}
class _DicasdeexamesInfoclin extends State<DicasdeexamesInfoclin> {
  String? generoSelecionado;
  String? idadeselecionada;

  List  listaExames = [];

  loadData(String genero, String idade) async {

    listaExames = await ExamesDao().listarexamesGeneroIdade(genero, idade);
    setState(() {});
  }


  final List<String> faixaIdade =[
    'A partir dos 20 anos',
    'A partir dos 30 anos',
    'A partir dos 40 anos',
    'A partir dos 50 anos',
    'A partir dos 60 ou + anos'
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar:buildappbar(),
        body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("VOCÊ É...",
                  style: GoogleFonts.cairo(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 10,),

                Row(
                  children: [
                    Radio<String>(value:'mulher',
                        groupValue: generoSelecionado,
                        onChanged: (value){
                          setState(() {
                            generoSelecionado=value;

                          }
                          );
                        }
                    ),
                    Text(
                      'SOU MULHER',
                      style:GoogleFonts.cairo(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Radio<String>(value:'homem',
                        groupValue: generoSelecionado,
                        onChanged: (value){
                          setState(() {
                            generoSelecionado=value;
                          });
                        }
                    ),
                    Text(
                      'SOU HOMEM',
                      style:GoogleFonts.cairo(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
          SizedBox(width: 16),

          DropdownButtonFormField<String>(
            value: idadeselecionada,
            decoration: InputDecoration(
              labelText: "Faixa etária",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            items: faixaIdade.map((String idade) {
              return DropdownMenuItem<String>(
                value: idade,
                child: Text(idade),
              );
            }).toList(),
            onChanged: (String? novoValor) {
              setState(() {
                idadeselecionada = novoValor;
              });
            },
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 100, vertical: 10),
            child: ElevatedButton(
              onPressed: () {
                loadData(generoSelecionado!, idadeselecionada!);
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.blue,
              ),
              child: const Text('PESQUISAR'),
            ),
          ),

                SizedBox(height: 10),
                Text(
                    'LISTA DE EXAMES RECOMENDADOS...',
                  style: GoogleFonts.cairo(
                      fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color:  Colors.black,
                    letterSpacing: 1.5,
                  ),
                ),
                Expanded(child:
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: listaExames.length,
                    itemBuilder: (context,i){
                      return buildexames(listaExames[i]);
                    }
                ),
                ),
  ],

        ),

        ),
      ),
    );
  }
  buildappbar(){
    return AppBar(
      centerTitle: true,
      backgroundColor: Color(0xFF7cb2d6),
      toolbarHeight: 180,
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
      title:
      Text(
        'Dicas de Exames preventivos',
        style: GoogleFonts.cairo(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
  buildexames(Exames ex) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFE8F0FE),
        border: Border.all(color: Color(0xFF4A90E2), width: 1.5),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('NOME DO EXAME:',
              style: GoogleFonts.cairo(fontSize: 13, fontWeight: FontWeight.bold)),
          Text(ex.nome, style: GoogleFonts.cairo(fontSize: 13)),
          SizedBox(height: 8),

          Text('INDICADO PARA:',
              style: GoogleFonts.cairo(fontSize: 13, fontWeight: FontWeight.bold)),
          Text(ex.idade, style: GoogleFonts.cairo(fontSize: 13)),
          SizedBox(height: 8),

          Text('COM A FREQUÊNCIA:',
              style: GoogleFonts.cairo(fontSize: 13, fontWeight: FontWeight.bold)),
          Text(ex.frequencia, style: GoogleFonts.cairo(fontSize: 13)),
          SizedBox(height: 8),

          Text('POR QUE FAZER:',
              style: GoogleFonts.cairo(fontSize: 13, fontWeight: FontWeight.bold)),
          Text(ex.porquefazer, style: GoogleFonts.cairo(fontSize: 13)),
        ],
      ),
    );
  }

}
