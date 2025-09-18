import 'package:flutter/material.dart';
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
    return Container(
      child: Row(
        children: [
          Text("${widget.index}."),
          Column(
            children: [
              Text("${widget.module.title}"),
              Text("${widget.module.description}"),
            ],
          ),
          Expanded(
            child: SizedBox(
              height: 2,
              child: LinearProgressIndicator(
                // value: widget.course.progress?.toDouble(),
                value: 73,
                backgroundColor: Colors.grey[300],
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
            ),
          ),
          OutlinedButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                "/capitulos",
                arguments: CapituloPageArgs(etapaId: widget.index, moduloId: widget.module.id!),
              );
            },
            child: Text("Continuar"),
          ),
        ],
      ),
    );
  }
}
