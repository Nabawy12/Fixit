import 'package:flutter/material.dart';

import '../OnBoarding/on_boarding.dart';

class Splash_Screen extends StatefulWidget {
  static const String routeName = "/";
  const Splash_Screen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<Splash_Screen> {
  @override
  void initState() {
    super.initState();
    // Navigate to onboarding screen after a 2-second delay
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, Onboarding_Screen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/Splash.png"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
