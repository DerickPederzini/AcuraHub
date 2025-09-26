import 'package:flutter/material.dart';
import 'package:forum_front/constants/app_font.dart';

class InputForm extends StatefulWidget {
  final String placeholder;
  final IconData iconPlace;
  final ValueChanged<String>? onChanged;

  const InputForm({
    super.key,
    required this.placeholder,
    required this.iconPlace,
    required this.onChanged
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
      onChanged: widget.onChanged,
      style: const TextStyle(color: Colors.white, fontFamily: AppFont.public_sans),
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
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(
            style: BorderStyle.solid,
            width: 1,
            color: Colors.white60
          )
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(
            style: BorderStyle.solid,
            width: 1,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
