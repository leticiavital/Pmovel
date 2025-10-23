class Enfermeiros {
  List<Enfermeiros>? enfermeiros;

  Enfermeiros({this.enfermeiros});

  Enfermeiros.fromJson(Map<String, dynamic> json) {
    if (json['enfermeiros'] != null) {
      enfermeiros = <Enfermeiros>[];
      json['enfermeiros'].forEach((v) {
        enfermeiros!.add(new Enfermeiros.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.enfermeiros != null) {
      data['enfermeiros'] = this.enfermeiros!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Enfermeiros1 {
  int? id;
  String? nome;
  String? cargo;
  String? turno;
  String? status;
  String? urlImage;

  Enfermeiros1(
      {
        this.id,
        this.nome,
        this.cargo,
        this.turno,
        this.status,
        this.urlImage});

  Enfermeiros1.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    cargo = json['cargo'];
    turno = json['turno'];
    status = json['status'];
    urlImage = json['urlImage'];
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