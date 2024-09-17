import 'package:flutter/material.dart';

import '../button.dart';

class ButtonsField extends StatelessWidget {
  final int flex;
  final Function(String) onCharacterPressed;
  final VoidCallback onClear;
  final VoidCallback onEqualPressed;

  const ButtonsField({
    super.key,
    required this.flex,
    required this.onCharacterPressed,
    required this.onClear,
    required this.onEqualPressed,
  });

  @override
  Widget build(BuildContext context) {
    const List<String> buttons = [
      'C', '(', ')', '/',
      '7', '8', '9', 'x',
      '4', '5', '6', '-',
      '1', '2', '3', '+',
      '0', '.', '=', '%'
    ];

    return Expanded(
      flex: flex,
      child: Container(
        color: Colors.white,
        child: GridView.builder(
          itemCount: buttons.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
          ),
          itemBuilder: (BuildContext context, int index) {
            if (buttons[index] == 'C') {
              return Button(
                onPressed: onClear,
                text: buttons[index],
                textColor: Colors.red,
              );
            } else if (buttons[index] == '=') {
              return Button(
                onPressed: onEqualPressed,
                text: buttons[index],
                textColor: Colors.red,
              );
            } else {
              return Button(
                onPressed: () => onCharacterPressed(buttons[index]),
                text: buttons[index],
                textColor: Colors.black,
              );
            }
          },
        ),
      ),
    );
  }
}
