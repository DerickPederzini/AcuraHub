import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:http/http.dart' as http;

final String baseUrl = "http://localhost:8081";

Future<String?> login(String email, String senha) async {
  final response = await http.post(
    Uri.parse("$baseUrl/user/auth/login"),
    headers: {"Content-Type": "application/json"},
    body: jsonEncode({"email": email, "senha": senha}),
  );

  if (response.statusCode == 200) {
    final usuario = jsonDecode(response.body);

    final storage = FlutterSecureStorage();
    print(usuario["accessToken"]);
    await storage.write(key: "jwt", value: usuario["accessToken"]);

    return usuario["acessToken"];
  }
  throw Exception('Erro ao logar');
}

Future<String> registerUser(
  String email,
  String senha,
  String username,
  String cpf,
) async {
  final response = await http.post(
    Uri.parse("$baseUrl/user/auth/registrar"),
    headers: {"Content-Type": "application/json"},
    body: jsonEncode({
      "email": email,
      "senha": senha,
      "username": username,
      "cpf": cpf,
    }),
  );

  if (response.statusCode == 200) {
    return response.body;
  }
  throw Exception('Erro ao criar usuario');
}
