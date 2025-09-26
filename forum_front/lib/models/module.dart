
class Module {
  int? id;
  String? title;
  String? description;
  int? totalCapitulos;
  int? completedCapitulos;

  Module({required this.id, this.title, required this.description, required this.totalCapitulos, required this.completedCapitulos});

  factory Module.fromJson(Map<String, dynamic> json) {
    return Module(
      id: json["id"] as int?,
      title: json["title"] as String?,
      description: json["description"] as String?,
      totalCapitulos: json["totalCapitulos"] as int?,
      completedCapitulos: json["completedCapitulos"] as int?
    );
  }

  Map<String, dynamic> toJson() {
    return {"id": id, "title": title, "description": description, "totalCapitulos": totalCapitulos , "completedCapitulos": completedCapitulos};
  }
}
