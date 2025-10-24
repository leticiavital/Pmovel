import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infoclin_913/pages/enfermariaPage.dart';
import 'package:infoclin_913/pages/enfermeirosPage.dart';
import 'package:infoclin_913/pages/login_page.dart';
import 'package:infoclin_913/pages/triagemPage.dart';
import 'package:infoclin_913/pages/uti_page2.dart';

class TelaMenu2 extends StatefulWidget {
  const TelaMenu2({super.key});

  @override
  State<TelaMenu2> createState() => _TelaMenu2();
}

class _TelaMenu2 extends State<TelaMenu2> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildappbar(),
        body: Padding(padding:
    EdgeInsets.all(10),
        child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 65),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/imagem.png', width: 100),
                SizedBox(width: 50),
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
                    backgroundColor: Color(0xFF7cb2d6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        color: Color(0xFF7CB2D6),
                        width: 4,
                      ),
                    ),
                    minimumSize: Size(200, 60),
                  ),
                  child: Text(
                    'TRIAGEM',
                    style: GoogleFonts.cinzel(
                        color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 23),
                  ),
                  //(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/enfermaria.png', width: 100),
                SizedBox(width: 50),
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
                    backgroundColor:  Color(0xFF7cb2d6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side:  BorderSide(
                        color: Color(0xFF7CB2D6),
                        width: 4,
                      ),
                    ),
                    minimumSize: Size(200, 60),
                  ),
                  child: Text(
                    'EMFERMARIA',
                    style: GoogleFonts.cinzel(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 23),
                  ),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/caixinha.png', width: 100),
                SizedBox(width: 30),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF7cb2d6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        color: Color(0xFF7CB2D6),
                        width: 4,
                      ),
                    ),
                    minimumSize: Size(100, 60),
                  ),
                  child: Text(
                    'CAIXINHA DE REMÉDIO',
                    maxLines: 2,
                    style: GoogleFonts.cinzel(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
              ],
            ),

            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/uti.png', width: 100),
                  SizedBox(width: 50),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return UTI_page2();
                          },
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF7cb2d6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(
                          color: Color(0xFF7CB2D6),
                          width: 4,
                        ),
                      ),
                      minimumSize: Size(200, 60),
                    ),
                    child: Text(
                      'UTI',
                      style: GoogleFonts.cinzel(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 23),
                    ),
                  ),
                ]
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/uti.png', width: 100),
                SizedBox(width: 50),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Enfermeirospage();
                        },
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF7cb2d6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        color: Color(0xFF7CB2D6),
                        width: 4,
                      ),
                    ),
                    minimumSize: Size(200, 60),
                  ),
                  child:  Text(
                    'ENFERMEIROS',
                    style: GoogleFonts.cinzel(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 23),
                  ),
                ),


              ],
            ),
            SizedBox(height: 50),

            Text(
              'Aqui você escolhe onde deseja explorar...',
              style: GoogleFonts.cinzel(
                fontSize: 20,
                color: Color(0xFF7cb2d6),
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    ),
    );
  }
    buildappbar() {
      return AppBar(
        toolbarHeight: 140,
        centerTitle: true,
        backgroundColor: const Color(0xFF7cb2d6),
        title: Text(
            'INFOCLIN',
            style: GoogleFonts.cinzel(
              color: Colors.white,
            fontWeight: FontWeight.bold,
              fontSize: 40
            ),
        ),
        actions: [IconButton(onPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) {
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

