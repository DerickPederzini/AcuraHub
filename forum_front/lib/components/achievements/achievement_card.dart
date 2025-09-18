import 'package:flutter/material.dart';
import 'package:forum_front/models/achievements.dart';

class AchievementCard extends StatefulWidget {
  final Achievements achievements;

  const AchievementCard({super.key, required this.achievements});

  @override
  State<AchievementCard> createState() => _AchievementCardState();
}

class _AchievementCardState extends State<AchievementCard> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        color: Theme.of(context).scaffoldBackgroundColor,
        shape: LinearBorder.bottom(
          side: BorderSide(width: 2, color: Colors.grey.shade800),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Image.network(widget.achievements.urlIcon!),
              title: Text(widget.achievements.title!),
              subtitle: Text(widget.achievements.description!),
            ),
          ],
        ),
      ),
    );
  }
}
