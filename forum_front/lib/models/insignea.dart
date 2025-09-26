class Insignea {
  int? id;
  String? nome;
  String? descricao;
  String? urlInsigea;
  int? capitulosCompletos;
  int? totalCapitulos;
  bool concluida;

  Insignea({
    required this.id,
    required this.nome,
    required this.descricao,
    required this.urlInsigea,
    required this.capitulosCompletos,
    required this.totalCapitulos,
    required this.concluida,
  });

  factory Insignea.fromJson(Map<String, dynamic> json) {
    return Insignea(
      id: json["id"] as int?,
      nome: json["nome"] as String?,
      descricao: json["descricao"] as String?,
      urlInsigea: json["urlInsigea"] as String?,
      concluida: json["concluida"] as bool,
      totalCapitulos: json["totalCapitulos"] as int?,
      capitulosCompletos: json["capitulosCompletos"] as int?,
    );
  }
}
