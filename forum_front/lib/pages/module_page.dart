import 'dart:math';

import 'package:flutter/material.dart';
import 'package:forum_front/components/chat/chat_button.dart';
import 'package:forum_front/components/module/modules.dart';
import 'package:forum_front/components/navigation/drawer.dart';
import 'package:forum_front/constants/app_colors.dart';
import 'package:forum_front/models/course.dart';
import 'package:forum_front/models/module.dart';
import 'package:forum_front/services/etapaService.dart';
import 'package:forum_front/services/moduleService.dart';

class ModulePage extends StatefulWidget {
  final int etapaId;

  const ModulePage({super.key, required this.etapaId});

  @override
  State<ModulePage> createState() => _ModulePageState();
}

class _ModulePageState extends State<ModulePage> {
  late Future<List<Module>> list;
  Course etapa = Course.vazio();

  @override
  void initState() {
    list = fetchModuloByEtapaAndUser(widget.etapaId);
    _handleFetchEtapa();
    super.initState();
  }

  void _handleFetchEtapa() async {
    etapa = await fetchCourseById(widget.etapaId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, "/");
          },
          child: Image(image: AssetImage("assets/logos/Euron.png"),),
        ),
      ),
      drawer: AppDrawer(),
      body: FutureBuilder(
        future: list,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }
          if (snapshot.hasData) {
            final moduleData = snapshot.data!;
            return ListView(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_sharp),
                  ),
                ),

                Container(
                  width: double.infinity,
                  height: 280,
                  color: AppColors.blue_eurofarma,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      Text("${etapa.tema}"),
                      const SizedBox(height: 4),
                      Text(
                        "${etapa.titulo}",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: AppColors.blue_claro_2,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text("${etapa.descricao}."),
                      const SizedBox(height: 48),
                      Text("CONTEÚDOS", style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
                for (int index = 0; index < moduleData.length; index++) ...[
                  Modules(module: moduleData[index], index: index),
                  const SizedBox(height: 4),
                ],
              ],
            );
          }
          return Center(child: Text("No data found."));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: ChatButton(),
    );
  }
}
