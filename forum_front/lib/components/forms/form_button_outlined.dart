import 'package:flutter/material.dart';
import 'package:forum_front/constants/app_font.dart';

class FormButtonOutlined extends StatelessWidget {
  final String buttonText;
  final String navigate;

  const FormButtonOutlined({
    super.key,
    required this.buttonText,
    required this.navigate,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          textStyle: TextStyle(
            color: Color.fromARGB(255, 0, 205, 240),
            fontFamily: AppFont.public_sans,
          ),
          side: const BorderSide(
            color: Color.fromARGB(255, 0, 205, 240),
            width: 2,
          ),
        ),
        onPressed: () {
          Navigator.pushNamed(context, navigate);
        },
        child: Text(
          buttonText,
          style: TextStyle(
            color: Color.fromARGB(255, 0, 205, 240),
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
