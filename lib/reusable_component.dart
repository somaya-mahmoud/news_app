

 import 'package:flutter/material.dart';

 Widget myTextFormField({
  required TextEditingController controller,
  TextInputType textInputType = TextInputType.text,
  required FormFieldValidator <String>? validator,
  bool passwordVisible = false,
  required IconData prefixIcon,
  Widget? suffixIcon,
  required String label,
  GestureTapCallback? onTap,
  TextInputAction? textInputAction,
   ValueChanged<String>? onFieldSubmitted
   }) {
  return TextFormField(
    onTap: onTap,
    controller: controller,
    onFieldSubmitted: onFieldSubmitted,
    keyboardType: textInputType,
    textInputAction: textInputAction,
    obscureText: passwordVisible,
    validator: validator,
    decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: label,
        prefixIcon: Icon(prefixIcon),
        suffixIcon: suffixIcon

    ),

  );
}

