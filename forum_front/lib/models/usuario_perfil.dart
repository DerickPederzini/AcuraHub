import 'package:forum_front/models/course.dart';
import 'package:forum_front/models/insignea.dart';

class UsuarioPerfil {
  String username;
  List<Course> courses;
  List<Insignea> insigneas;

  UsuarioPerfil({required this.username, required this.courses, required this.insigneas});

    factory UsuarioPerfil.fromJson(Map<String, dynamic> json) {
    return UsuarioPerfil(
      username: json["username"],
      courses: json["courses"],
      insigneas: json["insigneas"]
    );
  }

  Map<String, dynamic> toJson() {
    return {"username": username, "insigneas": insigneas, "courses": courses};
  }


} 