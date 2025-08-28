import 'package:flutter/material.dart';

class ProfileHeader extends StatefulWidget {
  const ProfileHeader({super.key});

  @override
  State<ProfileHeader> createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: const EdgeInsets.fromLTRB(16, 64, 16, 16),
            child: CircleAvatar(radius: 48),
          ),
        Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Nome da pessoa da silva", style: TextStyle(fontSize: 24)),
                    Text("Atuação da Silva"),
                    Row(
                      children: [
                        Icon(Icons.abc),
                        Icon(Icons.abc),
                        Icon(Icons.abc),
                        SizedBox(width: 16),
                        Text("7 Conquistas", style: TextStyle(fontSize: 12)),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.arrow_forward),
                          iconSize: 12,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
      ],
    );
  }
}
