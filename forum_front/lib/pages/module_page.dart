import 'package:flutter/material.dart';
import 'package:forum_front/components/module/modules.dart';
import 'package:forum_front/components/navigation/drawer.dart';
import 'package:forum_front/models/module.dart';
import 'package:forum_front/services/moduleService.dart';

class ModulePage extends StatefulWidget {
  final int etapaId;

  const ModulePage({super.key, required this.etapaId});

  @override
  State<ModulePage> createState() => _ModulePageState();
}

class _ModulePageState extends State<ModulePage> {
  late Future<List<Module>> list;

  @override
  void initState() {
    list = fetchModuloByEtapa(widget.etapaId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, "/");
          },
          child: Image(image: AssetImage("assets/logos/Euron.png")),
        ),
      ),

      drawer: AppDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_sharp),
          ),
          Expanded(
            child: FutureBuilder(
              future: list,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Text("Error: ${snapshot.error}");
                }
                if (snapshot.hasData) {
                  final moduleData = snapshot.data!;
                  return ListView.separated(
                    itemCount: moduleData.length,
                    itemBuilder: (context, index) {
                      return Modules(module: moduleData[index], index: index);
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 4);
                    },
                  );
                }
                return Text("Sucks");
              },
            ),
          ),
        ],
      ),
    );
  }
}
