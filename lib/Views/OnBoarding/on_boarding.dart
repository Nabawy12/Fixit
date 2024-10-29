import 'package:flutter/material.dart';
import '../../Widgets/OnBoarding/body.dart';


class Onboarding_Screen extends StatelessWidget {
  static const String routeName = "/onboarding";
  const Onboarding_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Onboarding(),
    );
  }
}




