import 'dart:developer';

import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepository {
  final SupabaseClient _supabase = Supabase.instance.client;

  // User register
  Future<User?> signUpWithEmailAndPassword(
    String name,
    String surname,
    String email,
    String password,
  ) async {
    try {
      final response = await _supabase.auth.signUp(
        email: email,
        password: password,
        data: {
          'name': name,
          'surname': surname,
        },
      );

      final User? user = response.user;

      if (user != null) {
        return user;
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  // User login
  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    try {
      final response = await _supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

      final user = response.user;

      if (user != null) {
        return user;
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<void> signOut() async {
    await _supabase.auth.signOut();
  }
}
