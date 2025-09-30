import 'dart:math';

import 'package:flutter/material.dart';
import 'package:forum_front/components/chat/chat_button.dart';
import 'package:forum_front/components/module/modules.dart';
import 'package:forum_front/components/navigation/drawer.dart';
import 'package:forum_front/constants/app_colors.dart';
import 'package:forum_front/constants/app_font.dart';
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
          child: Image(image: AssetImage("assets/logos/Euron.png")),
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

                // Container(
                //   width: double.infinity,
                //   height: 280,
                //   decoration: BoxDecoration(
                //     gradient: LinearGradient(
                //       begin: Alignment.topLeft,
                //       end: Alignment.bottomRight,
                //       colors: [AppColors.blue_claro_1, AppColors.blue_claro_2],
                //     ),
                //   ),
                // ),
                Container(
                  width: double.infinity,
                  height: 280,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("${etapa.urlImagem}"),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 12,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 12),
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 6,
                          horizontal: 12,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.cinza_escuro_3,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          "${etapa.tema}",
                          style: TextStyle(fontFamily: AppFont.public_sans),
                        ),
                      ),
                      // const SizedBox(height: 4),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 48,
                          horizontal: 0,
                        ),
                        child: Column(
                          children: [
                            Text(
                              "${etapa.titulo}",
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: AppColors.blue_claro_2,
                                fontFamily: AppFont.public_sans,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              "${etapa.descricao}.",
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: AppFont.public_sans,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 16),
                          ],
                        ),
                      ),

                      // const SizedBox(height: 48),
                      Text(
                        "CONTEÚDOS",
                        style: TextStyle(
                          fontFamily: AppFont.public_sans,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                for (int index = 0; index < moduleData.length; index++) ...[
                  Modules(module: moduleData[index], index: index),
                  const SizedBox(height: 18),
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
