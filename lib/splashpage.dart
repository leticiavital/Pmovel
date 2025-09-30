import 'package:flutter/material.dart';

class Splashpage extends StatefulWidget {
  const Splashpage({super.key});

  @override
  State<Splashpage> createState() => _SplashpageState();
}

class _SplashpageState extends State<Splashpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF7cb2d6),
      body: Center(
        child: Icon(
          Icons.medical_information_outlined,
          color: Colors.white,
          size: 120,
        ),
      ),
    );
  }
}
