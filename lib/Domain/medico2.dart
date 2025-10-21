class Medico {
  final String nome;
  final String cidade;
  final String telefone;

  Medico({
    required this.nome,
    required this.cidade,
    required this.telefone,
  });

  factory Medico.fromJson(Map<String, dynamic> json) {
    return Medico(
      nome: json['nome'],
      cidade: json['cidade'],
      telefone: json['telefone'],
    );
  }
}
