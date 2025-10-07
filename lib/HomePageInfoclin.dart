import 'package:flutter/material.dart';
import 'package:infoclin_913/dao/cancer_dao.dart';
import 'package:infoclin_913/dao/sintoma_dao.dart';
import 'package:infoclin_913/dao/tratamento_dao.dart';
import 'package:infoclin_913/domain/cancer.dart';
import 'package:infoclin_913/domain/sintoma.dart';
import 'package:infoclin_913/domain/tratamento.dart';
import 'package:infoclin_913/widgets/cardCancer.dart';
import 'package:infoclin_913/widgets/cardSintoma.dart';
import 'package:infoclin_913/widgets/cardTratamento.dart';


class infoClinHomePage extends StatefulWidget {
  const infoClinHomePage({super.key});

  @override
  State<infoClinHomePage> createState() => _infoClinHomePageState();
}

class _infoClinHomePageState extends State<infoClinHomePage> {
  int tamanhoListaCancer = 0;
  List<Cancer> listaCancer = [];
  int tamanhoListaSintomas = 0;
  List<Sintoma> listaSintomas = [];
  int tamanhoListaTratamento = 0;
  List<Tratamento> listaTratamento = [];


  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    listaCancer = await CancerDao().listarCanceres();
    listaSintomas = await SintomaDao().listarSintomas();
    listaTratamento = await TratamentoDao().listarTratamentos();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF87CEEB),
        title: Text('INFOCLIN',
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
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: ListView(
          children: [
            Container( //padrão da caixa(enfermaria)
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.6,
              height: 50,
              decoration: BoxDecoration(
                color: Color(0xFF87CEEB),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center( //caixa da enfermaria
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
            ),
            SizedBox(height: 12),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Text(
                'BASEANDO-SE NOS SINTOMAS  , TEMOS OS SEGUINTES CÂNCERES.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  height: 1.3,
                ),
              ),
            ),

            Image.asset(
              'assets/simbolo.png', width: 90,
              height: 90,
            ),


            SizedBox(height: 12),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'INFORME-SE SOBRE OS TIPOS DE CÂNCERES EXISTENTES:',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  height: 1.3,
                ),
              ),
            ),
            SizedBox(height: 12),
//mudancas

            GestureDetector(
              onTap: () {
                setState(() {
                  tamanhoListaCancer = tamanhoListaCancer == 0 ? listaCancer.length : 0;
                });
              },

              //fim da 1 mudanca

              child: Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.85,
                decoration: BoxDecoration(
                  color: Color(0xFFE3F2FD),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Color(0xFF87CEEB), width: 3),
                ),
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 15),
                child: Text(
                  'TIPOS DE CÂNCERES ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

            SizedBox(height: 12),
//mudanca dois
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: tamanhoListaCancer,
              itemBuilder: (context, i) {
                return CardCancer(
                  cancer: listaCancer[i],
                );
              },
            ),

            // fim da mudanca dois
            SizedBox(height: 12),

            //mudanca tres

            GestureDetector(
              onTap: () {
                setState(() {
                  tamanhoListaSintomas = tamanhoListaSintomas == 0 ? listaSintomas.length : 0;
                });
              },

              child: Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.85,
                decoration: BoxDecoration(
                  color: Color(0xFFE3F2FD),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Color(0xFF87CEEB), width: 3),
                ),
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                child: Text(
                  'SINTOMAS E SINAIS DE ALERTAS\n RELACIONADOS AOS CÂNCERES CITADOS',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    height: 1.2,
                  ),
                ),
              ),
            ),

            SizedBox(height: 12,),

            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: tamanhoListaSintomas,
              itemBuilder: (context, i) {
                return SintomasCard(
                  sintoma: listaSintomas[i],
                );
              },
            ),
            SizedBox(height: 12),

            GestureDetector(
              onTap: () {
                setState(() {
                  tamanhoListaTratamento = tamanhoListaTratamento == 0 ? listaTratamento.length : 0;
                });
              },
              child: Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.85,
                decoration: BoxDecoration(
                  color: Color(0xFFE3F2FD),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Color(0xFF87CEEB), width: 3),
                ),
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                child: Text(
                  'FORMAS DE TRATAMENTO DOS\nCÂNCERES',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    height: 1.2,
                  ),
                ),
              ),
            ),
            SizedBox(height: 12),

            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: tamanhoListaTratamento,
              itemBuilder: (context, i) {
                return CardTratamento(
                  tratamento: listaTratamento[i],
                );
              },
            ),

            SizedBox(height: 12),
            Image.asset(
              'assets/cancer.png',
              width: 55,
              height: 55,
            ),
            SizedBox(height: 5),


            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'SE VOCÊ IDENTIFICAR SINTOMAS PERSISTENTES OU SINAIS DE ALERTA, NÃO HESITE: PROCURE ORIENTAÇÃO MÉDICA.',
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
        ),
      ),
    );
  }
}
