import 'package:flutter/material.dart';

class HomePageInfoclin extends StatefulWidget {
  const HomePageInfoclin({super.key});

  @override
  State<HomePageInfoclin> createState() => _HomePageInfoclinState();
}

class _HomePageInfoclinState extends State<HomePageInfoclin> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar:buildappbar(),
    ),

          );
  }
  buildappbar(){
      return AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF7cb2d6),
        title:
        Text(
          'InfoClin',
          style: TextStyle(
              fontSize: 32,
              fontFamily: 'Carrois Gothic SC',
              color: Colors.white,
              fontWeight: FontWeight.w600
          ),
        ),
      );
    }

}