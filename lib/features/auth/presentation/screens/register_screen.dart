import 'package:flutter/material.dart';
import 'package:myapp/features/auth/data/auth_repository.dart';
import 'package:myapp/features/auth/presentation/widgets/my_button.dart';
import 'package:myapp/features/auth/presentation/widgets/my_text_field.dart';
import 'package:myapp/features/home/presentation/screens/home_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RegisterScreen extends StatefulWidget {
  final Function() toggleScreen;

  const RegisterScreen({
    super.key,
    required this.toggleScreen,
  });

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final _nameController = TextEditingController();
  final _surnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final _authRepository = AuthRepository();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Регистрация',
              style: TextStyle(
                fontFamily: 'Champagne',
                color: theme.colorScheme.secondary,
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 50),
            MyTextField(
              hint: 'Имя',
              controller: _nameController,
            ),
            const SizedBox(height: 10),
            MyTextField(
              hint: 'Email',
              controller: _emailController,
            ),
            const SizedBox(height: 10),
            MyTextField(
              isPassword: true,
              hint: 'Пароль',
              controller: _passwordController,
            ),
            const SizedBox(height: 10),
            MyTextField(
              isPassword: true,
              hint: 'Повторите пароль',
              controller: _confirmPasswordController,
            ),
            const SizedBox(height: 10),
            MyButton(
              title: 'Зарегистрироваться',
              onPressed: _signUp,
            ),
            const SizedBox(height: 30),
            Text(
              'Уже зарегистрированны?',
              style: TextStyle(
                fontFamily: 'Champagne',
                color: theme.colorScheme.onPrimary,
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            InkWell(
              onTap: widget.toggleScreen,
              child: Text(
                'Вход',
                style: TextStyle(
                  fontFamily: 'Champagne',
                  color: theme.colorScheme.secondary,
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _signUp() async {
    final name = _nameController.text;
    final surname = _surnameController.text;
    final email = _emailController.text;
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;

    if(name.isEmpty || surname.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Заполните все поля')),
      );
      return;
    }
    
    if(password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Пароли не совпадают')),
      );
    }

    User? data = await _authRepository.signUpWithEmailAndPassword(name, surname, email, password);

    if(data != null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('При регистрации произошла ошибка'))
      );
    }
  }
}
