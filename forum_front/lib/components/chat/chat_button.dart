import 'package:flutter/material.dart';
import 'package:forum_front/components/chat/chat_dialog.dart';
import 'package:forum_front/constants/app_colors.dart';

class ChatButton extends StatefulWidget {
  const ChatButton({super.key});

  @override
  State<ChatButton> createState() => _ChatButtonState();
}

class _ChatButtonState extends State<ChatButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => {
        showChatDialog(context)
      },

      iconSize: 30,
      icon: Icon(Icons.message_outlined),
      color: AppColors.blue_eurofarma,
    );
  }
}
