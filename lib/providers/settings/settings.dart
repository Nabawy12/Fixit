import 'package:flutter/material.dart';
import 'package:yourcolor/Utils/Shared_Prefence/SharedPrefence.dart';

class setting_Providers extends ChangeNotifier {
  ThemeMode currentTheme = ThemeMode.light;
  Locale currentLocale = Locale('en');

  setting_Providers() {
    _loadLanguagePreference();
  }

  void changeCurrentTheme(ThemeMode newTheme) {
    if (currentTheme == newTheme) return;
    currentTheme = newTheme;
    notifyListeners();
  }

  // Function to change language and save preference
  void changeLanguage(String languageCode) async {
    currentLocale = Locale(languageCode);
    await SharedPrefUtil.setString("lang", languageCode);
    notifyListeners();
  }

  // Load language preference on initialization
  Future<void> _loadLanguagePreference() async {
    String? savedLang = await SharedPrefUtil.getString("lang");
    if (savedLang != null) {
      currentLocale = Locale(savedLang);
      notifyListeners();
    }
  }
}
