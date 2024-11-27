import 'package:flutter/material.dart';
import 'package:myapp/theme/theme.dart';

class ToggleTheme extends ChangeNotifier {
  bool isLight = true; // По умолчанию светлая тема

  ThemeData get currentTheme => isLight ? lightMode : darkMode;

  void toggleTheme() {
    isLight = !isLight; // Переключаем значение
    notifyListeners(); // Уведомляем подписчиков
  }
}
