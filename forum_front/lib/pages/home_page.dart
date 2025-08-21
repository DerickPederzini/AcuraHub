import 'package:flutter/material.dart';
import 'package:forum_front/components/drawer.dart';
import 'package:forum_front/components/home_feed.dart';
import 'package:forum_front/pages/perfil_page.dart';

class HomePage extends StatefulWidget {
  final int index;

  const HomePage({super.key, required this.index});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int selectedIndex;

  final List<Widget> _allPages = [
    HomeFeed(),
    Center(child: Text("Projects")),
    Center(child: Text("Create")),
    Center(child: Text("Notifications")),
    PerfilPage(),
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
