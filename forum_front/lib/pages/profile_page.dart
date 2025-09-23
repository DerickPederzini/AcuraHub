
import 'package:flutter/material.dart';
import 'package:forum_front/components/profile/profile_header.dart';
import 'package:forum_front/components/profile/profile_stats.dart';
import 'package:forum_front/components/profile/profile_tabs.dart';
import 'package:forum_front/pages/achievements_page.dart';



class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isTab = false;

  void handleButtonPressed() {
    setState(() {
      isTab =! isTab;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            const ProfileHeader(),
            const SizedBox(height: 8),
            const ProfileStats(),
            const SizedBox(height: 16),
            ProfileTabs(onPressed: handleButtonPressed,),
            Expanded(child: AchievementsPage(isTab: isTab))
          ],
        ),
    );
  }
}
