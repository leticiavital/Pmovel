class Exames {
  late String genero;
  late String nome;
  late String idade;
  late String frequencia;
  late String porquefazer;

 Exames({
    required this.genero,
    required this.nome,
    required this.idade,
    required this.frequencia,
    required this.porquefazer,

  });

  Exames.fromJson(Map<String, dynamic> json) {
   genero = json['genero'];
   nome = json['nome'];
    idade = json['idade'];
   frequencia = json['frequencia'];
    porquefazer = json['porquefazer'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['genero'] = this.genero;
    data['nome'] = this.nome;
    data['idade'] = this.idade;
    data['frequencia'] = this.frequencia;
    data['porquefazer'] = this.porquefazer;
    return data;
  }
}