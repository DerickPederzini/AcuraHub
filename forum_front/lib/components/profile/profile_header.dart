import 'package:flutter/material.dart';

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
                  colors: [Colors.blue.shade400, Colors.blue.shade700],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
              child: CircleAvatar(
                radius: 32,
                backgroundColor: Colors.white,
                child: Text(widget.info[0][0], style: TextStyle(fontSize: 32),)
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
                style: TextStyle(color: Colors.grey.shade700, fontSize: 14, fontFamily: 'Public Sans'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
