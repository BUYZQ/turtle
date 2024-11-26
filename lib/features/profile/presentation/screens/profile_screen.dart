import 'dart:io';
import 'package:flutter/material.dart';
import 'package:myapp/features/home/presentation/widgets/my_app_bar.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              const SizedBox(height: 50),
              const MyAppBar(
                title: 'Профиль',
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
            ],
          ),
        ),
      ),
    );
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
