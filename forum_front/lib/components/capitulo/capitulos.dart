import 'package:flutter/material.dart';
import 'package:forum_front/models/capitulo.dart';

class Capitulos extends StatefulWidget {
  final Capitulo capitulo;
  final int etapaId;
  final int moduloId;

  const Capitulos({
    super.key,
    required this.capitulo,
    required this.etapaId,
    required this.moduloId,
  });

  @override
  State<Capitulos> createState() => _CapituloState();
}

class _CapituloState extends State<Capitulos> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text("${widget.capitulo.titulo}"),
          Text("${widget.capitulo.body}"),
          widget.capitulo.urlVideo != ""
              ? Text("${widget.capitulo.urlVideo}")
              : Text(""),
        ],
      ),
    );
  }
}
