class Cancer {

  late String nomeCancer;
  late String formadiagnostico;
  late String nivelGravidadedoCancer;


  Cancer({
    required this.nomeCancer,
    required this.nivelGravidadedoCancer,
    required this.formadiagnostico,
  });

  Cancer.fromJson(Map<String, dynamic> json) {
    nomeCancer = json['nome'] ?? '';
    formadiagnostico = json['Formadiagnostico'] ?? '';
    nivelGravidadedoCancer = json['nivelGravidade'] ?? '';

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['nome'] = this.nomeCancer;
    data['Formadiagnostico'] = this.formadiagnostico;
    data['nivelGravidade'] = this.nivelGravidadedoCancer;
    return data;
  }
}
