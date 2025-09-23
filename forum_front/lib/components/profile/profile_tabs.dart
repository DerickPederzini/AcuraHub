import 'package:flutter/material.dart';

class ProfileTabs extends StatefulWidget {
  const ProfileTabs({super.key, required this.onPressed});
  final VoidCallback onPressed;


  @override
  State<ProfileTabs> createState() => _ProfileTabsState();
}

class _ProfileTabsState extends State<ProfileTabs> {

  bool isTab = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: TextButton(onPressed: widget.onPressed, 
          child: Text("Conquistas")),
        ),
    
        Expanded(
          child: TextButton(onPressed: () => {}, child: Text("Notícias Salvas")),
        ),
      ],
    );
  }
}
