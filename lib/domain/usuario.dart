class Usuario {
  late String nome;
  late String email;
  late String senha;

  Usuario({
    required this.email,
    required this.senha,
    this.nome = "",
  });

  Usuario.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    email = json['email'];
    senha = json['senha'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['email'] = this.email;
    data['senha'] = this.senha;
    return data;
  }
}
