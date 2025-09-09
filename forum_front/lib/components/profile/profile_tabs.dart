import 'package:flutter/material.dart';

class ProfileTabs extends StatefulWidget {
  const ProfileTabs({super.key});

  @override
  State<ProfileTabs> createState() => _ProfileTabsState();
}

class _ProfileTabsState extends State<ProfileTabs> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: TextButton(onPressed: () => {}, child: Text("Posts")),
        ),
        Expanded(
          child: TextButton(onPressed: () => {}, child: Text("Comentários")),
        ),
        Expanded(
          child: TextButton(onPressed: () => {}, child: Text("Sobre")),
        ),
      ],
    );
  }
}
