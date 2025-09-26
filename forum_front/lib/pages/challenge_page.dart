import 'package:flutter/material.dart';
import 'package:forum_front/components/challenge/challenge_feed.dart';
import 'package:forum_front/components/chat/chat_button.dart';
import 'package:forum_front/constants/app_colors.dart';
import 'package:forum_front/services/achievementService.dart';

class ChallengePage extends StatelessWidget {
  const ChallengePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 180,
            color: AppColors.blue_eurofarma,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Challenge",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Complete as missões para ganhar recompensas",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Missões atuais",
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 8),

          Expanded(
            child: FutureBuilder(
              future: fetchChallengeByUserId(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  Text("Erro: ${snapshot.error}");
                } else if (snapshot.hasData) {
                  final challenges = snapshot.data!;
                  return ListView.separated(
                    itemCount: challenges.length,
                    itemBuilder: (context, index) {
                      return ChallengeFeed(insignea: challenges[index]);
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 16);
                    },
                  );
                }
                return Text("Sucks");
              }      
            ),
          ),
        ],
      ),
    );
  }
}
