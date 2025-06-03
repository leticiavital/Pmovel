
import 'package:flutter/material.dart';
class InfoClinHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        backgroundColor: Colors.blue[300],
        title: Text('InfoClin'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Image.asset(
              'assets/icons/botao.png',
              width: 24,
              height: 24,
            ),
            onPressed: null
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: null,
              child: Text('ENFERMARIA'),
            ),
            SizedBox(height: 20),
            Text(
              'Baseando-se nos sintomas informados, temos os seguintes CÂNCERES:',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icons/infoclin.png',
                  width: 36,
                  height: 36,
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('PROVÁVEIS CÂNCERES RELACIONADOS'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),
            Text(
              'Conhecimento que salva: Informe-se sobre os tipos de cânceres existentes',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {},
              child: Text('TIPOS DE CÂNCERES EXISTENTES'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: null,
              child: Text('SINTOMAS E SINAIS DE ALERTAS COMUNS RELACIONADOS AO CÂNCER'),
            ),
            SizedBox(height: 20),

            ElevatedButton(
              onPressed: null,
              child: Text('FORMAS DE TRATAMENTO DOS CÂNCERES'),
            ),

            Spacer(),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/icons/simbolo_cancer.png',
                    width: 28,
                    height: 28,
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Se você identificar sintomas persistentes ou sinais de alerta, não hesite: procure orientação médica.',
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}


