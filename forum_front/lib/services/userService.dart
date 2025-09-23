import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:forum_front/models/module.dart';
import 'package:http/http.dart' as http;

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
