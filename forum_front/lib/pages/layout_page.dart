import 'package:flutter/material.dart';
import 'package:forum_front/components/chat/chat_button.dart';
import 'package:forum_front/components/navigation/drawer.dart';
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
    CreatePage(),
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
            icon: Icon(Icons.home, size: 24),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map, size: 24),
            label: "Projects",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.create, size: 24),
            label: "Create",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notification_add, size: 24),
            label: "Notifications",
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
