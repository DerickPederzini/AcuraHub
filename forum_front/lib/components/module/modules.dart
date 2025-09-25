import 'package:flutter/material.dart';
import 'package:forum_front/constants/app_colors.dart';
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
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
      child: Column(
        children: [
          Row(
            children: [
              Text("${widget.index + 1}. ", style: TextStyle(fontSize: 14),),
              Text("${widget.module.title}", style: TextStyle(fontSize: 14),),
            ],
          ),
          SizedBox(height: 16),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: SizedBox(
                  height: 4,
                  child: LinearProgressIndicator(
                  value: (widget.module.completedCapitulos! / widget.module.totalCapitulos!),
                    backgroundColor: Colors.grey[300],
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      Colors.blue,
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
                  fontSize: 10,
                ),
              ),
            ],
          ),
          SizedBox(height: 24),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              minimumSize: Size(double.infinity, 48),
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
            child: Text("Continuar"),
          ),
          SizedBox(height: 24),

          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: AppColors.text_create_page, width: 2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
