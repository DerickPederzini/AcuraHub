import 'package:flutter/material.dart';
import 'package:forum_front/constants/app_colors.dart';
import 'package:forum_front/models/challenge.dart';

class ChallengeFeed extends StatefulWidget {
  const ChallengeFeed({super.key});

  @override
  State<ChallengeFeed> createState() => _ChallengeFeedState();
}

class _ChallengeFeedState extends State<ChallengeFeed> {
  List<Challenge> challenge = [
    Challenge(
      id: 1,
      urlImagem: "",
      descricao: "Complete a etapa Clic",
      title: "Complete a etapa Clic",
    ),
    Challenge(
      id: 2,
      urlImagem: "",
      descricao: "Complete a etapa Kaizen",
      title: "Complete a etapa Kaizen",
    ),
    Challenge(
      id: 3,
      urlImagem: "",
      descricao: "Complete a etapa Kaizen2",
      title: "Complete a etapa Kaizen2",
    ),
  ];
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: challenge.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(width: 2, color: AppColors.text_create_page),
            ),

            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.electric_bolt, size: 60),

                  const SizedBox(width: 10.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          challenge[index].title,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        isExpanded
                            ? Text(challenge[index].descricao)
                            : SizedBox(),
                        const SizedBox(height: 5),
 
                          LinearProgressIndicator(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            value: 10.00,
                            minHeight: 16,
                            valueColor: AlwaysStoppedAnimation(Colors.blue),
                          ),
                        
                      ],
                    ),
                  ),
                  IconButton(
                    iconSize: 20,
                    onPressed: () {
                      setState(() {
                        isExpanded = !isExpanded;
                      });
                    },
                    icon: Icon(
                      !isExpanded ? Icons.arrow_upward : Icons.arrow_downward,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
