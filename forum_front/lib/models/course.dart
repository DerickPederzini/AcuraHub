class Course {
  String? urlImagem;
  String? titulo;
  String? tema;

  Course({
    required this.urlImagem,
    required this.titulo,
    required this.tema,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      titulo: json["titulo"] as String?,
      tema: json["tema"] as String? ,
      urlImagem: json["urlImagem"] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {"titulo": titulo, "tema": tema, "urlImagem": urlImagem};
  }
}
