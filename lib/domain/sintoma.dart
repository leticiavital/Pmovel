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
    nomeSintoma = json['nomeSintoma'];
    descricaoDoSintoma = json['descricaoDoSintoma'];
    nivelUrgencia = json['nivelUrgencia'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['nomeSintoma'] = this.nomeSintoma;
    data['descricaoDoSintoma'] = this.descricaoDoSintoma;
    data['nivelUrgencia'] = this.nivelUrgencia;
    return data;
  }
}
