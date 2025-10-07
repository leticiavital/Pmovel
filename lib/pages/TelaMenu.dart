import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infoclin_913/enfermariaPage.dart';
import 'package:infoclin_913/pages/login_page.dart';
import 'package:infoclin_913/pages/triagemPage.dart';
import 'package:infoclin_913/pages/uti_page.dart';

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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return TriagemPage();
                        },
                      ),
                    );
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
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/enfermaria.png', width: 100),
                const SizedBox(width: 50),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return EnfermariaPage();
                        },
                      ),
                    );
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
                    style: TextStyle(color: Colors.white, fontSize: 16),
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
                  onPressed: () {},
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
                    style: TextStyle(color: Colors.white, fontSize: 16),
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return UTI_page();
                        },
                      ),
                    );
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
                    style: TextStyle(color: Colors.white, fontSize: 16),
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
      toolbarHeight: 140,
      centerTitle: true,
      backgroundColor: const Color(0xFF7cb2d6),
      title: const Text(
        'INFOCLIN',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 40,
        ),
      ),
      actions: [IconButton(onPressed: (){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
          return LoginPage();
        },));
      }, icon: Icon(Icons.logout,
      size: 35,
        color: Colors.white,
      ),
      ),
      ],
    );
  }
}
