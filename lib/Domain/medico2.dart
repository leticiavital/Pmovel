class Medico2 {
  late String urlImage;
  late String nome;
  late String specialties;
  late String state;
  late String email;

  Medico2({
    required this.urlImage,
    required this.nome,
    required this.specialties,
    required this.state,
    required this.email,
  });

  Medico2.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    specialties = json['specialties'];
    state = json['state'];
    email = json['email'];
    urlImage = json['urlImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['specialties'] = this.specialties;
    data['state'] = this.state;
    data['email'] = this.email;
    data['urlImage'] = this.urlImage;
    return data;
  }
}
