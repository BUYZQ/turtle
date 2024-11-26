import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  final String hint;
  final bool? isPassword;
  final TextEditingController controller;

  const MyTextField({
    super.key,
    required this.hint,
    this.isPassword,
    required this.controller,
  });

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {

  bool _obscureText = false;

  @override
  void initState() {
    if(widget.isPassword == true) {
      _obscureText = true;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: _obscureText,
      decoration: InputDecoration(
        hintText: widget.hint,
        filled: true,
        fillColor: const Color(0xffEDEDED),
        suffixIcon: widget.isPassword == true ?
        IconButton(
          onPressed: _showPassword,
          icon: const Icon(Icons.remove_red_eye),
        ) : const Text(''),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            width: 0,
            color: Colors.transparent,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            width: 0,
            color: Colors.transparent,
          ),
        ),
      ),
    );
  }
  void _showPassword() async {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}
