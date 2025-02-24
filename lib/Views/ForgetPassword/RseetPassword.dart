import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:yourcolor/Utils/Colors/colors.dart';
import 'package:yourcolor/Utils/Elevated_Button/button.dart';
import 'package:yourcolor/Utils/Text_Form_Field/text_field.dart';
import 'package:yourcolor/Views/Login/login.dart';

import '../../generated/l10n.dart';

class Reset_Password_Screen extends StatefulWidget {
  static const routeName = "/Reset_Password";

  @override
  State<Reset_Password_Screen> createState() => _Reset_Password_ScreenState();
}

class _Reset_Password_ScreenState extends State<Reset_Password_Screen> {
  final _formKey = GlobalKey<FormState>();
  bool visblePassword = false;
  TextEditingController password = TextEditingController();
  TextEditingController repassword = TextEditingController();
  bool showAgreementError = false;
  DateTime? lastSwipeTime;
  int swipeCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: WillPopScope(
        onWillPop: () async {
          DateTime now = DateTime.now();
          if (lastSwipeTime == null ||
              now.difference(lastSwipeTime!) > Duration(seconds: 2)) {
            swipeCount = 1;
            lastSwipeTime = now;
            return false;
          } else {
            swipeCount++;
            lastSwipeTime = now;

            if (swipeCount == 2) {
              swipeCount = 0;
              _showExitDialog(context);
              return false;
            } else {
              swipeCount = 0;
              return false;
            }
          }
        },
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: SafeArea(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      S.of(context).RESET_PASSWORD,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  SizedBox(height: 5),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      S.of(context).RESET_PASSWORD_des,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: app_Colors_Light.Second_Text_Light),
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
                              height:
                                  20, // Line height based on responsive text height
                              decoration: BoxDecoration(
                                color: app_Colors_Light.MainColor, // Line color
                                borderRadius:
                                    BorderRadius.circular(10), // Rounded edges
                              ),
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Text(
                              S.of(context).New_Password_text_field,
                              style: Theme.of(context).textTheme.bodyMedium,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: customTextField(
                            isRequired: true,
                            context: context,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "${S.of(context).password_vaild}";
                              } else if (value.length < 8) {
                                return "${S.of(context).password_less_vaild}";
                              }
                              return null;
                            },
                            hintText:
                                S.of(context).New_Password_text_field_content,
                            controller: password,
                            prefixIcon: Icons.lock_outlined,
                            suffixIcon: visblePassword == false
                                ? Icons.visibility_off_outlined
                                : Icons.remove_red_eye_outlined,
                            onSuffixIconTap: () {
                              if (visblePassword == true) {
                                setState(() {
                                  visblePassword = false;
                                });
                              } else {
                                setState(() {
                                  visblePassword = true;
                                });
                              }
                            },
                            fillColor:
                                Theme.of(context).scaffoldBackgroundColor,
                            hintTextColor: Colors.grey.shade400,
                            iconColor: app_Colors_Light.ICon_textForm_color,
                            obscureText: visblePassword == false ? true : false,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 4, // Fixed width for the line
                              height:
                                  20, // Line height based on responsive text height
                              decoration: BoxDecoration(
                                color: app_Colors_Light.MainColor, // Line color
                                borderRadius:
                                    BorderRadius.circular(10), // Rounded edges
                              ),
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Text(
                              S.of(context).Login_title_Confirm_Password,
                              style: Theme.of(context).textTheme.bodyMedium,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: customTextField(
                            isRequired: true,
                            context: context,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "${S.of(context).password_vaild}";
                              } else if (repassword.text != password.text) {
                                return "${S.of(context).password_not_match}";
                              }
                              return null;
                            },
                            hintText:
                                S.of(context).Login_title_Confirm_Password,
                            controller: repassword,
                            prefixIcon: Icons.lock_outlined,
                            suffixIcon: visblePassword == false
                                ? Icons.visibility_off_outlined
                                : Icons.remove_red_eye_outlined,
                            onSuffixIconTap: () {
                              if (visblePassword == true) {
                                setState(() {
                                  visblePassword = false;
                                });
                              } else {
                                setState(() {
                                  visblePassword = true;
                                });
                              }
                            },
                            fillColor:
                                Theme.of(context).scaffoldBackgroundColor,
                            hintTextColor: Colors.grey.shade400,
                            iconColor: app_Colors_Light.ICon_textForm_color,
                            obscureText: visblePassword == false ? true : false,
                          ),
                        ),
                        SizedBox(height: 20),
                        // Login Button
                        Container(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: CustomButton(
                              text: S.of(context).RESET_PASSWORD,
                              onPressed: () {
                                setState(() {
                                  if (_formKey.currentState!.validate()) {
                                    showCustomDialog(context);
                                  } else {}
                                });
                              },
                            )),

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

  void showCustomDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent closing when tapping outside
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              Login_Screen.routeName,
              (Route<dynamic> route) => false,
            );
            FocusScope.of(context).unfocus();
            return Future.value(true);
          },
          child: AlertDialog(
            backgroundColor: Theme.of(context).cardColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            contentPadding: EdgeInsets.all(16),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  textAlign: TextAlign.center,
                  S.of(context).Successfully_changed,
                  style: TextStyle(
                    fontFamily: "DMSans",
                    color: app_Colors_Light.Main_Text_Dark,
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                  ),
                ),
              ],
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 250,
                  width: double.infinity,
                  child: Lottie.asset(
                    repeat: false,
                    'assets/lottie/Done.json',
                    width: double.infinity,
                    height: 150,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  S.of(context).Successfully_changed_des,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "DMSans",
                    color: app_Colors_Light.Second_Text_Light,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            actions: [
              Center(
                child: CustomButton(
                  text: S.of(context).Login_again,
                  onPressed: () => Navigator.pushNamedAndRemoveUntil(
                    context,
                    Login_Screen.routeName,
                    (Route<dynamic> route) => false,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showExitDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () {
            SystemNavigator.pop();
            return Future.value(true);
          },
          child: AlertDialog(
            backgroundColor: Theme.of(context).cardColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            contentPadding: EdgeInsets.all(16),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  S.of(context).exit_reset,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Cancel Button
                    Expanded(
                        child: InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            borderRadius: BorderRadius.circular(12),
                            border:
                                Border.all(color: app_Colors_Light.MainColor),
                            shape: BoxShape.rectangle),
                        child: Text(
                          S.of(context).Exit_button_1,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(fontSize: 13),
                        ),
                      ),
                    )),
                    SizedBox(
                      width: 8,
                    ),
                    // Exit Button
                    Expanded(
                        child: InkWell(
                      onTap: () => SystemNavigator.pop(),
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        decoration: BoxDecoration(
                            color: app_Colors_Light.MainColor,
                            borderRadius: BorderRadius.circular(12),
                            shape: BoxShape.rectangle),
                        child: Text(
                          S.of(context).Exit_button_2,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(fontSize: 13),
                        ),
                      ),
                    )),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
