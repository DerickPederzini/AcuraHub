import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:forum_front/models/insignea.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:http/http.dart' as http;


Future<List<Insignea>> fetchChallengeByUserId() async {
  final storage = const FlutterSecureStorage();
  final jwt = await storage.read(key: "jwt");

  Map<String?, dynamic> decodedToken = JwtDecoder.decode(jwt!);

  int idUser = decodedToken["id"] as int;

  final response = await http.get(
    Uri.parse('http://localhost:8081/insignias/user/$idUser'),
    headers: {"Authorization": "Bearer $jwt"},
  );


  if (response.statusCode == 200) {
    List<dynamic> jsonList = jsonDecode(response.body);
    print(jsonList);
    return jsonList.map((e) => Insignea.fromJson(e)).toList();
  } else {
    throw Exception('Erro ao carregar etapas');
  }
}