import 'package:flutter/material.dart';

class InputForm extends StatefulWidget {
  final String placeholder;
  final IconData iconPlace;

  const InputForm({
    super.key,
    required this.placeholder,
    required this.iconPlace,
  });

  @override
  State<InputForm> createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {

  bool visibility_password = true;
  IconData icon_visibility = Icons.visibility;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: Colors.white),
      obscureText: widget.placeholder == "Senha" ? visibility_password : false,
      decoration: InputDecoration(
        hintText: widget.placeholder,
        prefixIcon: Icon(widget.iconPlace),
        suffixIcon: widget.placeholder == "Senha"
            ? IconButton(
                onPressed: () {setState(() {
                  visibility_password = !visibility_password;
                  icon_visibility = visibility_password ? Icons.visibility : Icons.visibility_off;
                });},
                icon: Icon(icon_visibility),
              )
            : null,
        hintStyle: TextStyle(color: Colors.grey.shade600),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide(
            style: BorderStyle.solid,
            width: 8,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
