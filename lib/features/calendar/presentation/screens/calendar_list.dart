import 'package:flutter/material.dart';
import 'package:myapp/features/home/presentation/widgets/my_app_bar.dart';

class CalendarList extends StatelessWidget {
  const CalendarList({super.key});

  @override
  Widget build(BuildContext context) {
    // Начинаем с ноября 2024 года
    int year = 2024;
    int month = 11; // Ноябрь

    // Список месяцев
    List<String> months = [
      'Январь', 'Февраль', 'Март', 'Апрель', 'Май', 'Июнь',
      'Июль', 'Август', 'Сентябрь', 'Октябрь', 'Ноябрь', 'Декабрь'
    ];

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              const SizedBox(height: 50),
              const MyAppBar(title: 'Календарь'),
              const SizedBox(height: 20),
              // Сетка для отображения месяцев с ноября 2024 года
              Expanded(
                child: ListView.builder(
                  itemCount: 12,
                  itemBuilder: (context, index) {
                    int currentMonth = (month + index - 1) % 12 + 1; // расчет месяца с учетом года
                    int currentYear = year + ((month + index - 1) ~/ 12); // определяем год
                    String monthName = months[currentMonth - 1]; // название месяца

                    // Получаем количество дней в текущем месяце
                    DateTime firstDayOfMonth = DateTime(currentYear, currentMonth, 1);
                    int daysInMonth = DateTime(currentYear, currentMonth + 1, 0).day;

                    // Составляем список дней месяца
                    List<int?> calendarDays = List.generate(
                      firstDayOfMonth.weekday - 1, // пустые ячейки перед первым днем
                          (index) => null,
                    )
                      ..addAll(List.generate(daysInMonth, (index) => index + 1));

                    return Card(
                      color: Theme.of(context).colorScheme.surface,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '$monthName $currentYear',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                            const SizedBox(height: 10),
                            // Календарь для текущего месяца
                            GridView.builder(
                              shrinkWrap: true, // не занимает всё пространство
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 7, // 7 дней недели
                                childAspectRatio: 1.0, // ячейки квадратные
                              ),
                              itemCount: calendarDays.length,
                              itemBuilder: (context, dayIndex) {
                                final day = calendarDays[dayIndex];

                                if (day == null) {
                                  return Container(); // пустая ячейка
                                }

                                return Card(
                                  color: Theme.of(context).colorScheme.surface,
                                  child: Center(
                                    child: Text(
                                      '$day',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).colorScheme.primary,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
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
