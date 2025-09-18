import 'dart:convert';
import 'package:forum_front/models/module.dart';
import 'package:http/http.dart' as http;

Future<List<Module>> fetchModuloByEtapa(int id) async {
  final response = await http.get(
    Uri.parse('http://localhost:8081/modulos/etapa/$id'),
  );

  if (response.statusCode == 200) {
    List<dynamic> jsonList = jsonDecode(response.body);
    return jsonList.map((e) => Module.fromJson(e)).toList();

  } else {
    throw Exception('Erro ao carregar etapas');
  }
}
