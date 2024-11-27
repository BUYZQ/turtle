import 'package:flutter/material.dart';
import 'package:myapp/features/home/presentation/screens/habit_screen.dart';
import 'package:myapp/features/home/presentation/widgets/border_radius.dart';
import 'package:myapp/features/home/presentation/widgets/card_data.dart';

class SearchButton extends StatelessWidget {
  final Image image;
  final String title;
  final bool? isNavigate;

  const SearchButton({
    super.key,
    required this.image,
    required this.title,
    this.isNavigate = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      color: theme.colorScheme.primary,
      borderRadius: borderRadius,
      child: InkWell(
        borderRadius: borderRadius,
        onTap: () {
          if(isNavigate == true) {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const HabitScreen()),
            );
          }
        },
        child: Card(
          color: theme.colorScheme.primary,
          elevation: 2,
          shape: const RoundedRectangleBorder(
            borderRadius: borderRadius,
          ),
          child: Container(
            width: double.infinity,
            height: 65,
            decoration: const BoxDecoration(
              borderRadius: borderRadius,
            ),
            child: CardData(
              image: image,
              title: title,
              subtitle: '00:00:00:00',
            ),
          ),
        ),
      ),
    );
  }
}
