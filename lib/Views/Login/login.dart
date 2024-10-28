import 'package:flutter/material.dart';
import 'package:yourcolor/Utils/Colors/colors.dart';

import '../../Utils/Elevated_Button/button.dart';

class Login_Screen extends StatelessWidget {
  static const routeName = "/Login_Screen" ;
  const Login_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:app_Colors_Light.BG_color ,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomButton(text: "Login",)
          ],
        ),
      ),
    );
  }
}
