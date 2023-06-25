import 'package:flutter/material.dart';

class CustomLinkText extends StatelessWidget {
  final String text;

  const CustomLinkText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: text,
        style: const TextStyle(
          color: Color(0xFF1CE6CD),
          decoration: TextDecoration.underline,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
