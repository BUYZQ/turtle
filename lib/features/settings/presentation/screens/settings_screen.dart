import 'package:flutter/material.dart';
import 'package:myapp/features/home/presentation/widgets/my_app_bar.dart';
import 'package:myapp/features/settings/presentation/widgets/settings_button.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              SizedBox(height: 50),
              const MyAppBar(
                title: 'Настройки',
              ),
              const SizedBox(height: 30),
              Text(
                'Настройки',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Champagne',
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
              const SizedBox(height: 10),
              SettingsButton(
                title: 'Тема',
                image: Image.asset('assets/settings/theme.png'),
                onTap: () {},
              ),
              SettingsButton(
                title: 'Язык',
                image: Image.asset('assets/settings/language.png'),
                onTap: () {},
              ),
              const SizedBox(height: 30),
              Text(
                'Поддержка',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Champagne',
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
              const SizedBox(height: 10),
              SettingsButton(
                title: 'Связаться с нами',
                image: Image.asset('assets/settings/message.png'),
                onTap: () {},
              ),
              SettingsButton(
                title: 'Политика конфиденциальности',
                image: Image.asset('assets/settings/security.png'),
                onTap: () {},
              ),
              const SizedBox(height: 30),
              Text(
                'Информация о приложении',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Champagne',
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
              const SizedBox(height: 10),
              SettingsButton(
                title: 'Версия приложения 1.0.0',
                image: Image.asset('assets/settings/version.png'),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
