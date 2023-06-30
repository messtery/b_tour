import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final Icon prefixIcon;
  final String hintText;
  final bool? obscureText;
  final TextEditingController? controller;

  const CustomTextField({
    super.key,
    required this.prefixIcon,
    required this.hintText,
    this.obscureText,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText ?? false,
      obscuringCharacter: '*',
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        prefixIconColor: const Color(0xFF6369E8),
        filled: true,
        fillColor: const Color(0xFFD9D9D9),
        contentPadding: const EdgeInsets.all(1.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9),
        ),
        hintText: hintText,
        hintStyle: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
