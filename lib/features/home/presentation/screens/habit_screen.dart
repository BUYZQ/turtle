import 'dart:async';
import 'package:flutter/material.dart';
import 'package:myapp/features/auth/presentation/widgets/my_button.dart';
import 'package:myapp/features/home/presentation/widgets/my_app_bar.dart';
import 'package:myapp/features/home/presentation/widgets/search_button.dart';

class HabitScreen extends StatefulWidget {
  const HabitScreen({super.key});

  @override
  State<HabitScreen> createState() => _HabitScreenState();
}

class _HabitScreenState extends State<HabitScreen> {
  bool _isExpanded = false;
  bool _isTimerRunning = false;
  late Timer _timer;
  int _seconds = 0; // Переменная для отсчета времени в секундах

  // Метод для начала отсчета времени
  void _startTimer() {
    setState(() {
      _isTimerRunning = true;
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _seconds++;
      });
    });
  }

  // Метод для остановки таймера
  void _stopTimer() {
    _timer.cancel();
    setState(() {
      _isTimerRunning = false;
    });
  }

  // Метод для сброса таймера
  void _resetTimer() {
    _timer.cancel();
    setState(() {
      _seconds = 0;
      _isTimerRunning = false;
    });
  }

  // Метод для форматирования времени в дни, часы, минуты и секунды
  String _formatTime(int seconds) {
    int days = seconds ~/ (24 * 60 * 60);
    int hours = (seconds % (24 * 60 * 60)) ~/ (60 * 60);
    int minutes = (seconds % (60 * 60)) ~/ 60;
    int remainingSeconds = seconds % 60;

    return '${days.toString().padLeft(2, '0')}:${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  List<String> titles = [
    'Стоп',
    'Комментарий',
    'Начало',
  ];

  List<Image> images = [
    Image.asset('assets/home/play.png'),
    Image.asset('assets/home/message.png'),
    Image.asset('assets/home/pause.png'),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              const SizedBox(height: 50),
              const MyAppBar(title: 'Курение'),
              const SizedBox(height: 20),
              Image.asset('assets/home/smoking.png'),
              const SizedBox(height: 20),
              // Отображаем таймер
              Text(
                _formatTime(_seconds),
                style: TextStyle(
                  fontFamily: 'Champagne',
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onPrimary,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100),
                child: MyButton(
                  title: _isTimerRunning ? 'Стоп' : 'Старт',
                  onPressed: () {
                    if (_isTimerRunning) {
                      _stopTimer();
                    } else {
                      _startTimer();
                    }
                  },
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    style: TextStyle(
                      fontFamily: 'Champagne',
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.onPrimary,
                    ),
                    'История / Комментарий',
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _isExpanded = !_isExpanded;
                      });
                    },
                    icon: _isExpanded
                        ? Image.asset('assets/home/arrow_bottom.png')
                        : Image.asset('assets/home/arrow_left.png'),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              if (_isExpanded)
                Expanded(
                  child: ListView.builder(
                    itemCount: images.length,
                    itemBuilder: (context, index) {
                      final image = images[index];
                      final title = titles[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: SearchButton(
                          image: image,
                          title: title,
                          isNavigate: false,
                        ),
                      );
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
