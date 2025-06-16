import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UTI_page extends StatefulWidget {
  const UTI_page({super.key});

  @override
  State<UTI_page> createState() => _UTI_page();
}

class _UTI_page extends State<UTI_page> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(),
        backgroundColor: Color(0xffeff9ff),
        body: Column(
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
                            fontSize: 17, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DropdownButton(
                    hint: Text('ESTADO'),
                    items: const [
                      DropdownMenuItem(
                        child: Text('AL'),
                        value: ('ESTADO'),
                      ),
                      DropdownMenuItem(
                        child: Text('MG'),
                        value: ('ESTADO'),
                      )
                    ],
                    onChanged: (value) {}),

                  DropdownButton(
                      hint: Text('EPECIALIDADE'),
                      items: const [
                        DropdownMenuItem(
                          child: Text('ORTOPEDIA'),
                          value: ('ESPECIALIDADE'),
                        ),
                        DropdownMenuItem(
                          child: Text('NEUROLOGIA'),
                          value: ('ESPECIALIDADE'),
                        ),
                      ],
                      onChanged: (value) {}),
              ],
            ),
            Row(
              children: [
                Container(
                  padding:
                  EdgeInsets.symmetric(horizontal: 10.0, vertical: 30.0),
                  margin: EdgeInsets.all(10.0),
                  child: Image.asset(
                    'assets/medico2.png',
                    width: 80,
                  ),
                ),
                Expanded(
                  child: Text(
                    'Doutor Rafael Melo, Especialista em Neurologia',
                    maxLines: 3,
                    style: GoogleFonts.cairo(
                      fontSize: 20,
                    ),
                  ),
                )
              ],
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
