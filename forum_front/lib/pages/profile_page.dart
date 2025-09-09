import 'package:flutter/material.dart';
import 'package:forum_front/components/profile/profile_header.dart';
import 'package:forum_front/components/profile/profile_stats.dart';
import 'package:forum_front/components/profile/profile_tabs.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          ProfileHeader(),
          SizedBox(height: 8),
          ProfileStats(),
          SizedBox(height: 16),
          ProfileTabs(),
        ],
      ),
    );
  }
}
