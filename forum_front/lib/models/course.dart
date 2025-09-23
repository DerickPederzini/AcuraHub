class Course {
  int? id;
  String? urlImagem;
  String? titulo;
  String? tema;
  String? descricao;

  Course.vazio();

  Course({
    required this.id,
    required this.urlImagem,
    required this.titulo,
    required this.tema,
    required this.descricao
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json["id"] as int?,
      titulo: json["titulo"] as String?,
      tema: json["tema"] as String? ,
      urlImagem: json["urlImagem"] as String?,
      descricao: json["descricao"] as String?
    );
  }

  Map<String, dynamic> toJson() {
    return {"id": id,"titulo": titulo, "tema": tema, "urlImagem": urlImagem, "descricao": descricao};
  }
}
