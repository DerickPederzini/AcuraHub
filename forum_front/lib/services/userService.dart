import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:forum_front/models/insignea.dart';
import 'package:forum_front/models/insignea_perfil.dart';
import 'package:forum_front/models/module.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';

Future<List<Module>> fetchModuloByEtapa(int id) async {
  final storage = const FlutterSecureStorage();
  final jwt = await storage.read(key: "jwt");

  final response = await http.get(
    Uri.parse('http://localhost:8081/modulos/etapa/$id'),
    headers: {"Authorization": "Bearer $jwt"},
  );

  if (response.statusCode == 200) {
    List<dynamic> jsonList = jsonDecode(response.body);
    return jsonList.map((e) => Module.fromJson(e)).toList();
  } else {
    throw Exception('Erro ao carregar etapas');
  }
}

Future<String> pushInsignia(int? idInsignia) async {
  final storage = const FlutterSecureStorage();
  String? jwt = await storage.read(key: "jwt");

  Map<String?, dynamic> decodedToken = JwtDecoder.decode(jwt!);

  int idUser = decodedToken["id"] as int;

  final response = await http.post(
    Uri.parse('http://localhost:8081/usuarios/perfil/insignias/$idUser/$idInsignia'),
    headers: {"Authorization": "Bearer $jwt"},
  );

  if (response.statusCode == 200) {
    final message = response.body;
    return message;
  }
  throw Exception('Erro ao resgatar');
}

Future<List<InsigneaPerfil>> fetchInsigea() async {
  final storage = const FlutterSecureStorage();
  String? jwt = await storage.read(key: "jwt");

  Map<String?, dynamic> decodedToken = JwtDecoder.decode(jwt!);

  int idUser = decodedToken["id"] as int;

  final response = await http.get(
    Uri.parse('http://localhost:8081/usuarios/perfil/insignias/$idUser'),
    headers: {"Authorization": "Bearer $jwt"},
  );

  if (response.statusCode == 200) {
    List<dynamic> jsonList = jsonDecode(response.body);
    return jsonList.map((e) => InsigneaPerfil.fromJson(e)).toList();
  } else {
    throw Exception('Erro ao carregar etapas');
  }
}

Future<List<String>> decodeJwtForPerfil() async {
  final storage = const FlutterSecureStorage();
  final jwt = await storage.read(key: "jwt");
  Map<String?, dynamic> decodedToken = JwtDecoder.decode(jwt!);

  List<String> response = [];

  String username = decodedToken["username"] as String;
  String atuacao = decodedToken["atuacao"] as String;

  response.add(username);
  response.add(atuacao);

  return response;
}
