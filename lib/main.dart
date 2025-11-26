import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:infoclin_913/Provider/medicamento_provider.dart';
import 'package:infoclin_913/HomePageInfoclin.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MedicamentoProvider(),
        ),
        // Adicione outros providers aqui conforme necessário
      ],
      child: MaterialApp(
        title: 'InfoClin',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
        ),
        home:  infoClinHomePage(),
      ),
    );
  }
}