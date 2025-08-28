import 'package:flutter/material.dart';

class ProfileStats extends StatefulWidget {
  const ProfileStats({super.key});

  @override
  State<ProfileStats> createState() => _ProfileStatsState();
}

class _ProfileStatsState extends State<ProfileStats> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("23"),
            Text("Contribuição", style: (TextStyle(fontSize: 12))),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("3"),
            Text("Projetos", style: (TextStyle(fontSize: 12))),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("9/10"),
            Text("Companheiro", style: (TextStyle(fontSize: 12))),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("1"),
            Text("Ativo", style: (TextStyle(fontSize: 12))),
          ],
        ),
      ],
    );
  }
}
