import 'package:flutter/material.dart';
import 'package:yourcolor/Utils/Colors/colors.dart';
import 'package:yourcolor/Utils/Elevated_Button/button.dart';
import 'package:yourcolor/Utils/Text_Form_Field/text_field.dart';
import 'package:yourcolor/Views/ForgetPassword/OTP/otp.dart';

import '../../generated/l10n.dart';

class Forget_Password_Screen extends StatefulWidget {
  static const routeName = "/Forget_Password" ;

  @override
  State<Forget_Password_Screen> createState() => _Forget_Password_ScreenState();
}

class _Forget_Password_ScreenState extends State<Forget_Password_Screen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: WillPopScope(
        onWillPop: () {
          Navigator.pop(context);
          FocusScope.of(context).unfocus();
          return Future.value(true);
        },
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: SafeArea(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Localizations.localeOf(context).languageCode == 'en'
                        ? Alignment.topLeft
                        : Alignment.topRight,
                    child: InkWell(
                      splashColor: Theme.of(context).splashColor,
                      highlightColor: Theme.of(context).highlightColor,
                      onTap: () {
                        Navigator.pop(context);
                        FocusScope.of(context).unfocus();

                      } ,
                      child: Container(
                        margin: EdgeInsets.only(top: 20),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          shape: BoxShape.circle
                        ),
                        child: Icon(Icons.arrow_back_ios_new,size: 20,),
                      ),
                    ),
                  ),
                  Image(image: AssetImage("assets/images/forget.png")),
                  SizedBox(height: 30,),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      S.of(context).Forget_password,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  SizedBox(height: 5),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      S.of(context).Forget_Password_des,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                  SizedBox(height: 16),

                  // Email and Password Fields
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Email Field
                        Row(
                          children: [
                            Container(
                              width: 4, // Fixed width for the line
                              height: 20, // Line height based on responsive text height
                              decoration: BoxDecoration(
                                color: app_Colors_Light.MainColor, // Line color
                                borderRadius: BorderRadius.circular(10), // Rounded edges
                              ),
                            ),
                            SizedBox(width: 16,),
                            Text(
                              S.of(context).Login_email_title_text_field,
                              style: Theme.of(context).textTheme.bodyMedium,
                            )
                          ],
                        ),
                        SizedBox(height: 10,),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                            child: customTextField(
                              context: context,
                              validator:  (value) {
                                if (value == null || value.isEmpty) {
                                  return "${S.of(context).Email_vaild}";
                                }
                                return null;
                              },
                                hintText: S.of(context).Login_email_text_field_hint,
                                controller: email,
                                prefixIcon: Icons.email_outlined,
                                fillColor: Theme.of(context).scaffoldBackgroundColor,
                                hintTextColor: Colors.grey.shade400,
                                iconColor: app_Colors_Light.ICon_textForm_color,
                                obscureText: false,
                            )
                        ),
                        SizedBox(height: 20),
                        // Login Button
                        Container(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: CustomButton(
                            text: S.of(context).Send_OTP,
                              onPressed: () {
                                setState(() {
                                  if (_formKey.currentState!.validate()) {
                                    Navigator.pushNamed(context,OTP_Screen.routeName);
                                  } else {
                                  }
                                });

                              } ,
                            )
                        ),

                        SizedBox(height: 10),
                        // Sign Up Text
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SocialButton extends StatelessWidget {
  final IconData icon;
  final String label;

  SocialButton({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey.shade200,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
      icon: Icon(icon, color: Colors.black),
      label: Text(label),
    );
  }
}
