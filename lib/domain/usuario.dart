class Usuario {
  late String email;
  late String senha;

  Usuario({
    required this.email,
    required this.senha
  });

  Usuario.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    senha = json['senha'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['senha'] = this.senha;
    return data;
  }
}
