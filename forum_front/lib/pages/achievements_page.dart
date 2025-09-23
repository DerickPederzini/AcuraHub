import 'package:flutter/material.dart';
import 'package:forum_front/components/achievements/achievement_card.dart';
import 'package:forum_front/constants/app_colors.dart';
import 'package:forum_front/models/achievements.dart';


class AchievementsPage extends StatefulWidget {
  final bool isTab;

  const AchievementsPage({super.key, required this.isTab});

  @override
  State<AchievementsPage> createState() => _AchievementsPageState();
}

List<Achievements> mockAchievements = [
  Achievements(
    id: 1,
    title: "Primeira Conquista",
    description: "Você completou sua primeira tarefa!",
    urlIcon: "assets/icons/medal.png",
  ),
  Achievements(
    id: 2,
    title: "Grande Contribuidor",
    description: "Você fez 100 contribuições para a comunidade.",
    urlIcon: "assets/icons/medal.png", // Usando o mesmo ícone mockado
  ),
  
];


class _AchievementsPageState extends State<AchievementsPage> {



  @override
  Widget build(BuildContext context) {

    if(widget.isTab) {

     return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 80,
            color: AppColors.blue_eurofarma,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Conquistas",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          SizedBox(height: 8, ),

          Expanded(child: ListView.builder(
            itemCount: mockAchievements.length,
            itemBuilder: (context, index) {

            return AchievementCard(achievements: mockAchievements[index]);
            },
          ) 
          
          ),
        ],
      ),
    );
    } else {
      return Text("Não tá pronto");
    }
  }
}

