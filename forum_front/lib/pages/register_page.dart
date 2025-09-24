import 'dart:math';

import 'package:flutter/material.dart';
import 'package:forum_front/components/forms/form_button_fill.dart';
import 'package:forum_front/components/forms/form_button_outlined.dart';
import 'package:forum_front/components/forms/input_form.dart';
import 'package:forum_front/services/authService.dart';

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
                children: [RegisterForm()],
              ),
              SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  String username = "";
  String email = "";
  String senha = "";
  String cpf = "";
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  Future<void> handleRegister(BuildContext context) async {
    if (senha.isEmpty && email.isEmpty && cpf.isEmpty && username.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Preencha todos os campos.'),
          action: SnackBarAction(label: 'Esconder', onPressed: () {}),
        ),
      );
      return;
    }

    if (senha.length < 8) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Senha deve ter ao menos 8 caracteres.'),
          action: SnackBarAction(label: 'Esconder', onPressed: () {}),
        ),
      );
      return;
    }

    try {
      setState(() {
        isLoading = true;
      });
      await registerUser(email, senha, username, cpf);
      await login(email, senha);

      if (mounted) {
        Navigator.pushReplacementNamed(context, "/");
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Cadastro inválido.'),
          action: SnackBarAction(label: 'Esconder', onPressed: () {}),
        ),
      );

      throw Exception(e);
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          InputForm(
            placeholder: "Username",
            iconPlace: Icons.person,
            onChanged: (value) {
              setState(() {
                username = value;
              });
            },
          ),
          SizedBox(height: 16),
          InputForm(
            placeholder: "E-mail",
            iconPlace: Icons.email,
            onChanged: (value) => {
              setState(() {
                email = value;
              }),
            },
          ),
          SizedBox(height: 16),
          InputForm(
            placeholder: "Senha",
            iconPlace: Icons.key,
            onChanged: (value) => {
              setState(() {
                senha = value;
              }),
            },
          ),
          SizedBox(height: 16),
          InputForm(
            placeholder: "CPF",
            iconPlace: Icons.person,
            onChanged: (value) => {
              setState(() {
                cpf = value;
              }),
            },
          ),
          SizedBox(height: 64),
          FormButtonFill(
            buttonText: "Criar",
            onPressed: isLoading ? null : () => handleRegister(context),
          ),
          SizedBox(height: 16),
          FormButtonOutlined(buttonText: "Voltar", navigate: "/login"),
        ],
      ),
    );
  }
}
