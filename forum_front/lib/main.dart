import 'package:flutter/material.dart';
import 'package:forum_front/constants/app_colors.dart';
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
      debugShowCheckedModeBanner: false,
      title: 'Forum Euron',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme:
            ColorScheme.fromSeed(
              seedColor: Colors.white70,
              brightness: Brightness.dark,
            ).copyWith(
              surface: AppColors.grey_dark,
              surfaceVariant: AppColors.grey_dark,
              onSurface: Colors.white,
              // prevent the default surface tint from changing your color,
              // or set it equal to your surface to avoid blending
              surfaceTint: Colors.transparent,
            ),
        scaffoldBackgroundColor: AppColors.grey_dark,
        // drawer themes
        drawerTheme: DrawerThemeData(
          backgroundColor: AppColors.grey_dark,
          scrimColor: Colors.black54,
          elevation: 0,
        ),
        navigationDrawerTheme: NavigationDrawerThemeData(
          backgroundColor: AppColors.grey_dark,
          indicatorColor: Colors.white24,
          // force label/icon colors
          labelTextStyle: MaterialStateProperty.all(
            TextStyle(color: Colors.white),
          ),
        ),
        // list tiles used inside drawers / nav
        listTileTheme: ListTileThemeData(
          iconColor: Colors.white,
          textColor: Colors.white,
        ),
        // keep cards, canvas consistent
        cardColor: AppColors.grey_dark,
        canvasColor: AppColors.grey_dark,
      ),
      initialRoute: "/login",
      routes: {
        "/": (context) => LayoutPage(index: 0),
        "/login": (context) => LoginPage(),
        "/register": (context) => RegisterPage(),
        "/perfil": (context) => LayoutPage(index: 4),
        "/challenge": (context) => LayoutPage(index: 2),
        "/boards": (context) => LayoutPage(index: 1),
        "/achievements": (context) => LayoutPage(index: 5),
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
          final args = rt.arguments as CapituloPageArgs;

          return MaterialPageRoute(
            builder: (context) {
              return CapituloPage(
                etapaId: args.etapaId,
                moduloId: args.moduloId,
              );
            },
          );
        }
        return null;
      },
    );
  }
}
