class InsigneaPerfil {
  int? id;
  String? nome;
  String? descricao;
  String? urlInsigea;

  InsigneaPerfil({
    required this.id,
    required this.nome,
    required this.descricao,
    required this.urlInsigea,
  });

  factory InsigneaPerfil.fromJson(Map<String, dynamic> json) {
    return InsigneaPerfil(
      id: json["id"] as int?,
      nome: json["nome"] as String?,
      descricao: json["descricao"] as String?,
      urlInsigea: json["urlInsigea"] as String?,
    );
  }
}
