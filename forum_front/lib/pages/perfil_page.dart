import 'package:flutter/material.dart';

class PerfilPage extends StatelessWidget {
  const PerfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 64, 8, 8),
            child: CircleAvatar(radius: 48),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
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
          SizedBox(height: 8),
          Row(
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
          ),
          SizedBox(height: 16),
          Row(
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
          ),
        ],
      ),
    );
  }
}
