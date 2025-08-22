class Triagem {
  late int idade;
  late String sexo;
  late String sintoma;

  Triagem({
    required this.idade,
    required this.sexo,
    required this.sintoma,
  });

  Triagem.fromJson(Map<String, dynamic> json) {
    idade = json['idade'];
    sexo = json['sexo'];
    sintoma = json['sintoma'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idade'] = this.idade;
    data['sexo'] = this.sexo;
    data['sintoma'] = this.sintoma;
    return data;
  }
}