import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [Icon(Icons.home), Icon(Icons.high_quality), Icon(Icons.create), Icon(Icons.person)],
      ),
    );
  }
}