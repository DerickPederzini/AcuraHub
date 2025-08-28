import 'package:flutter/material.dart';
import 'package:forum_front/components/notifications/notification_card.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text("7 dias atrás", textAlign: TextAlign.start, style: TextStyle(fontSize: 16),),
          ),
          NotificationCard(), 
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text("30 dias atrás", textAlign: TextAlign.start, style: TextStyle(fontSize: 16),),
          ),
          NotificationCard(), 
          NotificationCard()],
      ),
    );
  }
}
