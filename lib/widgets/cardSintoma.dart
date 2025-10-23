import 'package:flutter/material.dart';
import '../Domain/sintoma.dart';

class SintomasCard extends StatefulWidget {
  final Sintoma sintoma;
  const SintomasCard({Key? key, required this.sintoma}) : super(key: key);

  @override
  State<SintomasCard> createState() => _SintomasCardState();
}

class _SintomasCardState extends State<SintomasCard> {


  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(widget.sintoma.nomeSintoma),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.sintoma.descricaoDoSintoma),
            Text("Urgência: ${widget.sintoma.nivelUrgencia}"),
          ],
        ),
        leading:  const Icon(Icons.local_hospital, size: 16, color: Color(0xFF87CEEB)),
      ),
    );
  }
}
