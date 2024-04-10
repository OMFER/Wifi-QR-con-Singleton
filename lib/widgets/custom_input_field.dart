import 'dart:ffi';

import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {

  final String? labelText;
  final IconButton? suffixIcon;
  final IconData? icon;
  final bool obscureText;
  
  final String formProperty;
  final Map<String, dynamic> formValues;
  final Function validator;

  const CustomInputField({
    super.key,
    this.labelText,
    this.suffixIcon,
    required this.formProperty,
    required this.formValues,
    this.icon, 
    this.obscureText = false,
    required this.validator,
    }
    );



  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) => validator(value),
      onChanged: (value) => formValues[formProperty] = value,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText:labelText,
        suffixIcon: suffixIcon,
        icon: icon == null ? null : Icon(icon),
      ),
    );
  }

}