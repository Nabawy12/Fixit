import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yourcolor/Utils/Colors/colors.dart';
import 'package:yourcolor/Utils/Elevated_Button/button.dart';
import '../../../../generated/l10n.dart';
import '../../../../providers/settings/settings.dart';

class ChangeLange extends StatefulWidget {
  static const routeName = "/ChangeLange";
  const ChangeLange({super.key});

  @override
  _ChangeLangeState createState() => _ChangeLangeState();
}

class _ChangeLangeState extends State<ChangeLange> {
  String? _selectedLanguageCode;

  void _showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Row(
            children: [
              CircularProgressIndicator(color: app_Colors_Light.MainColor),
              SizedBox(width: 20),
              Text("Loading"),
            ],
          ),
        );
      },
    );
  }

  Future<void> _changeLanguage(BuildContext context) async {
    if (_selectedLanguageCode != null) {
      var provider = Provider.of<setting_Providers>(context, listen: false);

      _showLoadingDialog(context);
       provider.changeLanguage(_selectedLanguageCode!);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<setting_Providers>(context);
    Locale currentLocale = provider.currentLocale;
    _selectedLanguageCode ??= currentLocale.languageCode;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  splashColor: Theme.of(context).scaffoldBackgroundColor,
                  highlightColor: Theme.of(context).scaffoldBackgroundColor,
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.grey.shade500,
                    ),
                  ),
                ),
                Text(
                  S.of(context).Change_Language,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 40), // To balance space with the back button
              ],
            ),
            SizedBox(height: 40),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    spreadRadius: 1,
                    blurRadius: 6,
                    offset: Offset(3, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  LanguageOption(
                    isSelected: _selectedLanguageCode == 'en',
                    flagPath: "assets/images/Flag_united.webp",
                    language: S.of(context).English,
                    onTap: () {
                      setState(() {
                        _selectedLanguageCode = 'en';
                      });
                    },
                  ),
                  Divider(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    thickness: 1,
                    height: 1,
                  ),
                  LanguageOption(
                    isSelected: _selectedLanguageCode == 'ar',
                    flagPath: "assets/images/Flag_Emarat.png",
                    language: S.of(context).Arabic,
                    onTap: () {
                      setState(() {
                        _selectedLanguageCode = 'ar';
                      });
                    },
                  ),
                ],
              ),
            ),
            Spacer(),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: CustomButton(
                  text: S.of(context).Update,
                  onPressed: () {
                    _changeLanguage(context);
                  },
                  color: app_Colors_Light.MainColor,



                  ),
              ),
            ),
            SizedBox(height: 20), // Add some space below the button
          ],
        ),
      ),
    );
  }
}

class LanguageOption extends StatelessWidget {
  final bool isSelected;
  final String flagPath;
  final String language;
  final VoidCallback onTap;

  const LanguageOption({
    required this.isSelected,
    required this.flagPath,
    required this.language,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(flagPath,),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Text(
                language,
                style: isSelected ? Theme.of(context).textTheme.bodyMedium!.copyWith(color: app_Colors_Light.MainColor):Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            Radio(
              value: isSelected,
              groupValue: true,
              onChanged: (bool? value) => onTap(),
              activeColor: app_Colors_Light.MainColor,
            ),
          ],
        ),
      ),
    );
  }
}
