import 'package:flutter/material.dart';
import 'package:myapp/features/home/presentation/widgets/my_app_bar.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              SizedBox(height: 50),
              MyAppBar(
                title: 'Статистика',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
