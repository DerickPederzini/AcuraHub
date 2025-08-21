import 'package:flutter/material.dart';
import 'package:forum_front/pages/home_page.dart';
import 'package:forum_front/pages/login_page.dart';
import 'package:forum_front/pages/perfil_page.dart';
import 'package:forum_front/pages/register_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Forum Euron',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white70,
          brightness: Brightness.dark,
        ),
      ),
      initialRoute: "/login",
      routes: {
        "/": (context) => HomePage(index: 0,),
        "/login": (context) => LoginPage(),
        "/register": (context) => RegisterPage(),
        "/perfil": (context) => HomePage(index : 4),
      },
    );
  }
}
