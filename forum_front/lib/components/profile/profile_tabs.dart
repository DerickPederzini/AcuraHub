import 'package:flutter/material.dart';
import 'package:forum_front/constants/app_colors.dart';

class ProfileTabs extends StatefulWidget {
  const ProfileTabs({
    super.key,
    required this.selectedTab,
    required this.onTabChange,
  });

  final int selectedTab;
  final ValueChanged<int> onTabChange;

  @override
  State<ProfileTabs> createState() => _ProfileTabsState();
}

class _ProfileTabsState extends State<ProfileTabs> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.cinza_escuro)),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextButton(
              onPressed: () => widget.onTabChange(0),
              child: Text(
                "Conquistas",
                style: TextStyle(
                  color: widget.selectedTab == 0
                      ? AppColors.blue_claro_2
                      : AppColors.cinza_claro_1,
                  fontWeight: widget.selectedTab == 0
                      ? FontWeight.bold
                      : FontWeight.normal,
                ),
              ),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: () => widget.onTabChange(1),
              child: Text(
                "Notícias Salvas",
                style: TextStyle(
                  color: widget.selectedTab == 1
                      ? AppColors.blue_claro_2
                      : AppColors.cinza_claro_1,
                  fontWeight: widget.selectedTab == 1
                      ? FontWeight.bold
                      : FontWeight.normal,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
