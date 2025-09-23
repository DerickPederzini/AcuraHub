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
              Text("${widget.index + 1}. "),
              Text("${widget.module.title}"),
            ],
          ),
          SizedBox(height: 16),

          LinearProgressIndicator(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            value: 10.00,
            minHeight: 4,
            valueColor: AlwaysStoppedAnimation(Colors.blue),
          ),
          SizedBox(height: 24),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              minimumSize: Size(double.infinity, 32),
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
                bottom: BorderSide(color: AppColors.text_create_page, width: 3),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
