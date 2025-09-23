class Achievements {
  int? id;
  String? title;
  String? description;
  String? urlIcon;



  Achievements({
    required this.id,
    required this.title,
    required this.description,
    required this.urlIcon,
  });


  factory Achievements.fromJson(Map<String, dynamic> json) {
    return Achievements(
      id: json["id"] as int?,
      title: json["title"] as String?,
      description: json["description"] as String?,
      urlIcon: json["urlIcon"] as String?
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id, 
      "title": title, 
      "description": description, 
      "urlIcon": urlIcon};
  }
}