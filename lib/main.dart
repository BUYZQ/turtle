import 'package:flutter/material.dart';
import 'package:myapp/app.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://idjzhwmfykmlcoyhasgx.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imlkanpod21meWttbGNveWhhc2d4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzI1OTAzMDEsImV4cCI6MjA0ODE2NjMwMX0.Sj9XFle06Vs0pqYrS-ALTNlP9qYOpSaKqAuQD0l4LTo',
  );
  runApp(const MyApp());
}
