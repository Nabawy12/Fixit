import 'package:flutter/material.dart';
import 'package:yourcolor/Views/Splash/splash.dart';
import 'Views/Login/login.dart';
import 'Views/OnBoarding/on_boarding.dart';
import 'generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'dart:ui' as ui;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: Locale("ar"),
      supportedLocales: [
        Locale('en'),
        Locale('ar'),
      ],
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      routes: {
        Splash_Screen.routeName: (_) =>  Splash_Screen(),
        Onboarding_Screen.routeName: (_) =>  Onboarding_Screen(),
        Login_Screen.routeName: (_) =>  Login_Screen(),
      },
      initialRoute: Splash_Screen.routeName,

    );
  }
}

