import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infoclin2/db/usuarios_dao.dart';
import 'package:infoclin2/domain/usuario.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {

  final TextEditingController nomeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  get dao => null;

  List listaUsuarios = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffeff9ff),
      appBar: buildAppbar(),
      body: Column(
    children: [
      Padding(padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nome:',
              style: GoogleFonts.cairo(
                fontSize: 14,
                fontWeight: FontWeight.bold
              ),
            ),
        SizedBox(
          width: 350,
          height: 40,
          child: TextField(
          controller: nomeController,
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
      ],
    ),
      ),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                    UsuariosDao dao = UsuariosDao();
                    Usuario novo = Usuario(
                      nome: nomeController.text,
                      email: emailController.text,
                      senha: senhaController.text,
                    );
                    await dao.inserirUsuario(novo);
                    print(await dao.listarUsuarios());
                  print("Usuario salvo no banco!");
                  },
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
        padding:EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
        margin: EdgeInsets.all(10.0),
        child: Center(
          child: Image.asset(
            'assets/saude.jpg',
            width: 900,
          ),
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
          'SEU CADASTRO',
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
    backgroundColor: Color(0xffeff9ff),
  );
}





