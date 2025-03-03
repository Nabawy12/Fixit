import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yourcolor/Utils/Colors/colors.dart';
import 'package:yourcolor/Utils/Elevated_Button/button.dart';
import 'package:yourcolor/Utils/Text_Form_Field/text_field.dart';
import 'package:yourcolor/Views/ForgetPassword/ForgetPassword.dart';
import 'package:yourcolor/Views/Providers/onboarding/onboarding.dart';
import '../../generated/l10n.dart';
import '../../providers_state_mange/settings/settings.dart';
import '../NavBar/navbar.dart';
import '../Providers/SignUp/signUP.dart';
import '../SignUp/SignUp.dart';

class Login_Screen extends StatefulWidget {
  static const routeName = "/Login_Screen";

  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool showAgreementError = false;
  DateTime? lastSwipeTime;
  int swipeCount = 0;
  bool visiblePassword = false;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<setting_Providers>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: WillPopScope(
        onWillPop: () async {
          if (provider.user == "user" ||
              provider.currentNavigateAt == "login") {
            provider.user == "provider" ? provider.changeUserType() : null;
            Navigator.pushNamedAndRemoveUntil(
              context,
              Onboarding_provider.routeName,
              (Route<dynamic> route) => false,
            );
            FocusScope.of(context).unfocus();
            return Future.value(true);
          } else {
            //provider.changeUserType();
            Navigator.pushNamedAndRemoveUntil(
              context,
              Onboarding_provider.routeName,
              (Route<dynamic> route) => false,
            );
            FocusScope.of(context).unfocus();
            return Future.value(true);
          }
        },
        child: Center(
          child: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Image(
                      image: AssetImage('assets/images/logo.png'),
                      width: 150,
                      height: 120,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment:
                          Localizations.localeOf(context).languageCode == 'en'
                              ? Alignment.centerLeft
                              : Alignment.centerRight,
                      child: Text(
                          provider.user == "user"
                              ? S.of(context).Login_title
                              : "LOGIN AS A PROVIDER",
                          style: Theme.of(context).textTheme.bodyLarge),
                    ),
                    const SizedBox(height: 16),

                    // Email and Password Fields
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 20),
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
                                  color:
                                      app_Colors_Light.MainColor, // Line color
                                  borderRadius: BorderRadius.circular(
                                      10), // Rounded edges
                                ),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Text(
                                S.of(context).Login_email_title_text_field,
                                style: Theme.of(context).textTheme.bodyMedium,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: customTextField(
                                isRequired: true,
                                context: context,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return S.of(context).Email_vaild;
                                  } else if (!value.contains('@') ||
                                      value.indexOf('@') < 3) {
                                    return "ُEmail not true";
                                  }
                                  return null;
                                },
                                hintText:
                                    S.of(context).Login_email_text_field_hint,
                                controller: email,
                                prefixIcon: Icons.email_outlined,
                                fillColor:
                                    Theme.of(context).scaffoldBackgroundColor,
                                hintTextColor: Colors.grey.shade400,
                                iconColor: app_Colors_Light.ICon_textForm_color,
                                obscureText: false,
                              )),
                          const SizedBox(height: 16),
                          // Password Field
                          Row(
                            children: [
                              Container(
                                width: 4, // Fixed width for the line
                                height:
                                    20, // Line height based on responsive text height
                                decoration: BoxDecoration(
                                  color:
                                      app_Colors_Light.MainColor, // Line color
                                  borderRadius: BorderRadius.circular(
                                      10), // Rounded edges
                                ),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Text(
                                S.of(context).Login_title_password,
                                style: Theme.of(context).textTheme.bodyMedium,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: customTextField(
                                isRequired: true,
                                context: context,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return S.of(context).password_vaild;
                                  }
                                  return null;
                                },
                                hintText: S
                                    .of(context)
                                    .Login_title_password_text_field,
                                controller: password,
                                prefixIcon: Icons.lock_outlined,
                                suffixIcon: visiblePassword == false
                                    ? Icons.visibility_off_outlined
                                    : Icons.remove_red_eye_outlined,
                                fillColor:
                                    Theme.of(context).scaffoldBackgroundColor,
                                obscureText:
                                    visiblePassword == false ? true : false,
                                hintTextColor: Colors.grey.shade400,
                                iconColor: app_Colors_Light.ICon_textForm_color,
                                onSuffixIconTap: () {
                                  if (visiblePassword == true) {
                                    setState(() {
                                      visiblePassword = false;
                                    });
                                  } else {
                                    setState(() {
                                      visiblePassword = true;
                                    });
                                  }
                                },
                              )),

                          const SizedBox(
                            height: 10,
                          ),
                          // Forget Password
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Align(
                              alignment: Localizations.localeOf(context)
                                          .languageCode ==
                                      'en'
                                  ? Alignment.centerRight
                                  : Alignment.centerLeft,
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    Forget_Password_Screen.routeName,
                                  );
                                  FocusScope.of(context).unfocus();
                                },
                                child: Text(
                                  S.of(context).Forget_password,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                          color: app_Colors_Light.MainColor),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),
                          // Login Button
                          Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: CustomButton(
                                onPressed: () {
                                  setState(() {
                                    if (_formKey.currentState!.validate()) {
                                      Navigator.pushNamedAndRemoveUntil(
                                        context,
                                        Navbar.routeName,
                                        (Route<dynamic> route) => false,
                                      );
                                    } else {}
                                  });
                                },
                                text: S.of(context).Login_title,
                              )),

                          const SizedBox(height: 10),
                          // Sign Up Text
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                S.of(context).Not_member,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              TextButton(
                                onPressed: () {
                                  provider.user == "user"
                                      ? Navigator.pushNamed(
                                          context, SignUp_Screen.routeName)
                                      : Navigator.pushNamed(
                                          context, Signup_provider.routeName);
                                },
                                child: Text(
                                  S.of(context).SIGNUP_title,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                          color: app_Colors_Light.MainColor),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Continue as Guest
                    provider.user == "user"
                        ? TextButton.icon(
                            onPressed: () {
                              Navigator.pushNamedAndRemoveUntil(
                                context,
                                Navbar.routeName,
                                (Route<dynamic> route) => false,
                              );
                            },
                            icon: const Icon(Icons.person_outline,
                                color: Colors.grey),
                            label: Text(
                              S.of(context).Continue_guest,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      color:
                                          app_Colors_Light.Second_Text_Light),
                            ),
                          )
                        : Container(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
