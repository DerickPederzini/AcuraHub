
class Module {
  int? id;
  String? title;
  String? description;

  Module({required this.id, this.title, required this.description});

  factory Module.fromJson(Map<String, dynamic> json) {
    return Module(
      id: json["id"] as int?,
      title: json["title"] as String?,
      description: json["description"] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {"id": id, "title": title, "description": description};
  }
}
