import 'package:flutter/material.dart';
import 'package:myapp/features/start_app/start_app.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.white,
          scrolledUnderElevation: 0
        ),
        scaffoldBackgroundColor: Colors.white,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff8CC63E),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )
          )
        ),
        colorScheme: const ColorScheme.light(
          primary: Colors.white,
          onPrimary: Color(0xff14471E),
          surface: Color(0xff8CC63E),
          secondary: Color(0xffEE9B01),
          secondaryContainer: Color(0xffD9D9D9),
          inversePrimary: Colors.black,
        ),
        useMaterial3: true,
      ),
      home: const StartApp(),
    );
  }
}

