class Medico {
  late String urlImage;
  late String nome;
  late String especialidade;
  late String estado;
  late String email;

  Medico({
    required this.urlImage,
    required this.nome,
    required this.especialidade,
    required this.estado,
    required this.email,
  });

  Medico.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    especialidade = json['especialidade'];
    estado = json['estado'];
    email = json['email'];
    urlImage = json['urlImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['especialidade'] = this.especialidade;
    data['estado'] = this.estado;
    data['email'] = this.email;
    data['urlImage'] = this.urlImage;
    return data;
  }
}
