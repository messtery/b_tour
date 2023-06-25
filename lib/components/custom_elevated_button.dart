import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final Function() onPressed;
  final String text;

  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF1CE6CD),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.0),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xFF785FE9),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
