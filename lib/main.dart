import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yourcolor/Views/Splash/splash.dart';
import 'Views/Login/login.dart';
import 'Views/OnBoarding/on_boarding.dart';
import 'Widgets/ForgetPassword/ForgetPassword.dart';
import 'generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'dart:ui' as ui;

import 'providers/settings/settings.dart';

void main() {
  runApp( ChangeNotifierProvider(
      create: (context) =>  setting_Providers(),
      child: MyApp()
  )
  );
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<setting_Providers>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: provider.currentTheme,
      locale: provider.currentLocale,
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
        Forget_Password_Screen.routeName: (_) =>  Forget_Password_Screen(),
      },
      initialRoute: Splash_Screen.routeName,

    );
  }
}

