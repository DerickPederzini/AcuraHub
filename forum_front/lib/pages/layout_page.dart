import 'package:flutter/material.dart';
import 'package:forum_front/components/chat/chat_button.dart';
import 'package:forum_front/components/navigation/drawer.dart';
import 'package:forum_front/pages/challenge_page.dart';
import 'package:forum_front/pages/course_page.dart';
import 'package:forum_front/pages/create_page.dart';
import 'package:forum_front/pages/home_feed.dart';
import 'package:forum_front/pages/notifications_page.dart';
import 'package:forum_front/pages/profile_page.dart';

class LayoutPage extends StatefulWidget {
  final int index;

  const LayoutPage({super.key, required this.index});

  @override
  State<LayoutPage> createState() => _HomePageState();
}

class _HomePageState extends State<LayoutPage> {
  late int selectedIndex;

  final List<Widget> _allPages = [
    HomeFeed(),
    CoursePage(),
    ChallengePage(),
    NotificationsPage(),
    ProfilePage(),
  ];

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.index;
  }

  void handleChangePage(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, "/");
          },
          child: Image(image: AssetImage("assets/logos/Euron.png")),
        ),
      ),
      drawer: AppDrawer(),
      body: _allPages[selectedIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: ChatButton(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: handleChangePage,
        selectedItemColor: Colors.lightBlue,
        unselectedItemColor: Colors.white70,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper, size: 24),
            label: "Notícias",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assessment, size: 24),
            label: "Boards",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.checklist, size: 24),
            label: "Desafios",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notification_add, size: 24),
            label: "Notificação",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 24),
            label: "Perfil",
          ),
        ],
      ),
    );
  }
}
