import 'package:flutter/material.dart';
import 'package:myapp/features/settings/presentation/screens/settings_screen.dart';

class MyAppBar extends StatelessWidget {
  final String title;
  final Function()? navigate;

  const MyAppBar({
    super.key,
    required this.title,
    this.navigate,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        IconButton(
          onPressed: title == 'Настройки' || title == 'Курение' ?  () {
            Navigator.pop(context);
          } : navigate,
          icon: Image.asset('assets/home/back.png'),
        ),
        const Spacer(),
        Center(
          child: Text(
            title,
            style: TextStyle(
              fontFamily: 'Champagne',
              fontSize: 50,
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.secondary,
            ),
          ),
        ),
        const Spacer(),
       title != 'Настройки' ? IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const SettingsScreen()),
            );
          },
          icon: Image.asset('assets/home/settings.png'),
        ) : const SizedBox(width: 30),
      ],
    );
  }
}
