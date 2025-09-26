import 'package:flutter/material.dart';
import 'package:forum_front/constants/app_font.dart';

class FormButtonFill extends StatelessWidget {

  final String buttonText;
final VoidCallback? onPressed;
  const FormButtonFill({super.key, required this.buttonText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(255, 0, 205, 240),
        ),
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: TextStyle(
            fontFamily: AppFont.public_sans,
            color: Colors.white70,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
