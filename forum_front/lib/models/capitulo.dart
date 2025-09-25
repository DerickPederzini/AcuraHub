
class Capitulo {
  int? id;
  String? titulo;
  String? urlImagem;
  String? urlVideo;
  String? body;

  Capitulo({required this.id, required this.urlImagem ,required this.body, required this.titulo, required this.urlVideo});

  factory Capitulo.fromJson(Map<String, dynamic> json) {
    return Capitulo(
      id: json["id"] as int?,
      urlImagem: json["urlImagem"] as String?,
      titulo: json["titulo"] as String?,
      urlVideo: json["urlVideo"] as String?,
      body: json["body"] as String ?
    );
  }

  Map<String, dynamic> toJson() {
    return {"id": id, "urlImagem": urlImagem, "titulo": titulo, "body": body, "urlVideo" : urlVideo};
  }
}
