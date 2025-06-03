import 'package:flutter/material.dart';


class infoclinHomePage extends StatelessWidget {
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
              size: 28,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
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
              ),
              SizedBox(height: 12),


              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'BASEANDO-SE NOS SINTOMAS INFORMADOS, TEMOS OS SEGUINTES CÂNCERES.',
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
                'assets/infoclin.png',
                width:3000,
                height: 150,
              ),


              Container(
                width: MediaQuery.of(context).size.width * 0.85,
                decoration: BoxDecoration(
                  color: Color(0xFFE3F2FD),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Color(0xFF87CEEB), width: 3),
                ),
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                child: Text(
                  'PROVÁVEIS CÂNCERES\nRELACIONADOS',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    height: 1.2,
                  ),
                ),
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


              Container(
                width: MediaQuery.of(context).size.width * 0.85,
                decoration: BoxDecoration(
                  color: Color(0xFFE3F2FD),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Color(0xFF87CEEB), width: 3),
                ),
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 15),
                child: Text(
                  'TIPOS DE CÂNCERES EXISTENTES',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),


              SizedBox(height: 12),


              Container(
                width: MediaQuery.of(context).size.width * 0.85,
                decoration: BoxDecoration(
                  color: Color(0xFFE3F2FD),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Color(0xFF87CEEB), width: 3),
                ),
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                child: Text(
                  'SINTOMAS E SINAIS DE ALERTAS\nCOMUNS RELACIONADOS AO CÂNCER',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    height: 1.2,
                  ),
                ),
              ),


              SizedBox(height: 12),
              Container(
                width: MediaQuery.of(context).size.width * 0.85,
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

              SizedBox(height: 12),
              // meu icone
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.blue[100],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      Icons.favorite,
                      color: Colors.blue[700],
                      size: 24,
                    ),
                  ),
                  SizedBox(width: 8),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.orange[100],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      Icons.warning,
                      color: Colors.orange[700],
                      size: 24,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),

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
      ),
    );
  }
}
