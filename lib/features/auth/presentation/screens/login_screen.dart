import 'package:flutter/material.dart';
import 'package:myapp/features/auth/data/auth_repository.dart';
import 'package:myapp/features/auth/presentation/widgets/my_button.dart';
import 'package:myapp/features/auth/presentation/widgets/my_text_field.dart';
import 'package:myapp/features/home/presentation/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  final Function()? toggleScreen;
  
  const LoginScreen({
    super.key,
    this.toggleScreen,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _authRepository = AuthRepository();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Вход',
              style: TextStyle(
                fontFamily: 'Champagne',
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.secondary,
              ),
            ),
            const SizedBox(height: 50),
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
            MyButton(
              title: 'Войти',
              onPressed: _signIn,
            ),
            const SizedBox(height: 30),
            Text(
              'Ещё не зарегистрированны?',
              style: TextStyle(
                fontFamily: 'Champagne',
                fontSize: 19,
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.onPrimary,
              ),
            ),
            const SizedBox(height: 10),
            InkWell(
              onTap: widget.toggleScreen,
              child: Text(
                'Регистрация',
                style: TextStyle(
                  fontFamily: 'Champagne',
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.secondary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _signIn() async {
    final email = _emailController.text;
    final password = _passwordController.text;

    final data = await _authRepository.signInWithEmailAndPassword(email, password);

    if(data != null ){
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('При авторизации произошла ошибка'))
      );
    }
  }
}
