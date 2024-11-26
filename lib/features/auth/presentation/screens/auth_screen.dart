import 'package:flutter/material.dart';
import 'package:myapp/features/auth/presentation/screens/login_screen.dart';
import 'package:myapp/features/auth/presentation/screens/register_screen.dart';
import 'package:myapp/features/home/presentation/screens/home_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {

  bool _isLogin = true;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Supabase.instance.client.auth.onAuthStateChange,
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if(!snapshot.hasData) {
          return const Center(child: Text('Happen any error'));
        }

        final data = snapshot.data;
        if(data!.session != null) {
          return const HomeScreen();
        } else {
          if(_isLogin) {
            return LoginScreen(toggleScreen: toggleScreen);
          } else {
            return RegisterScreen(toggleScreen: toggleScreen);
          }
        }
      },
    );
  }

  void toggleScreen() {
    setState(() {
      _isLogin = !_isLogin;
    });
  }
}
