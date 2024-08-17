import 'package:flutter/material.dart';
import 'package:lookscosmetics/dashboard/dashboard.dart';
import 'package:lookscosmetics/signin/signin.dart';
import 'package:lookscosmetics/signup/signup.dart';
import 'package:lookscosmetics/splash/splash.dart';

import 'app_lipstick/apply_lipstick.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/signin': (context) => const SignIn(),
        '/signup': (context) => const Signup(),
        '/dashboard': (context) => const Dashboard(),
        '/apply-lipstick': (context) => const ApplyLipstick(),
      },
      debugShowCheckedModeBanner: false,
      home: ApplyLipstick(),
    );
  }
}
