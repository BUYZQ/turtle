import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String title;
  final Function()? onPressed;

  const MyButton({
    super.key,
    required this.title,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: theme.colorScheme.surface,
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 19,
            fontFamily: 'Champagne',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
