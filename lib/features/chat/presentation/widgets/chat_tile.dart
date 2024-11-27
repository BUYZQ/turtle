import 'package:flutter/material.dart';

class ChatTile extends StatelessWidget {
  final Image? image;
  final String title;
  final String? subtitle;

  const ChatTile({
    super.key,
    this.image,
    required this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      leading: image ?? Image.asset('assets/profile/avatar.png'),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          fontFamily: 'Champagne',
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
      subtitle: Text(
        subtitle ?? '',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: 'Champagne',
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
    );
  }
}
