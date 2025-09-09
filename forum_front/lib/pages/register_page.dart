import 'package:flutter/material.dart';
import 'package:forum_front/components/forms/form_button_fill.dart';
import 'package:forum_front/components/forms/form_button_outlined.dart';
import 'package:forum_front/components/forms/input_form.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 30, 33, 34),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image(image: AssetImage("assets/logos/Euron.png")),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Form(
                    child: Column(
                      children: [
                        InputForm(
                          placeholder: "E-mail",
                          iconPlace: Icons.email,
                        ),
                        SizedBox(height: 16),
                        InputForm(placeholder: "Senha", iconPlace: Icons.key),
                        SizedBox(height: 16),
                        InputForm(placeholder: "CPF", iconPlace: Icons.person),
                        SizedBox(height: 64),
                        FormButtonFill(buttonText: "Criar", navigate: "/"),
                        SizedBox(height: 16),
                        FormButtonOutlined(
                          buttonText: "Voltar",
                          navigate: "/login",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
