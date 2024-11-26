import 'package:flutter/material.dart';

class SearchField extends StatefulWidget {
  final String hint;
  final TextEditingController controller;

  const SearchField({
    super.key,
    required this.hint,
    required this.controller,
  });

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: 48,
      child: TextField(
        controller: widget.controller,
        decoration: InputDecoration(
          hintText: widget.hint,
          hintStyle: TextStyle(
            fontSize: 19,
            color: theme.colorScheme.onPrimary,
          ),
          prefixIcon: Icon(
            Icons.search,
            color: theme.colorScheme.onPrimary,
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 12, // Настраиваем вертикальные отступы
            horizontal: 16, // Горизонтальные отступы
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              width: 2,
              color: theme.colorScheme.onPrimary,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              width: 2,
              color: theme.colorScheme.onPrimary,
            ),
          ),
        ),
      ),
    );
  }
}
