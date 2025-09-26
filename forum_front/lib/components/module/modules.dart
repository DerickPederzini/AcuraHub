import 'package:flutter/material.dart';
import 'package:forum_front/constants/app_colors.dart';
import 'package:forum_front/constants/app_font.dart';
import 'package:forum_front/constants/app_styles.dart';
import 'package:forum_front/helpers/capitulo_page_args.dart';
import 'package:forum_front/models/module.dart';

class Modules extends StatefulWidget {
  final Module module;
  final int index;

  const Modules({super.key, required this.module, required this.index});

  @override
  State<Modules> createState() => _ModulesState();
}

class _ModulesState extends State<Modules> {
  late final double progress;

  @override
  void initState() {
    progress =
        widget.module.completedCapitulos! / widget.module.totalCapitulos!;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.cinza_escuro_3,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "${widget.index + 1}. ",
                    style: TextStyle(
                      fontFamily: AppFont.public_sans,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    "${widget.module.title}",
                    style: TextStyle(
                      fontFamily: AppFont.public_sans,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 12,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(12),
                        ),
                        child: Stack(
                          children: [
                            Container(color: Colors.grey[300]),
                            FractionallySizedBox(
                              alignment: Alignment.centerLeft,
                              widthFactor: progress,
                              child: Container(
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      AppColors.blue_eurofarma,
                                      AppColors.blue_claro_2,
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 4),
                  Text(
                    // '${widget.course.progress}%',
                    '${widget.module.completedCapitulos! / widget.module.totalCapitulos! * 100}%',
                    style: const TextStyle(
                      color: AppColors.grey_70,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      fontFamily: AppFont.public_sans,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),

              TextButton(
                style: TextButton.styleFrom(
                  minimumSize: Size(double.infinity, 60),
                  textStyle: TextStyle(fontSize: 18),
                  backgroundColor: AppColors.blue_claro_1_opacity15,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                ),

                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    "/capitulos",
                    arguments: CapituloPageArgs(
                      etapaId: widget.index,
                      moduloId: widget.module.id!,
                    ),
                  );
                },
                child: progress == 0
                    ? Text(
                        "Começar",
                        style: TextStyle(
                          color: AppColors.blue_claro_2,
                          fontFamily: AppFont.public_sans,
                        ),
                      )
                    : progress == 1
                    ? Text(
                        "Revisitar",
                        style: TextStyle(
                          color: AppColors.blue_claro_2,
                          fontFamily: AppFont.public_sans,
                        ),
                      )
                    : Text(
                        "Continuar",
                        style: TextStyle(
                          color: AppColors.blue_claro_2,
                          fontFamily: AppFont.public_sans,
                        ),
                      ),
              ),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
