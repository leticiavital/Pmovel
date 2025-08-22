import 'package:flutter/material.dart';

class TriagemPage extends StatefulWidget {
  const TriagemPage({super.key});

  @override
  State<TriagemPage> createState() => _TriagemPageState();
}

class _TriagemPageState extends State<TriagemPage> {
  final TextEditingController idadeController = TextEditingController();
  final TextEditingController sexoController = TextEditingController();
  final TextEditingController cancerController = TextEditingController();

  String? respostaCancer;
  String? sintomaSelecionado; // variável do ComboBox de sintomas

  final List<String> sintomas = [
    'Febre',
    'Dor de cabeça',
    'Tosse',
    'Fadiga',
    'Falta de ar',
    'Náusea',
    'Outro'
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildappbar(),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/imagem.png', width: 70),
                    const SizedBox(width: 25),
                    ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Idade digitada: ${idadeController.text}"),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF7cb2d6),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                          side: const BorderSide(
                            color: Color(0xFF7CB2D6),
                            width: 2,
                          ),
                        ),
                        minimumSize: const Size(200, 60),
                      ),
                      child: const Text(
                        'TRIAGEM',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                const Text(
                  'INFORMAÇÕES PESSOAIS',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1.2,
                  ),
                ),

                const SizedBox(height: 15),

                TextField(
                  controller: idadeController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Idade",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                TextField(
                  controller: sexoController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Sexo",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                const Text(
                  'HISTÓRICO MÉDICO PESSOAL:',
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1.2,
                  ),
                ),

                const SizedBox(height: 15),

                const Text(
                  'JÁ FOI DIAGNOSTICADO COM CÂNCER ANTERIORMENTE?',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1.2,
                  ),
                ),

                Row(
                  children: [
                    Radio<String>(
                      value: 'Sim',
                      groupValue: respostaCancer,
                      onChanged: (value) {
                        setState(() {
                          respostaCancer = value;
                        });
                      },
                    ),
                    const Text(
                      'Sim',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Radio<String>(
                      value: 'Não',
                      groupValue: respostaCancer,
                      onChanged: (value) {
                        setState(() {
                          respostaCancer = value;
                        });
                      },
                    ),
                    const Text(
                      'Não',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),

                const Text(
                  'SE A RESPOSTA FOR SIM, DIGITE O NOME: ',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1.2,
                  ),
                ),

                const SizedBox(height: 12),

                TextField(
                  controller: cancerController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Nome do câncer",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 12),

                DropdownButtonFormField<String>(
                  value: sintomaSelecionado,
                  decoration: InputDecoration(
                    labelText: "Selecione um sintoma",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  items: sintomas.map((String item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(item),
                    );
                  }).toList(),
                  onChanged: (String? novoValor) {
                    setState(() {
                      sintomaSelecionado = novoValor;
                    });
                  },
                ),

                const SizedBox(height: 12),

                Center(
                  child: ElevatedButton(onPressed: (){

                  },

                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white, backgroundColor: Colors.blue
                      ),
                      child: const Text('SALVAR DADOS')),
                )


              ],
            ),
          ),
        ),
      ),
    );
  }

buildappbar() {
    return AppBar(
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 30.0),
          child: const Icon(
            Icons.home,
            size: 40,
            color: Colors.white,
          ),
        ),
      ],
      toolbarHeight: 100,
      centerTitle: true,
      backgroundColor: const Color(0xFF7cb2d6),
      title: const Text(
        'TRIAGEM',
        style: TextStyle(
          fontSize: 32,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
