import 'dart:async';

import 'package:flutter/material.dart';
import 'package:forum_front/components/profile/profile_header.dart';
import 'package:forum_front/components/profile/profile_stats.dart';
import 'package:forum_front/components/profile/profile_tabs.dart';
import 'package:forum_front/pages/achievements_page.dart';
import 'package:forum_front/services/userService.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int selectedTab = 0; // 0 = conquistas, 1 = notícias salvas
  List<String> info = [];

  @override
  void initState() {
    super.initState();
    _handleInfo();
  }

  void _handleInfo() async {
    final result = await decodeJwtForPerfil();
    setState(() {
      info = result;
    });
  }

  void handleTabChange(int index) {
    setState(() {
      selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (info.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }
    return Scaffold(
      body: Column(
        children: [
          ProfileHeader(info: info),
          const SizedBox(height: 8),
          const ProfileStats(),
          const SizedBox(height: 16),
          ProfileTabs(selectedTab: selectedTab, onTabChange: handleTabChange),
          Expanded(child: AchievementsPage(isTab: selectedTab == 0)),
        ],
      ),
    );
  }
}
