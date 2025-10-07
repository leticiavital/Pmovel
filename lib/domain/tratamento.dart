class Tratamento {
  late String nomeTratamento;
  late String indicacaoTratamento;
  late String descricaoTratamento;
  late List<String> efeitosColaterais;

  Tratamento({
    required this.nomeTratamento,
    required this.indicacaoTratamento,
    required this.descricaoTratamento,
    required this.efeitosColaterais,
  });

  Tratamento.fromJson(Map<String, dynamic> json) {
    nomeTratamento = json['nome'] ?? '';
    indicacaoTratamento = json['tipo'] ?? '';
    descricaoTratamento = json['descricao'] ?? '';
    efeitosColaterais = json['efeitosColaterais'].split(", ") ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['nome'] = this.nomeTratamento;
    data['indicacao'] = this.indicacaoTratamento;
    data['descricao'] = this.descricaoTratamento;
    data['efeitosColaterais'] = this.efeitosColaterais;
    return data;
  }
}
