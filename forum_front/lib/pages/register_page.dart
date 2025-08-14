import 'package:flutter/material.dart';
import 'package:forum_front/components/input_form.dart';

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
                        SizedBox(
                          width: double.infinity,
                          height: 40,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 0, 240, 205),
                            ),
                            onPressed: () => {},
                            child: Text(
                              "Criar",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          height: 40,
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              textStyle: TextStyle(
                                color: Color.fromARGB(255, 0, 205, 240),
                              ),
                              side: const BorderSide(
                                color: Color.fromARGB(255, 0, 205, 240),
                                width: 2,
                              ),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, "/login");
                            },
                            child: Text(
                              "Voltar",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
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
