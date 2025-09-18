import 'dart:convert';

import 'package:forum_front/models/chat.dart';
import 'package:http/http.dart' as http;

Future<Chat> postMessage(String message) async {
  final response =
      await http.post(
        Uri.parse('http://localhost:8000/chat?query=$message'),
      );
  
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body) as Map<String, dynamic>;
    return Chat.fromJson(data);
  } else {
    throw Exception('Falha ao enviar a mensagem.');
  }
}