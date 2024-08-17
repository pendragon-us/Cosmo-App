import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:lookscosmetics/dashboard/dashboard.dart';
import 'package:lookscosmetics/signin/signin.dart';
import 'package:lookscosmetics/signup/signup.dart';
import 'package:lookscosmetics/splash/splash.dart';

import 'app_lipstick/apply_lipstick.dart';
import 'apply_foundation/apply_foundation.dart';

late List<CameraDescription> _cameras;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  _cameras = await availableCameras();
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
        '/apply-foundation': (context) => const ApplyFoundation(),
        '/apply-lipstick': (context) => ApplyLipstick(cameras: _cameras,),
      },
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}
