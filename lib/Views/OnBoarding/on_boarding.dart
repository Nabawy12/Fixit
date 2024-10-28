import 'package:flutter/material.dart';
import 'package:yourcolor/Views/Login/login.dart';

import '../../Utils/Colors/colors.dart';
import '../../generated/l10n.dart';

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

class Onboarding extends StatefulWidget {

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
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _currentPage == _onboardingData.length -2 || _currentPage == _onboardingData.length -1 ?
                InkWell(
                  overlayColor: WidgetStatePropertyAll(Colors.white),
                  enableFeedback: false,
                  onTap: () {
                    if(_currentPage == _onboardingData.length){

                    }else{
                      setState(() {
                        _currentPage--;
                        _pageController.jumpToPage(_currentPage);
                      });
                    }
                  },
                  child: Container(
                    alignment:Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:  app_Colors_Light.mainColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.arrow_back_ios_new,color: app_Colors_Light.ICON_color,),
                    ),
                  ),
                ) :
                Container(
                  alignment:Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:  Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.arrow_back_ios_new,color: app_Colors_Light.ICON_color,),
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
                  overlayColor: WidgetStatePropertyAll(Colors.white),
                  enableFeedback: false,
                  onTap: () {
                    if(_currentPage == _onboardingData.length - 1){
                      Navigator.pushNamed(context, Login_Screen.routeName);
                    }else{
                      setState(() {
                        _pageController.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.bounceIn,
                        );
                        _currentPage++;
                      });
                    }
                  },
                  child: Container(
                    alignment:Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:  app_Colors_Light.mainColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.arrow_forward_ios_outlined,color: app_Colors_Light.ICON_color,),
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
        color: _currentPage == index ?  app_Colors_Light.mainColor : Colors.grey,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}

class OnboardingPage extends StatefulWidget {

  final String image;
  final String title;
  final String description;

  const OnboardingPage({
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  String _selectedLanguage = 'EN';
  final Map<String, String> _languages = {
    'EN': 'assets/images/En_Flag.png',  // Replace with actual image paths
    'AR': 'assets/images/Ar_Flag.png',  // Arabic flag for example
  };
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 20),
            child: Row(
              children: [
                DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _selectedLanguage,
                    icon: Icon(Icons.arrow_drop_down, color:Colors.black),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedLanguage = newValue!;
                      });
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
          Image.asset(widget.image, height: 300),
          SizedBox(height: 20),
         Column(
           children: [
             Text(
               widget.title,
               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
               textAlign: TextAlign.center,
             ),
             SizedBox(height: 12),
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 32.0),
               child: Text(
                 widget.description,
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
