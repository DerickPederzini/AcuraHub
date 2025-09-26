import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:forum_front/models/capitulo.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';

Future<List<Capitulo>> fetchCapituloByModulo(int id) async {
  final storage = const FlutterSecureStorage();
  final jwt = await storage.read(key: "jwt");

  final response = await http.get(
    Uri.parse('http://localhost:8081/capitulos/modulo/$id'),
    headers: {"Authorization": "Bearer $jwt"},
  );

  if (response.statusCode == 200) {
    List<dynamic> jsonList = jsonDecode(response.body);
    return jsonList.map((e) => Capitulo.fromJson(e)).toList();
  } else {
    throw Exception('Erro ao carregar capitulos');
  }
}

Future<void> finishCapitulo(List<int?> capitulos) async {
  final storage = const FlutterSecureStorage();
  String? jwt = await storage.read(key: "jwt");

  Map<String?, dynamic> decodedToken = JwtDecoder.decode(jwt!);

  int idUser = decodedToken["id"] as int;

  for (int i = 0; i < capitulos.length; i++) {
    final response = await http.post(
      Uri.parse(
        'http://localhost:8081/capitulos/progresso/user/${capitulos[i]}/$idUser',
      ),
      headers: {"Authorization": "Bearer $jwt"},
    );
    if (response.statusCode == 201) {
      print("Nice dms");
    } else {
      throw Exception('Erro ao carregar capitulos');
    }
  }
}
