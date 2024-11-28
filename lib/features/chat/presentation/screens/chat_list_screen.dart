import 'package:flutter/material.dart';
import 'package:myapp/features/chat/presentation/widgets/chat_tile.dart';
import 'package:myapp/features/home/presentation/screens/home_screen.dart';
import 'package:myapp/features/home/presentation/widgets/my_app_bar.dart';
import 'package:myapp/features/settings/presentation/screens/settings_screen.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                leading: IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const HomeScreen(index: 1)),
                    );
                  },
                  icon: Image.asset('assets/home/back.png'),
                ),
                title: Text(
                  'Общение',
                  style: TextStyle(
                    fontFamily: 'Champagne',
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                actions: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const SettingsScreen()),
                      );
                    },
                    icon: Image.asset('assets/home/settings.png'),
                  ),
                ],
                pinned: true,
              ),
              SliverToBoxAdapter(
                child: Card(
                  color: Theme.of(context).colorScheme.primary,
                  child: Container(
                    width: double.infinity,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            'Консультации со специалистами',
                            style: TextStyle(
                              fontSize: 40,
                              fontFamily: 'Champagne',
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 12, right: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Image.asset('assets/home/turtle.png'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                    const ChatTile(
                      title: 'Маша',
                      subtitle: 'Маша, с вами приятно общ...',
                    ),
                    const ChatTile(
                      title: 'Андрей',
                      subtitle: 'Поздоровайтесь с Андреем!',
                    ),
                    const ChatTile(
                      title: 'Коля',
                      subtitle: 'Поздоровайтесь с Колей!',
                    ),
                    const ChatTile(
                      title: 'Виталя',
                      subtitle: 'Поздоровайтесь с Виталей!',
                    ),
                    const ChatTile(
                      title: 'Катя',
                      subtitle: 'Поздоровайтесь с Катей',
                    ),
                  const ChatTile(
                    title: 'Миша',
                    subtitle: 'Поздоровайтесь с Мишей!',
                  ),
                  const ChatTile(
                    title: 'Андрей',
                    subtitle: 'Поздоровайтесь с Андреем!',
                  ),
                  const ChatTile(
                    title: 'Никита',
                    subtitle: 'Поздоровайтесь с Никитой',
                  ),
                  ],
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(height: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
