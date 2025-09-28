import 'package:flutter/material.dart';
import 'package:forum_front/components/achievements/achievement_card.dart';
import 'package:forum_front/components/feed/feed_card.dart';
import 'package:forum_front/constants/app_colors.dart';
import 'package:forum_front/models/achievements.dart';
import 'package:forum_front/models/insignea_perfil.dart';
import 'package:forum_front/models/news.dart';

class AchievementsPage extends StatefulWidget {
  final bool isTab;
  final List<InsigneaPerfil> insignias;

  const AchievementsPage({
    super.key,
    required this.isTab,
    required this.insignias,
  });

  @override
  State<AchievementsPage> createState() => _AchievementsPageState();
}

// List<Achievements> mockAchievements = [
//   Achievements(
//     id: 1,
//     title: "Primeira Conquista",
//     description: "Você completou sua primeira tarefa!",
//     urlIcon: "assets/icons/medal.png",
//   ),
//   Achievements(
//     id: 2,
//     title: "Grande Contribuidor",
//     description: "Você fez 100 contribuições para a comunidade.",
//     urlIcon: "assets/icons/medal.png", // Usando o mesmo ícone mockado
//   ),
// ];

class _AchievementsPageState extends State<AchievementsPage> {
  List<News> homeNews = [];
  @override
  void initState() {
    homeNews = [
      News(
        author: "Eurofarma",
        titulo: "Novo Módulo Disponível!",
        body:
            "Lançamos o módulo *Boas Práticas de Produção*. Agora você poderá aprofundar seus conhecimentos em processos de qualidade, segurança e eficiência, garantindo ainda mais excelência no seu dia a dia.",
      ),
       News(
        author: "Eurofarma",
        titulo: "Nova Funcionalidade no App",
        body:
            "Agora você pode acompanhar seu progresso em tempo real através da aba *Meu Desempenho*. Fique por dentro das suas conquistas e continue evoluindo conosco!",
      ),
      News(
        author: "Eurofarma",
        titulo: "Programa de Reconhecimento",
        body:
            "Chegou o sistema de *Insígnias e Recompensas*! Conquiste insígnias exclusivas ao completar cursos e participe do ranking mensal dos colaboradores mais engajados.",
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isTab) {
      return Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8),

            Expanded(
              child: ListView.builder(
                itemCount: widget.insignias.length,
                itemBuilder: (context, index) {
                  return AchievementCard(achievements: widget.insignias[index]);
                },
              ),
            ),
          ],
        ),
      );
    } else {
      return Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8),

            Expanded(
              child: ListView.builder(
                itemCount: widget.insignias.length,
                itemBuilder: (context, index) {
                  return FeedCard(news: homeNews[index]);
                },
              ),
            ),
          ],
        ),
      );
    }
  }
}
