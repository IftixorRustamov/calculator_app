import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final Color textColor;
  final void Function()? onPressed;

  const Button(
      {super.key,
      required this.text,
      required this.textColor,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(fontSize: 40, color: textColor),
      ),
    );
  }
}
