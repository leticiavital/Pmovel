import 'package:flutter/material.dart';

class TelaMenu extends StatefulWidget {
  const TelaMenu({super.key});

  @override
  State<TelaMenu> createState() => _TelaMenu();
}

class _TelaMenu extends State<TelaMenu> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildappbar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 65),


            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/imagem.png', width: 100),
                const SizedBox(width: 50),
                ElevatedButton(
                  onPressed: () {
                    // Sua ação
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF7cb2d6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: const BorderSide(
                        color: Color(0xFF7CB2D6),
                        width: 4,
                      ),
                    ),
                    minimumSize: const Size(200, 60),
                  ),
                  child: const Text(
                    'TRIAGEM',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),


            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/enfermaria.png', width: 100),
                const SizedBox(width: 35),
                ElevatedButton(
                  onPressed: () {
                    // Sua ação
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF7cb2d6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: const BorderSide(
                        color: Color(0xFF7CB2D6),
                        width: 4,
                      ),
                    ),
                    minimumSize: const Size(200, 60),
                  ),
                  child: const Text(
                    'EMFERMARIA',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),


            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/caixinha.png', width: 100),
                const SizedBox(width: 50),
                ElevatedButton(
                  onPressed: () {

                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF7cb2d6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: const BorderSide(
                        color: Color(0xFF7CB2D6),
                        width: 4,
                      ),
                    ),
                    minimumSize: const Size(100, 60),
                  ),
                  child: const Text(
                    'CAIXINHA DE REMÉDIO',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/uti.png', width: 100),
                const SizedBox(width: 50),
                ElevatedButton(
                  onPressed: () {

                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF7cb2d6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: const BorderSide(
                        color: Color(0xFF7CB2D6),
                        width: 4,
                      ),
                    ),
                    minimumSize: const Size(200, 60),
                  ),
                  child: const Text(
                    'UTI',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 50),

            const Text(
              'AQUI VOCÊ ESCOLHE ONDE DESEJA EXPLORAR...',
              style: TextStyle(
                fontSize: 18,
                color: Color(0xFF7cb2d6),
                fontWeight: FontWeight.w500,
                letterSpacing: 1.2,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  buildappbar() {
    return AppBar(
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 30.0),
          child: Icon(
            Icons.home,
            size: 40,
            color: Colors.white,
          ),
        ),
      ],
      toolbarHeight: 100,
      centerTitle: true,
      backgroundColor: const Color(0xFF7cb2d6),
      title: const Text(
        'INFOCLIN',
        style: TextStyle(
          fontSize: 32,
          fontFamily: 'Carrois Gothic SC',
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
