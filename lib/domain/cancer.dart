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
    nomeCancer = json['nomeCancer'];
    formadiagnostico = json['Formadiagnostico'];
    nivelGravidadedoCancer = json['nivelGravidadedoCancer'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['nomeCancer'] = this.nomeCancer;
    data['formadiagnostico'] = this.formadiagnostico;
    data['nivelGravidadedoCancer'] = this.nivelGravidadedoCancer;
    return data;
  }
}
