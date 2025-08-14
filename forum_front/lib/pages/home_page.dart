import 'package:flutter/material.dart';
import 'package:forum_front/components/home_feed.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(children: []),
          HomeFeed(),
        ],
      ),
    );
  }
}
