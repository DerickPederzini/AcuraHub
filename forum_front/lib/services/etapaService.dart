import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:forum_front/models/course.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';

Future<List<Course>> fetchCourse() async {
  final storage = const FlutterSecureStorage();
  final jwt = await storage.read(key: "jwt");

  final response = await http.get(
    Uri.parse('http://localhost:8081/etapas'),
    headers: {"Authorization": "Bearer $jwt"},
  );

  if (response.statusCode == 200) {
    List<dynamic> jsonList = jsonDecode(response.body);
    return jsonList.map((e) => Course.fromJson(e)).toList();
  } else {
    throw Exception('Erro ao carregar etapas');
  }
}

Future<List<Course>> fetchCourseByUserId() async {
  final storage = const FlutterSecureStorage();
  final jwt = await storage.read(key: "jwt");

  Map<String?, dynamic> decodedToken = JwtDecoder.decode(jwt!);

  int idUser = decodedToken["id"] as int;

  final response = await http.get(
    Uri.parse('http://localhost:8081/etapas/user/$idUser'),
    headers: {"Authorization": "Bearer $jwt"},
  );

  if (response.statusCode == 200) {
    List<dynamic> jsonList = jsonDecode(response.body);
    return jsonList.map((e) => Course.fromJson(e)).toList();
  } else {
    throw Exception('Erro ao carregar etapas');
  }
}

Future<Course> fetchCourseById(int id) async {
  final storage = const FlutterSecureStorage();
  final jwt = await storage.read(key: "jwt");

  final response = await http.get(
    Uri.parse('http://localhost:8081/etapas/$id'),
    headers: {"Authorization": "Bearer $jwt"},
  );

  if (response.statusCode == 200) {
    dynamic json = jsonDecode(response.body);
    return Course.fromJson(json);
  } else {
    throw Exception('Erro ao carregar etapas');
  }
}
