import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final bool obsCureText;
  final String obsCharacter;
  final String hintText;
  final String? Function(String?) validator;
  final Function(String?) onSaved;
  const CustomFormField({
    super.key,
    this.obsCureText = false,
    this.obsCharacter = "*",
    required this.hintText,
    required this.validator,
    required this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        obscureText: obsCureText,
        obscuringCharacter: obsCharacter,
        decoration: InputDecoration(hintText: hintText),
        validator: validator,
        onSaved: onSaved,
      ),
    );
  }
}
