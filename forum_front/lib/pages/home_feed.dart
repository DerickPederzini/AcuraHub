import 'package:flutter/material.dart';
import 'package:forum_front/components/feed/feed_card.dart';
import 'package:forum_front/models/news.dart';

class HomeFeed extends StatefulWidget {
  const HomeFeed({super.key});

  @override
  State<HomeFeed> createState() => _HomeFeedState();
}

class _HomeFeedState extends State<HomeFeed> {
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
        titulo: "Curso de Onboarding Atualizado",
        body:
            "O curso de onboarding ganhou uma nova versão interativa com vídeos, quizzes e atividades práticas para tornar sua integração na Eurofarma ainda mais envolvente!",
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
      News(
        author: "Eurofarma",
        titulo: "Mentorias Online",
        body:
            "Conecte-se com especialistas da Eurofarma através de sessões de mentoria online. Uma oportunidade única de trocar experiências e acelerar seu desenvolvimento profissional.",
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: homeNews.length,
          itemBuilder: (context, index) {
            return FeedCard(news: homeNews[index]);
          },
        ),
      ),
    );
  }
}
