import 'package:flutter/material.dart';
import 'package:forum_front/constants/app_colors.dart';
import 'package:forum_front/models/challenge.dart';
import 'package:forum_front/models/insignea.dart';

class ChallengeFeed extends StatefulWidget {
  final Insignea insignea;

  const ChallengeFeed({super.key, required this.insignea});

  @override
  State<ChallengeFeed> createState() => _ChallengeFeedState();
}

class _ChallengeFeedState extends State<ChallengeFeed> {
  bool isExpanded = false;
  bool recompensaResgatada = false;
  late int totalCapitulos;
  late int capitulosCompletos;
  late double progress;

  @override
  void initState() {
    super.initState();

    totalCapitulos = widget.insignea.totalCapitulos ?? 0;
    capitulosCompletos = widget.insignea.capitulosCompletos ?? 0;

    progress = 0.0;
    if (widget.insignea.totalCapitulos != null &&
        widget.insignea.totalCapitulos! > 0) {
      progress =
          widget.insignea.capitulosCompletos! / widget.insignea.totalCapitulos!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width: 2, color: AppColors.cinza_escuro),
        ),

        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.cinza_escuro),
                  borderRadius: BorderRadius.circular(128),
                ),
                child: Icon(
                  Icons.electric_bolt,
                  size: 60,
                  color: AppColors.blue_claro_1,
                ),
              ),

              const SizedBox(width: 10.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${widget.insignea.nome}",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.branco,
                      ),
                    ),
                    isExpanded
                        ? Text(
                            "${widget.insignea.descricao}",
                            style: TextStyle(color: AppColors.cinza_claro_1),
                          )
                        : SizedBox(),
                    const SizedBox(height: 5),

                    LinearProgressIndicator(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      value: progress,
                      minHeight: 12,
                      backgroundColor: Colors.grey[300],
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        AppColors.blue_eurofarma,
                      ),
                    ),

                    const SizedBox(height: 24),

                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: progress == 1 ? AppColors.blue_claro_1 : AppColors.cinza_escuro_2,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: progress == 1
                          ? () {
                              setState(() {
                                recompensaResgatada = true;
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Recompensa resgatada!"),
                                ),
                              );
                            }
                          : null,
                      child: Text(
                        recompensaResgatada ? "Resgatado" : "Resgatar Recompensa",
                      ),
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
  }
}
