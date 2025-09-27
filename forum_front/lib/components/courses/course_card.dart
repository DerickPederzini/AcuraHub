import 'package:flutter/material.dart';
import 'package:forum_front/constants/app_colors.dart';
import 'package:forum_front/constants/app_font.dart';
import 'package:forum_front/models/course.dart';

class CourseCard extends StatefulWidget {
  final Course course;

  const CourseCard({super.key, required this.course});

  @override
  State<CourseCard> createState() => _CourseCardState();
}

class _CourseCardState extends State<CourseCard> {
  bool fazendo = true;
  late int totalCapitulos;
  late int capitulosCompletos;
  late double progress;

  @override
  void initState() {
    super.initState();

    totalCapitulos = widget.course.totalCapitulos ?? 0;
    capitulosCompletos = widget.course.capitulosCompletos ?? 0;

    progress = 0.0;
    if (widget.course.totalCapitulos != null &&
        widget.course.totalCapitulos! > 0) {
      progress =
          widget.course.capitulosCompletos! / widget.course.totalCapitulos!;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth < 600) {
      return Container(
        decoration: BoxDecoration(color: AppColors.cinza_escuro_2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.course.titulo!,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: progress == 1
                          ? AppColors.blue_internal
                          : AppColors.blue_claro_1,
                      fontFamily: AppFont.public_sans,
                    ),
                  ),
                  Text(
                    widget.course.tema!,
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.cinza_claro_1,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 280,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 4,
                  color: progress == 1
                      ? AppColors.blue_internal
                      : AppColors.blue_claro_1,
                ),
                borderRadius: BorderRadius.zero,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("${widget.course.urlImagem}"),
                ),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 6,
                          child: LinearProgressIndicator(
                            value: progress,
                            backgroundColor: AppColors.cinza_claro_1,
                            valueColor: progress == 1
                                ? const AlwaysStoppedAnimation<Color>(
                                    AppColors.blue_internal,
                                  )
                                : const AlwaysStoppedAnimation<Color>(
                                    AppColors.blue_claro_1,
                                  ),
                          ),
                        ),
                      ),
                      SizedBox(width: 4),
                      Text(
                        '${(progress * 100).toStringAsFixed(0)}%',
                        style: const TextStyle(
                          color: AppColors.cinza_escuro,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          fontFamily: AppFont.public_sans,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        "/modulos",
                        arguments: widget.course.id,
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      minimumSize: Size(double.infinity, 64),
                      side: BorderSide(
                        color: progress == 1
                            ? AppColors.blue_internal
                            : AppColors.blue_claro_1,
                        width: 2,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                      ),
                    ),
                    child: Text(
                      progress == 1
                          ? "REVISAR"
                          : progress == 0
                          ? "COMEÇAR"
                          : "CONTINUAR",
                      style: TextStyle(
                        color: progress == 1
                            ? AppColors.blue_internal
                            : AppColors.blue_claro_1,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: AppFont.public_sans,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 140,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(widget.course.urlImagem!),
                ),
              ),
            ),
            const SizedBox(width: 10.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.course.titulo!,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    widget.course.tema!,
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.yellow, size: 15),
                      const SizedBox(height: 5),
                      Text('10'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }
}
