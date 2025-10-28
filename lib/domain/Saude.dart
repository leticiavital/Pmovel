class ArtigoSaude {
  final String id;
  final String titulo;
  final String resumo;
  final String autor;
  final String urlImagem;



  ArtigoSaude({
    required this.id,
    required this.titulo,
    required this.resumo,
    required this.autor,
    required this.urlImagem,

  });


  factory ArtigoSaude.fromJson(Map<String, dynamic> json) {
    return ArtigoSaude(
      id: json['id']?.toString() ?? '',
      titulo: json['titulo'] ?? 'Sem título',
      resumo: json['resumo'] ?? 'Sem descrição disponível',
      autor: json['autor'] ?? 'Autor desconhecido',
      urlImagem: json['urlImagem'] ?? json['url_imagem'] ?? '',

    );
  }


  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'titulo': titulo,
      'resumo': resumo,
      'autor': autor,
      'urlImagem': urlImagem,

    };
  }


  @override
  String toString() {
    return 'ArtigoSaude{id: $id, titulo: $titulo, autor: $autor}';
  }
}
