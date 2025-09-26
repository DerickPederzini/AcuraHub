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
        author: "EuroFarma",
        titulo: "Venha ver as novidades!",
        body:
            "Venha conhecer a mais nova novidade da Eurofarma, possuimos diversas novidades, elas são muitos novas, todas elas, são as novidades mais novas do mundo, nós amamos essas novidades, oh yeah so new and cool, *you'll become new again*",
      ),
      News(
        author: "EuroFarma",
        titulo: "Venha ver as novidades!",
        body:
            "Venha conhecer a mais nova novidade da Eurofarma, possuimos diversas novidades, elas são muitos novas, todas elas, são as novidades mais novas do mundo, nós amamos essas novidades, oh yeah so new and cool, *you'll become new again*",
      ),
      News(
        author: "EuroFarma",
        titulo: "Venha ver as novidades!",
        body:
            "Venha conhecer a mais nova novidade da Eurofarma, possuimos diversas novidades, elas são muitos novas, todas elas, são as novidades mais novas do mundo, nós amamos essas novidades, oh yeah so new and cool, *you'll become new again*",
      ),
      News(
        author: "EuroFarma",
        titulo: "Venha ver as novidades!",
        body:
            "Venha conhecer a mais nova novidade da Eurofarma, possuimos diversas novidades, elas são muitos novas, todas elas, são as novidades mais novas do mundo, nós amamos essas novidades, oh yeah so new and cool, *you'll become new again*",
      ),
      News(
        author: "EuroFarma",
        titulo: "Venha ver as novidades!",
        body:
            "Venha conhecer a mais nova novidade da Eurofarma, possuimos diversas novidades, elas são muitos novas, todas elas, são as novidades mais novas do mundo, nós amamos essas novidades, oh yeah so new and cool, *you'll become new again*",
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
