import 'dart:io';
import 'package:flutter/material.dart';
import 'package:myapp/features/auth/presentation/widgets/my_button.dart';
import 'package:myapp/features/home/presentation/screens/home_screen.dart';
import 'package:myapp/features/home/presentation/widgets/my_app_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myapp/features/profile/presentation/widgets/profile_field.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  File? image;
  String? username;
  late String email;

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();


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
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const HomeScreen(index: 3);
                  }));
                },
              ),
              const SizedBox(height: 30),
              InkWell(
                onTap: _loadImage,
                borderRadius: BorderRadius.circular(100),
                child: Container(
                  width: 180,
                  height: 180,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 4,
                      color: Theme.of(context).colorScheme.surface,
                    ),
                  ),
                  child: image == null
                      ? const Icon(Icons.person, size: 150)
                      : Padding(
                    padding: const EdgeInsets.all(6),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.file(
                        image!,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              ProfileField(
                hint: username ?? '',
                readOnly: false,
                controller: TextEditingController(),
              ),
              const SizedBox(height: 10),
              ProfileField(
                hint: email ?? '',
                readOnly: false,
                controller: TextEditingController(),
              ),
              const SizedBox(height: 10),
              ProfileField(
                hint: 'Пароль',
                readOnly: false,
                controller: TextEditingController(),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100),
                child: MyButton(
                  title: 'Сохранить',
                  onPressed: () {},
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
        email = Supabase.instance.client.auth.currentUser!.email!;
      });
    }
  }

  Future<void> _loadImage() async {
    final XFile? imageFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (imageFile != null) {
      setState(() {
        image = File(imageFile.path);
      });
    }
  }
}
