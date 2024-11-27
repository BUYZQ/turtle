import 'package:flutter/material.dart';

class ProfileField extends StatelessWidget {
  final String hint;
  final bool readOnly;
  final TextEditingController controller;

  const ProfileField({
    super.key,
    required this.hint,
    required this.readOnly,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      readOnly: readOnly,
      decoration: InputDecoration(
        fillColor: Theme.of(context).colorScheme.secondaryContainer,
        filled: true,
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.black),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
        ),
      ),
    );
  }
}
