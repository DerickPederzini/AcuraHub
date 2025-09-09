import 'package:flutter/material.dart';
import 'package:forum_front/constants/app_colors.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  CreatePageState createState() {
    return CreatePageState();
  }
}

class CreatePageState extends State<CreatePage> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();

  _CreatePageState() {
    _selectedVal = _sectors[0];
  }

  // Buscar futuramente do banco
  final List<String> _sectors = ['Financeiro', 'Logística', 'TI', 'Gestão'];
  String? _selectedVal;

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.text_create_page, 
                    fontWeight: FontWeight.bold
                    ),
                  'Seja bem vindo(a)!'
                ),

                SizedBox(height: 10),

                Text(
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.text_create_page, 
                    ),
                  'Nessa página você poderá criar uma postagem sobre sua ideia, seja criativo!',
                ),

                SizedBox(height: 30),
                
                DropdownButtonFormField(
                  hint: Text("Selecione o setor envolvido"),
                  value: _selectedVal,
                  items: _sectors
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedVal = value;
                    });
                  },
                ),

                SizedBox(height: 30),

                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, digite a sua ideia';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Qual é a sua ideia?",
                  ),
                ),

                SizedBox(height: 30),

                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Postagem criada')),
                      );
                    }
                  },
                  child: const Text("Enviar ideia"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
