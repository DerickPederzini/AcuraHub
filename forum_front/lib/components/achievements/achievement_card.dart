import 'package:flutter/material.dart';
import 'package:forum_front/constants/app_colors.dart';
import 'package:forum_front/models/achievements.dart';
import 'package:forum_front/models/insignea_perfil.dart';

class AchievementCard extends StatefulWidget {
  final InsigneaPerfil achievements;

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
          side: BorderSide(width: 2, color: AppColors.cinza_escuro),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Image.asset(widget.achievements.urlInsigea!),
              title: Text(
                widget.achievements.nome!,
                style: TextStyle(color: AppColors.branco),
              ),
              subtitle: Text(
                widget.achievements.descricao!,
                style: TextStyle(color: AppColors.branco),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
