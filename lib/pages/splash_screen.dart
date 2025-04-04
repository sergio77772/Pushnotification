import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:push_notifications_1/pages/home_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      nextScreen: HomePage(),
      splash: Center(
        child: Lottie.asset('assets/animacion_splash.json'),
      ), 
      splashIconSize: 400,
      backgroundColor: Colors.white,
      duration: 1900,
      );
  }
}