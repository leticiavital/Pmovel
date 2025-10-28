class Medicamento {
  final String nomeMedicamento;
  final String principioAtivo;



  Medicamento({
    required this.nomeMedicamento,
    required this.principioAtivo,

  });


  factory Medicamento.fromJson(Map<String, dynamic> json) {
    return Medicamento(
      nomeMedicamento: json['nomeProduto'] ?? 'Não informado',
      principioAtivo: json['principioAtivo'] ?? 'Não informado',

    );
  }


  Map<String, dynamic> toJson() {
    return {
      'nomeProduto': nomeMedicamento,
      'principioAtivo': principioAtivo,

    };
  }


  @override
  String toString() {
    return 'Medicamento{nome: $nomeMedicamento, principioAtivo: $principioAtivo}';
  }
}
