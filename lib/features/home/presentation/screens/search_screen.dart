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
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return const Padding(
                      padding: EdgeInsets.only(bottom: 30),
                      child: SearchButton(),
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
