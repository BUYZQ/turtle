import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:myapp/features/auth/presentation/widgets/my_button.dart';
import 'package:myapp/features/chat/presentation/screens/chat_list_screen.dart';
import 'package:myapp/features/home/presentation/screens/home_screen.dart';
import 'package:myapp/features/home/presentation/widgets/my_app_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myapp/features/profile/presentation/screens/edit_profile_screen.dart';
import 'package:myapp/features/profile/presentation/widgets/profile_field.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? username;

  @override
  void initState() {
    getUserName();
    super.initState();
  }

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
                title: 'Профиль',
                navigate: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const HomeScreen(index: 2)),
                  );
                },
              ),
              const SizedBox(height: 30),
              Container(
                  width: 180,
                  height: 180,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 4,
                      color: Theme.of(context).colorScheme.surface,
                    ),
                  ),
                child: const Icon(Icons.person, size: 150),
              ),
              const SizedBox(height: 50),
              ProfileField(
                hint: username ?? '',
                readOnly: true,
                controller: TextEditingController(),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100),
                child: MyButton(
                  title: 'Редактировать',
                  onPressed: navigateToEditScreen,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void getUserName() async {
    final String? user = await Supabase.instance.client.auth.currentUser?.userMetadata?['name'];

    if(user != null) {
      setState(() {
        username = user;
      });
    }
  }

  void navigateToEditScreen() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const EditProfileScreen()),
    );
  }
}
