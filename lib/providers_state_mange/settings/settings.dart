import 'package:flutter/material.dart';
import 'package:yourcolor/Utils/Shared_Prefence/SharedPrefence.dart';

class setting_Providers extends ChangeNotifier {
  ThemeMode currentTheme = ThemeMode.light;
  Locale currentLocale = Locale('en');
  String user = "user";
  String currentNavigateAt = "login";

  SettingProviders() {
    loadPreferences();
  }

  void changeCurrentTheme(ThemeMode newTheme) async {
    if (currentTheme == newTheme) return;
    currentTheme = newTheme;
    await SharedPrefUtil.setString("theme", newTheme == ThemeMode.dark ? "dark" : "light");
    notifyListeners();
  }

  void changeLanguage(String languageCode) async {
    currentLocale = Locale(languageCode);
    await SharedPrefUtil.setString("lang", languageCode);
    notifyListeners();
  }

  // Public method to load theme and language preferences
  Future<void> loadPreferences() async {
    String? savedTheme = await SharedPrefUtil.getString("theme");
    String? savedLang = await SharedPrefUtil.getString("lang");

    // Set theme
    if (savedTheme != null) {
      currentTheme = savedTheme == "dark" ? ThemeMode.dark : ThemeMode.light;
    }

    // Set language
    if (savedLang != null) {
      currentLocale = Locale(savedLang);
    }

    notifyListeners();
  }

  // New method to change the user type
  void changeUserType() {
    user = (user == "user") ? "provider" : "user";  // Toggle between 'user' and 'provider'
    notifyListeners();
  }

  // New method to change the navigation state
  void changeNavigateAt() {
    currentNavigateAt = (currentNavigateAt == "login") ? "profile" : "login";  // Toggle between 'login' and 'profile'
    notifyListeners();
  }
}
