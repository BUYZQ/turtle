import 'package:flutter/material.dart';

class CardData extends StatelessWidget {
  final Image image;
  final String title;
  final String subtitle;

  const CardData({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        image,
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 25,
                fontFamily: 'Champagne',
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.secondary,
              ),
            ),
            Row(
              children: [
                Image.asset('assets/search/play.png'),
                const SizedBox(width: 10),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Champagne',
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.onPrimary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
