import 'package:flutter/material.dart';

class PerfilPage extends StatelessWidget {
  const PerfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(),
                Column(
                  children: [
                    Text("ABC"),
                    Text("DEF"),
                    Row(
                      children: [
                        Icon(Icons.abc),
                        Icon(Icons.abc),
                        Icon(Icons.abc),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Row(children: [Card(), Card()]),
            Row(children: [Card(), Card()]),
            Row(children: [Card(), Card()]),
          ],
        ),
      ),
    );
  }
}
