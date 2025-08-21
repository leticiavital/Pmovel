class Tratamento {
  late String nomeTratamento;
  late String tipoTratamento;
  late String descricaoTratamento;
  late List<String> efeitosColaterais;

  Tratamento({
    required this.nomeTratamento,
    required this.tipoTratamento,
    required this.descricaoTratamento,
    required this.efeitosColaterais,
  });

  Tratamento.fromJson(Map<String, dynamic> json) {
    nomeTratamento = json['nomeTratamento'];
    tipoTratamento = json['tipoTratamento'];
    descricaoTratamento = json['descricaoTratamento'];
    efeitosColaterais = json['efeitosColaterais'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['nomeTratamento'] = this.nomeTratamento;
    data['tipoTratamento'] = this.tipoTratamento;
    data['descricaoTratamento'] = this.descricaoTratamento;
    data['efeitosColaterais'] = this.efeitosColaterais;
    return data;
  }
}
