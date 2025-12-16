import 'package:flutter/material.dart';
import 'package:infoclin_913/pages/TelaMenu2.dart';
import 'package:infoclin_913/providers/doctros_provider.dart';
import 'package:infoclin_913/providers/enfermeiros_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DoctorsProvider()),
        ChangeNotifierProvider(create: (_) => EnfermeirosProvider()),
      ],
      child: MaterialApp(
        home: TelaMenu2(),
      ),
    ),
  );
}