import 'package:flutter/material.dart';
import 'Utils/Colors/colors.dart';
import 'generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class OnboardingScreen extends StatefulWidget {
  static const String routeName = "/onboarding";

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  Locale _appLocale = Locale('en');

  void _changeLanguage(String languageCode) {
    setState(() {
      _appLocale = Locale(languageCode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Onboarding',
      locale: _appLocale,
      supportedLocales: [
        Locale('en'), // English
        Locale('ar'), // Arabic
      ],
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: Onboarding(changeLanguage: _changeLanguage),
    );
  }
}

class Onboarding extends StatefulWidget {
  final void Function(String languageCode) changeLanguage;

  Onboarding({required this.changeLanguage});

  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> _onboardingData = [
      {
        "image": "assets/images/onboarding_1.png",
        "title": S.of(context).onbording_1,
        "description": S.of(context).onbording_des_1,
      },
      {
        "image": "assets/images/onboarding_1.png",
        "title": S.of(context).onbording_2,
        "description": S.of(context).onbording_des_2,
      },
      {
        "image": "assets/images/onboarding_1.png",
        "title": S.of(context).onbording_3,
        "description": S.of(context).onbording_des_3,
      },
    ];

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: _onboardingData.length,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              itemBuilder: (context, index) {
                return OnboardingPage(
                  image: _onboardingData[index]["image"]!,
                  title: _onboardingData[index]["title"]!,
                  description: _onboardingData[index]["description"]!,
                  changeLanguage: widget.changeLanguage,
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _onboardingData.length,
                  (index) => _buildDot(index: index),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                if (_currentPage == _onboardingData.length - 1) {
                  // Go to home screen or next section
                } else {
                  _pageController.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.ease,
                  );
                }
              },
              child: Text(
                  _currentPage == _onboardingData.length - 1 ? "Get Started" : "Next"),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDot({required int index}) {
    return Container(
      height: 8,
      width: _currentPage == index ? 24 : 8,
      margin: EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: _currentPage == index ? app_Colors_Light.MainColor : Colors.grey,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final void Function(String languageCode) changeLanguage;

  const OnboardingPage({
    required this.image,
    required this.title,
    required this.description,
    required this.changeLanguage,
  });

  @override
  Widget build(BuildContext context) {
    String _selectedLanguage = 'EN';
    final Map<String, String> _languages = {
      'EN': 'assets/images/En_Flag.png',
      'AR': 'assets/images/Ar_Flag.png',
    };

    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: Row(
              children: [
                DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _selectedLanguage,
                    icon: Icon(Icons.arrow_drop_down, color: Colors.black),
                    onChanged: (String? newValue) {
                      _selectedLanguage = newValue!;
                      String languageCode = _selectedLanguage == 'EN' ? 'en' : 'ar';
                      changeLanguage(languageCode);
                    },
                    items: _languages.keys.map((String languageCode) {
                      return DropdownMenuItem<String>(
                        value: languageCode,
                        child: Row(
                          children: [
                            Image.asset(
                              _languages[languageCode]!,
                              width: 24,
                              height: 24,
                            ),
                            SizedBox(width: 8),
                            Text(
                              languageCode,
                              style: TextStyle(color: Colors.black, fontSize: 16),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
                Spacer(),
                Text(S.of(context).SKIP),
              ],
            ),
          ),
          Image.asset(image, height: 300),
          SizedBox(height: 20),
          Column(
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Text(
                  description,
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
