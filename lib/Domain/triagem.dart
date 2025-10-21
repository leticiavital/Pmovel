class Triagem {
  late int idade;
  late String sexo;
  late String sintoma;
  String? doencaHereditaria;

  Triagem({
    required this.idade,
    required this.sexo,
    required this.sintoma,
    this.doencaHereditaria,
  });

  Triagem.fromJson(Map<String, dynamic> json) {
    idade = json['idade'];
    sexo = json['sexo'];
    sintoma = json['sintoma'];
    doencaHereditaria = json['doencaHereditaria'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idade'] = idade;
    data['sexo'] = sexo;
    data['sintoma'] = sintoma;
    data['doencaHereditaria'] = doencaHereditaria;
    return data;
  }
}
