import 'package:flutter/material.dart';
import 'package:forum_front/components/forms/form_button_fill.dart';
import 'package:forum_front/components/forms/form_button_outlined.dart';
import 'package:forum_front/components/forms/input_form.dart';
import 'package:forum_front/constants/app_colors.dart';
import 'package:forum_front/services/authService.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey_dark,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image(image: AssetImage("assets/logos/Euron.png")),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [LoginForm()],
              ),
              SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String email = "";
  String senha = "";
  bool isLoading = false;

  Future<void> handleLogin(BuildContext context) async {
    try {
      setState(() {
        isLoading = true;
      });
      await login(email, senha);

      if (mounted) {
        Navigator.pushReplacementNamed(context, "/");
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Email ou Senha incorretos.'),
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
          SizedBox(height: 64),
          FormButtonFill(
            buttonText: "Login",
            onPressed: () {
              handleLogin(context);
            },
          ),
          SizedBox(height: 16),
          FormButtonOutlined(buttonText: "Cadastrar-se", navigate: "/register"),
        ],
      ),
    );
  }
}
