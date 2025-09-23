import 'package:flutter/material.dart';

class ListItens {
  IconData icon;
  String text;
  String url;

  ListItens({required this.icon, required this.text, required this.url});
}

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  static final allListItens = [
    ListItens(icon: Icons.person, text: "Perfil", url: "/perfil" ),
    ListItens(icon: Icons.assessment, text: "Boards", url: "/boards"),
    ListItens(icon: Icons.checklist, text: "Desafios",url: "/challenge"),
    ListItens(icon: Icons.settings, text: "Configurações", url: "/"),
    ListItens(icon: Icons.exit_to_app, text: "Sair", url: "/login"),
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: LinearBorder.end(
        side: BorderSide(
          color: const Color.fromARGB(255, 0, 205, 240),
          width: 2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 32,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(radius: 24),
                SizedBox(height: 4),
                Text("Derick", style: TextStyle(fontSize: 18)),
                Text("@pederzini"),
              ],
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: allListItens.length,
            itemBuilder: (BuildContext context, index) {
              return ListTile(
                leading: Icon(allListItens[index].icon, size: 32),
                minVerticalPadding: 16,
                horizontalTitleGap: 32,
                title: TextButton(
                  style: TextButton.styleFrom(alignment: Alignment.centerLeft),
                  onPressed: () => {Navigator.pushNamed(context, allListItens[index].url)},
                  child: Text(
                    allListItens[index].text,
                    style: TextStyle(fontSize: 24, color: Colors.white70),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
