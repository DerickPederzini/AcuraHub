import 'package:flutter/material.dart';
import 'package:forum_front/helpers/capitulo_page_args.dart';
import 'package:forum_front/pages/capitulo_page.dart';
import 'package:forum_front/pages/layout_page.dart';
import 'package:forum_front/pages/login_page.dart';
import 'package:forum_front/pages/module_page.dart';
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
        "/": (context) => LayoutPage(index: 0),
        "/login": (context) => LoginPage(),
        "/register": (context) => RegisterPage(),
        "/perfil": (context) => LayoutPage(index: 4),
        "/challenge": (context) => LayoutPage(index: 2)
      },
      onGenerateRoute: (rt) {
        if (rt.name == "/modulos") {
          final etapaId = rt.arguments as int;
          return MaterialPageRoute(
            builder: (context) {
              return ModulePage(etapaId: etapaId);
            },
          );
        }
        if (rt.name == "/capitulos") {
          print("jhsuida");
          final args = rt.arguments as CapituloPageArgs;

          return MaterialPageRoute(builder: (context) {
            return CapituloPage(etapaId: args.etapaId, moduloId: args.moduloId);
          });
        }
        return null;
      },
    );
  }
}
