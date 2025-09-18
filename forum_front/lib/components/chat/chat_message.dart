import 'package:flutter/material.dart';
import 'package:forum_front/constants/app_colors.dart';

class ChatMessage extends StatelessWidget {
  final String message;
  final bool isMe;

  const ChatMessage({super.key, required this.message, required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        decoration: BoxDecoration(
          color: isMe ? AppColors.text_message_me : AppColors.grey_dark,
          borderRadius: isMe
              ? BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                )
              : BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
        ),
        child: Text(message),
      ),
    );
  }
}
