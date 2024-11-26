import 'package:flutter/material.dart';
import 'package:myapp/features/auth/presentation/screens/auth_screen.dart';

class StartApp extends StatefulWidget {
  const StartApp({super.key});

  @override
  State<StartApp> createState() => _StartAppState();
}

class _StartAppState extends State<StartApp> {

  @override
  void initState() {
    nextScreen();
    super.initState();
  }

  Future<void> nextScreen() async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const AuthScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/logo/logo.png'),
      ),
    );
  }
}