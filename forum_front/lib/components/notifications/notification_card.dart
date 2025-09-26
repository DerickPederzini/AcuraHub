import 'package:flutter/material.dart';
import 'package:forum_front/constants/app_styles.dart';

class NotificationCard extends StatefulWidget {
  const NotificationCard({super.key});

  @override
  State<NotificationCard> createState() => _NotificationCardState();
}

class _NotificationCardState extends State<NotificationCard> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(radius: 24),
      title: Text("Eurofarma", style: AppStyles.font_14_sans),
      subtitle: Text(
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        "Descricao daquilo que foi enviado e tals, isso é legal pq coloca o limite do texto",
      ),
    );
  }
}
