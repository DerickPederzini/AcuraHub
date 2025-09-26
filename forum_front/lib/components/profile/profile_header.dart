import 'package:flutter/material.dart';
import 'package:forum_front/constants/app_colors.dart';


class ProfileHeader extends StatefulWidget {
  final List<String> info;
  const ProfileHeader({super.key, required this.info});

  @override
  State<ProfileHeader> createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              height: 140,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.goat_internal, AppColors.blue_internal],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
              child: CircleAvatar(
                radius: 32,
                backgroundColor: AppColors.branco,
                child: Text(widget.info[0][0], style: TextStyle(fontSize: 32, color: AppColors.goat_internal),)
              ),
            ),
          ],
        ),

        Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.info.isNotEmpty ? widget.info[0] : "",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                widget.info.length > 1 ? widget.info[1] : "",
                style: TextStyle(color: AppColors.cinza_claro_1, fontSize: 14, fontFamily: 'Public Sans'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
