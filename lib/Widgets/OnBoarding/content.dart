import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../Utils/Colors/colors.dart';
import '../../Utils/Shared_Prefence/SharedPrefence.dart';
import '../../Views/Login/login.dart';
import '../../Views/Providers/onboarding/onboarding.dart';
import '../../generated/l10n.dart';
import '../../providers_state_mange/settings/settings.dart';

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
    'EN': 'assets/images/En_Flag.png',
    'AR': 'assets/images/Ar_Flag.png',
  };

  @override
  void initState() {
    super.initState();
    _loadLanguagePreference();
  }

  Future<void> _loadLanguagePreference() async {
    String? lang = await SharedPrefUtil.getString("lang");
    if (lang != null) {
      setState(() {
        _selectedLanguage = lang.toUpperCase();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final settingProvider = Provider.of<setting_Providers>(context);

    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 30,
              horizontal: MediaQuery.of(context).size.width * 0.05,
            ),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor, // Background color of the dropdown
                    borderRadius: BorderRadius.circular(8), // Rounded corners
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        spreadRadius: 2, // Spread radius of the shadow
                        blurRadius: 2, // Blur radius of the shadow
                        offset: Offset(2, 2), // Offset for the shadow (horizontal, vertical)
                      ),
                    ],
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      padding: EdgeInsets.symmetric(horizontal: 5,),
                      focusColor:  Theme.of(context).cardColor,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 13),
                      dropdownColor: Theme.of(context).scaffoldBackgroundColor,
                      value: _selectedLanguage,
                      icon: Icon(Icons.arrow_drop_down, color: Colors.grey,size: 18,),
                      onChanged: (String? newValue) async {
                        if (newValue != null) {
                          await SharedPrefUtil.setString("lang", newValue.toUpperCase());
                          setState(() {
                            _selectedLanguage = newValue.toUpperCase();
                          });
                          settingProvider.changeLanguage(
                            _selectedLanguage == 'EN' ? 'en' : 'ar',
                          );
                        }
                      },
                      items: _languages.keys.map((String languageCode) {
                        return DropdownMenuItem<String>(
                          value: languageCode,
                          child: Row(
                            children: [
                              Image.asset(
                                _languages[languageCode]!,
                                width: 22,
                                height: 22,
                              ),
                              SizedBox(width: 8),
                              Text(
                                languageCode,
                                style:Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 13),
                              )
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                Spacer(),
                InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () =>Navigator.pushReplacementNamed(context, Onboarding_provider.routeName),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      S.of(context).SKIP,
                      style:Theme.of(context).textTheme.bodySmall
                    ),
                  ),

                ),
              ],
            ),
          ),
          Expanded(
            child: Image.asset(
              widget.image,
              height: MediaQuery.of(context).size.height * 0.4, // Adjust image height based on screen height
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.all(24),
            margin: EdgeInsets.symmetric(horizontal: 24),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  spreadRadius: 2,
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: [
                Text(
                  widget.title,
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 12),
                Text(
                  widget.description,
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          SizedBox(height: 20),

        ],
      ),
    );
  }
}