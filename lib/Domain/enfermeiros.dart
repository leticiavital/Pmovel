class Enfermeiros1 {
  late int id;
  late String nome;
  late String cargo;
  late String turno;
  late String status;
  late String urlImage;

  Enfermeiros1({
    required this.id,
    required this.nome,
    required this.cargo,
    required this.turno,
    required this.status,
    required this.urlImage,
  });

  Enfermeiros1.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    nome = json['nome'] ?? '';
    cargo = json['cargo'] ?? '';
    turno = json['turno'] ?? '';
    status = json['status'] ?? '';
    urlImage = json['urlImage'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['cargo'] = this.cargo;
    data['turno'] = this.turno;
    data['status'] = this.status;
    data['urlImage'] = this.urlImage;
    return data;
  }
}
