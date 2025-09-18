import 'package:flutter/material.dart';
import 'package:forum_front/components/capitulo/capitulos.dart';
import 'package:forum_front/models/capitulo.dart';
import 'package:forum_front/services/capituloService.dart';

class CapituloPage extends StatefulWidget {

  final int etapaId;
  final int moduloId;

  const CapituloPage({super.key, required this.etapaId, required this.moduloId});

  @override
  State<CapituloPage> createState() => _CapituloPageState();
}

class _CapituloPageState extends State<CapituloPage> {

  late Future<List<Capitulo>> capitulos;

  @override
  void initState() {
    capitulos = fetchCapituloByModulo(widget.moduloId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(future: capitulos, builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator(),);
        }
        if (snapshot.hasError) {
          return Center(child: Text("Deru erro"),);
        }
        if (snapshot.hasData) {
          final capituloData = snapshot.data!;
          return ListView.separated(
              itemCount: capituloData.length,
              itemBuilder: (context, index) {
                return Capitulos(capitulo: capituloData[index], etapaId: widget.etapaId, moduloId: widget.moduloId,);
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 16);
              },
            );
        }
        return Text("sucks");
      }),
    );
  }
}