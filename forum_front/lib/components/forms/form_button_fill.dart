import 'package:flutter/material.dart';

class FormButtonFill extends StatelessWidget {

  final String buttonText;
  final String navigate;

  const FormButtonFill({super.key, required this.buttonText, required this.navigate});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(255, 0, 205, 240),
        ),
        onPressed: () {
          Navigator.pushNamed(context, navigate);
        },
        child: Text(
          buttonText,
          style: TextStyle(
            color: Colors.white70,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
