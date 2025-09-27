import 'package:flutter/material.dart';
import 'package:forum_front/components/chat/chat_button.dart';
import 'package:forum_front/components/navigation/drawer.dart';
import 'package:forum_front/constants/app_colors.dart';
import 'package:forum_front/constants/app_font.dart';
import 'package:forum_front/models/capitulo.dart';
import 'package:forum_front/services/capituloService.dart';
import 'package:video_player/video_player.dart';

class CapituloPage extends StatefulWidget {
  final int etapaId;
  final int moduloId;

  const CapituloPage({
    super.key,
    required this.etapaId,
    required this.moduloId,
  });

  @override
  State<CapituloPage> createState() => _CapituloPageState();
}

class _CapituloPageState extends State<CapituloPage> {
  late Future<List<Capitulo>> _capitulos;
  final Map<int, VideoPlayerController> _videoControllers = {};

  @override
  void initState() {
    super.initState();
    _capitulos = fetchCapituloByModulo(widget.moduloId);
  }

  @override
  void dispose() {
    for (var controller in _videoControllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  void _initVideoController(Capitulo capitulo) {
    if (capitulo.urlVideo != null &&
        !_videoControllers.containsKey(capitulo.id)) {
      final controller = VideoPlayerController.network(capitulo.urlVideo!)
        ..initialize().then((_) => setState(() {}));
      _videoControllers[capitulo.id!] = controller;
    }
  }

  void _concluirModulo(List<Capitulo> capitulos) {
    final ids = capitulos.map((c) => c.id).toList();
    finishCapitulo(ids);
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Módulo concluído!')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: TextButton(
          onPressed: () => Navigator.pushNamed(context, "/"),
          child: Image.asset("assets/logos/Euron.png", height: 40),
        ),
      ),
      drawer: AppDrawer(),
      body: FutureBuilder<List<Capitulo>>(
        future: _capitulos,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text("Ocorreu um erro"));
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("Nenhum capítulo disponível"));
          }

          final capitulos = snapshot.data!;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var capitulo in capitulos) ...[
                  Text(
                    capitulo.titulo?.toUpperCase() ?? "",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.blue_claro_2,
                    ),
                  ),
                  const SizedBox(height: 12),

                  if (capitulo.urlImagem != null)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(capitulo.urlImagem!),
                    ),
                  if (capitulo.urlImagem != null) const SizedBox(height: 12),

                  if (capitulo.urlVideo != null)
                    Builder(
                      builder: (_) {
                        _initVideoController(capitulo);
                        final controller = _videoControllers[capitulo.id!]!;
                        if (!controller.value.isInitialized) {
                          return const SizedBox(
                            height: 200,
                            child: Center(child: CircularProgressIndicator()),
                          );
                        }
                        return AspectRatio(
                          aspectRatio: controller.value.aspectRatio,
                          child: VideoPlayer(controller),
                        );
                      },
                    ),
                  if (capitulo.urlVideo != null) const SizedBox(height: 12),

                  Text(
                    (capitulo.body ?? "").replaceAll(r'\n', '\n'),
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.6,
                      fontFamily: AppFont.public_sans,
                    ),
                  ),
                  const SizedBox(height: 24),
                ],

                // Single Concluir button at the bottom
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      textStyle: TextStyle(fontSize: 18),
                      backgroundColor: AppColors.blue_claro_1_opacity15,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                    ),
                    onPressed: () => {
                      _concluirModulo(capitulos),
                      Navigator.pushNamed(context, "/boards"),
                    },
                    child: const Text("Concluir Módulo"),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: ChatButton(),
    );
  }
}
