import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DicasdeexamesInfoclin extends StatefulWidget {
  const DicasdeexamesInfoclin({super.key});

  @override
  State<DicasdeexamesInfoclin> createState() => _DicasdeexamesInfoclin();
}
class _DicasdeexamesInfoclin extends State<DicasdeexamesInfoclin> {
  String? generoSelecionado;

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
                SizedBox(height: 20),

                Container(
                  padding: EdgeInsets.fromLTRB(10.0,10.0,230.0,10.0),
                  child: Text('Digite sua idade: '),
                  color: Colors.grey.shade300,
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
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                      color: Color(0xFFE8F0FE),
                    border: Border.all(color: Color(0xFF4A90E2), width: 1.5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.fromLTRB(10.0,10.0,190.0,10.0),
                  margin: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('NOME DO EXAME:',
                      style: GoogleFonts.cairo(
                        fontSize: 13
                      )
                      ),
                      Text('INDICADO PARA:',
                          style: GoogleFonts.cairo(
                              fontSize: 13
                          )
                      ),
                      Text('COM A FREQUÊNCIA:',
                          style: GoogleFonts.cairo(
                              fontSize: 13
                          )
                      ),
                      Text('POR QUÊ FAZER:',
                          style: GoogleFonts.cairo(
                              fontSize: 13

                          )
                      ),
                  ]
                ),
        ),
                       SizedBox(height: 10),
                      Container(
                        padding: EdgeInsets.fromLTRB(10.0,10.0,190.0,10.0),
                        margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                      color: Color(0xFFE8F0FE),
                      border: Border.all(color: Color(0xFF4A90E2), width: 1.5),
                      borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Text('NOME DO EXAME:',
                      style: GoogleFonts.cairo(
                      fontSize: 13
                      )
                      ),
                      Text('INDICADO PARA:',
                      style: GoogleFonts.cairo(
                      fontSize: 13
                      )
                      ),
                      Text('COM A FREQUÊNCIA:',
                      style: GoogleFonts.cairo(
                      fontSize: 13
                      )
                      ),
                      Text('POR QUÊ FAZER:',
                      style: GoogleFonts.cairo(
                      fontSize: 13
                      )
                      ),
                    ],
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

}
