import 'package:flutter/material.dart';
import 'package:myapp/features/start_app/start_app.dart';
import 'package:myapp/theme/theme.dart';
import 'package:provider/provider.dart';
import 'package:myapp/theme/toggle_theme.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Provider.of<ToggleTheme>(context).currentTheme,
      home: const StartApp(),
    );
  }
}

