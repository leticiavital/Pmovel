class Sintoma {
  late String nomeSintoma;
  late String descricaoDoSintoma;
  late String nivelUrgencia;

  Sintoma({
    required this.nomeSintoma,
    required this.descricaoDoSintoma,
    required this.nivelUrgencia,
  });

  Sintoma.fromJson(Map<String, dynamic> json) {
    nomeSintoma = json['nome'] ?? '';
    descricaoDoSintoma = json['descricao'] ?? '';
    nivelUrgencia = json['nivelUrgencia'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['nome'] = this.nomeSintoma;
    data['descricao'] = this.descricaoDoSintoma;
    data['nivelUrgencia'] = this.nivelUrgencia;
    return data;
  }
}
