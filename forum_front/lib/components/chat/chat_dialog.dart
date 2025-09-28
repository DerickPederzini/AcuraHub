import 'package:flutter/material.dart';
import 'package:forum_front/components/chat/chat_message.dart';
import 'package:forum_front/constants/app_colors.dart';
import 'package:forum_front/models/chat.dart';
import 'package:forum_front/services/chatService.dart';

class ChatDialog extends StatefulWidget {
  const ChatDialog({super.key});

  @override
  State<ChatDialog> createState() => _ChatDialogState();
}

class _ChatDialogState extends State<ChatDialog> {
  final TextEditingController _controller = TextEditingController();
  final List<Widget> _messages = [];

  void _addMessage() async {
    if (_controller.text.trim().isEmpty) return;

    setState(() {
      _messages.add(ChatMessage(message: _controller.text.trim(), isMe: true));
    });

    try {
      Chat answer = await postMessage(_controller.text);

      setState(() {
        _messages.add(
          ChatMessage(
            message: answer.answer.toString(),
            isMe: false,
          ),
        );
      });
    } catch (e) {
      setState(() {
        _messages.add(ChatMessage(message: "Erro: $e", isMe: false));
      });
    }

    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Material(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.85,
          width: MediaQuery.of(context).size.width * 0.9,
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              AppBar(
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                title: const Text("ChatBot"),
                centerTitle: true,
              ),

              Expanded(
                child: ListView.builder(
                  itemCount: _messages.length,
                  itemBuilder: (context, index) {
                    return _messages[index];
                  },
                  scrollDirection: Axis.vertical,
                ),
              ),

              SafeArea(
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          hintText: "Digite sua mensagem...",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      icon: const Icon(Icons.send),
                      onPressed: () {
                        _addMessage();
                      },
                      color: AppColors.blue_claro_2,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void showChatDialog(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: "Fechar",
    pageBuilder: (context, anim1, anim2) {
      return const ChatDialog();
    },
    transitionBuilder: (context, anim1, anim2, child) {
      return SlideTransition(
        position: Tween(
          begin: const Offset(0, 1),
          end: Offset.zero,
        ).animate(anim1),
        child: child,
      );
    },
    transitionDuration: const Duration(milliseconds: 300),
  );
}
