import 'package:flutter/material.dart';

class SettingsButton extends StatelessWidget {
  final String title;
  final Image image;
  final Function() onTap;

  const SettingsButton({
    super.key,
    required this.title,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 50,
        child: Row(
          children: [
            image,
            const SizedBox(width: 10),
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Champagne',
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
