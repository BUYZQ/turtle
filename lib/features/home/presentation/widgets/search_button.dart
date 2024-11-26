import 'package:flutter/material.dart';
import 'package:myapp/features/home/presentation/screens/habit_screen.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      color: theme.colorScheme.secondaryContainer,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(100),
        bottomLeft: Radius.circular(100),
        topRight: Radius.circular(15),
        bottomRight: Radius.circular(15),
      ),
      child: InkWell(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(100),
          bottomLeft: Radius.circular(100),
          topRight: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const HabitScreen()),
          );
        },
        child: Container(
          width: double.infinity,
          height: 65,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(100),
              bottomLeft: Radius.circular(100),
              topRight: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
          ),
        ),
      ),
    );
  }
}
