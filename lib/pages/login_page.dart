import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infoclin2/db/usuarios_dao.dart';
import 'package:infoclin2/pages/TelaMenu.dart';
import 'package:infoclin2/pages/cadastro_page.dart';
import 'package:path/path.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {

  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  get dao => null;

  List listaUsuarios = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppbar(),
      body: Column(
        children: [
          Padding(padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Email:',
                  style: GoogleFonts.cairo(
                      fontSize: 14,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: 350,
                  height: 40, child:
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1.0,
                          color: Colors.blue),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 3.0,
                          color: Color(0xFF7cb2d6)),
                    ),
                  ),
                ),
                ),
                SizedBox(height: 10),
                Text('Senha:',
                  style: GoogleFonts.cairo(
                      fontSize: 14,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(
                  width: 350,
                  height: 40,
                  child:
                  TextField(
                    controller: senhaController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 0.5, color: Colors.blue),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 3.0, color: Color(0xFF7cb2d6)),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      String email = emailController.text;
                      String senha = senhaController.text;
                      bool auth = await UsuariosDao().login(email, senha);
                      if (auth) {
                        Navigator.pushReplacement(
                          context as BuildContext,
                          MaterialPageRoute(
                            builder: (context) {
                              return TelaMenu();
                            },
                          ),
                        );
                      } else {
                        print('Usuario e/ou senha incorretos!');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                      child: const Text('ENTRAR'),
                  ),
                ),
                Text('OU'),

                SizedBox(height: 10),
                Center(
                  child: ElevatedButton(
                    onPressed: (),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('CADASTRE-SE'),
                  ),
                ),

                SizedBox(height: 10),
                Container(
                  padding:EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                  margin: EdgeInsets.all(5.0),
                  child: Center(
                    child: Image.asset(
                      'assets/saude.jpg',
                      width: 200,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
buildAppbar(){
  return AppBar(
    toolbarHeight: 220,
    centerTitle: true,
    title: Padding(padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            'VAMOS REALIZAR',
            maxLines: 3,
            style: GoogleFonts.cinzel(
                fontSize: 32,
                fontWeight: FontWeight.w600, color: Colors.black),
          ),
          Text(
            'SEU LOGIN',
            maxLines: 3,
            style: GoogleFonts.cinzel(
                fontSize: 32,
                fontWeight: FontWeight.w600, color: Colors.black),
          ),
          Text(
            'NO INFOCLIN',
            maxLines: 3,
            style: GoogleFonts.cinzel(
                fontSize: 32,
                fontWeight: FontWeight.w600, color: Colors.black),
          ),
        ],
      ),
    ),
    backgroundColor: Colors.white,
  );
}

void onPressedRegisterPage(context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) {
        return CadastroPage();
      },
    ),
  );
}










