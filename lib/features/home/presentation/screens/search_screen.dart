import 'package:flutter/material.dart';
import 'package:myapp/features/home/presentation/widgets/search_button.dart';
import 'package:myapp/features/home/presentation/widgets/serach_field.dart';
import 'package:myapp/features/settings/presentation/screens/settings_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  final _searchController = TextEditingController();

  List<String> titles = [
    'Курение',
    'Алкоголь',
    'Кофеин',
    'Сладкое',
    'Азартные игры',
    'Компьютерные игры',
    'Шопоголизм'
  ];

  List<Image> images = [
    Image.asset('assets/search/smoking.png'),
    Image.asset('assets/search/alcohol.png'),
    Image.asset('assets/search/coffee.png'),
    Image.asset('assets/search/desset.png'),
    Image.asset('assets/search/games.png'),
    Image.asset('assets/search/computer_games.png'),
    Image.asset('assets/search/shop.png'),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 50),
              Row(
                children: [
                  Expanded(
                    child: SearchField(
                      hint: 'Поиск категории',
                      controller: _searchController,
                    ),
                  ),
                  const SizedBox(width: 10),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const SettingsScreen()),
                      );
                    },
                    icon: Image.asset('assets/home/settings.png'),
                  ),
                ],
              ),
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
