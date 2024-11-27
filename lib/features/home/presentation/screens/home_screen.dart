import 'package:flutter/material.dart';
import 'package:myapp/features/calendar/presentation/screens/calendar_list.dart';
import 'package:myapp/features/chat/presentation/screens/chat_list_screen.dart';
import 'package:myapp/features/home/presentation/screens/search_screen.dart';
import 'package:myapp/features/home/presentation/screens/statistics_screen.dart';
import 'package:myapp/features/profile/presentation/screens/profile_screen.dart';
import 'package:myapp/features/settings/presentation/screens/settings_screen.dart';

class HomeScreen extends StatefulWidget {
  final int? index;

  const HomeScreen({super.key, this.index});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 4;

  final List<Widget> screens = [
    const StatisticsScreen(),
    const CalendarList(),
    const ChatListScreen(),
    const ProfileScreen(),
    const SearchScreen(), // Search
  ];

  @override
  void initState() {
    _currentIndex = widget.index ?? 4;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: screens[_currentIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        width: 70,
        height: 70,
        child: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          elevation: 0,
          onPressed: () {
            setState(() {
              _currentIndex = 4;
            });
          },
          child: _currentIndex == 4
              ? Image.asset('assets/bottom_nav_icons/home_active.png')
              : Image.asset('assets/bottom_nav_icons/home.png')
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex < 4 ? _currentIndex : 0,
        onTap: toggleScreen,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).colorScheme.primary,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: _currentIndex == 0
                ? Image.asset('assets/bottom_nav_icons/chart_active.png')
                : Image.asset('assets/bottom_nav_icons/chart.png'),
            label: 'Chart',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(right: 50),
              child: _currentIndex == 1
                  ? Image.asset('assets/bottom_nav_icons/calendar_active.png')
                  : Image.asset('assets/bottom_nav_icons/calendar.png'),
            ),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(left: 50),
              child: _currentIndex == 2
                  ? Image.asset('assets/bottom_nav_icons/message_active.png')
                  : Image.asset('assets/bottom_nav_icons/message.png'),
            ),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 3
                ? Image.asset('assets/bottom_nav_icons/person_active.png')
                : Image.asset('assets/bottom_nav_icons/person.png'),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  void toggleScreen(int value) {
    setState(() {
      _currentIndex = value;
    });
  }
}
