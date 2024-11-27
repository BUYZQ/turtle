import 'package:flutter/material.dart';
import 'package:myapp/features/home/presentation/screens/home_screen.dart';
import 'package:myapp/features/home/presentation/widgets/my_app_bar.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              const SizedBox(height: 50),
              MyAppBar(
                title: 'Статистика',
                navigate: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const HomeScreen(index: 4,))
                  );
                },
              ),
              const SizedBox(height: 50),
              Card(
                color: Theme.of(context).colorScheme.primary,
                child: Container(
                  child: Row(
                    children: [
                      Image.asset('assets/home/turtle.png'),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Воодушевляющая речь',
                            style: TextStyle(
                              fontSize: 25,
                              fontFamily: 'Champagne',
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                          Text(
                            'Вы молодец, побили свой рекорд!',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Champagne',
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Image.asset('assets/home/char.png'),
            ],
          ),
        ),
      ),
    );
  }
}
