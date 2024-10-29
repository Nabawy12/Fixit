import 'package:flutter/material.dart';
import 'package:yourcolor/Widgets/OnBoarding/content.dart';

import '../../Utils/Colors/colors.dart';
import '../../Views/Login/login.dart';
import '../../generated/l10n.dart';

class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
  }

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
        "description": S.of(context).onbording_des_2
      },
      {
        "image": "assets/images/onboarding_1.png",
        "title": S.of(context).onbording_3,
        "description": S.of(context).onbording_des_3
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
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
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _currentPage == _onboardingData.length - 2 ||
                    _currentPage == _onboardingData.length - 1
                    ? InkWell(
                  onTap: () {
                    if (_currentPage > 0) {
                      setState(() {
                        _currentPage--;
                        _pageController.previousPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      });
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: app_Colors_Light.MainColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        color: app_Colors_Light.ICON_color,
                      ),
                    ),
                  ),
                )
                    : Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      color: app_Colors_Light.ICON_color,
                    ),
                  ),
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    _onboardingData.length,
                        (index) => _buildDot(index: index),
                  ),
                ),
                Spacer(),
                InkWell(
                  onTap: () {
                    if (_currentPage == _onboardingData.length - 1) {
                      Navigator.pushReplacementNamed(context, Login_Screen.routeName);
                    } else {
                      setState(() {
                        _pageController.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                        _currentPage++;
                      });
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: app_Colors_Light.MainColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: app_Colors_Light.ICON_color,
                      ),
                    ),
                  ),
                )
              ],
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