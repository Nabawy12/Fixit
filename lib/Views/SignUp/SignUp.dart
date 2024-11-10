import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:yourcolor/Utils/Colors/colors.dart';
import 'package:yourcolor/Utils/Elevated_Button/button.dart';
import 'package:yourcolor/Utils/Text_Form_Field/text_field.dart';
import 'package:yourcolor/Views/ForgetPassword/ForgetPassword.dart';
import 'package:yourcolor/Views/Login/login.dart';
import 'package:yourcolor/Views/NavBar/navbar.dart';

import '../../generated/l10n.dart';

class SignUp_Screen extends StatefulWidget {
  static const routeName = "/SignUp" ;

  @override
  State<SignUp_Screen> createState() => _SignUp_ScreenState();
}

class _SignUp_ScreenState extends State<SignUp_Screen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController repassword = TextEditingController();
  bool isChecked = false;
  bool showAgreementError = false;
  bool visblePassword = false;

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
        child: Center(
          child: SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image(image: AssetImage('assets/images/logo.png'), width: 150, height: 100),
                    Align(
                      alignment: Localizations.localeOf(context).languageCode == 'en'
                          ? Alignment.centerLeft
                          : Alignment.centerRight,
                      child: Text(
                        S.of(context).SIGNUP_title,
                        style: Theme.of(context).textTheme.bodyLarge,
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
                                width: 4,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: app_Colors_Light.MainColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              SizedBox(width: 16),
                              Text(
                                S.of(context).User_name_title,
                                  style: Theme.of(context).textTheme.bodyMedium,
                              )
                            ],
                          ),
                          SizedBox(height: 10),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: customTextField(
                              context: context,
                              validator:  (value) {
                                if (value == null || value.isEmpty) {
                                  return "${S.of(context).userName_vaild}";
                                }
                                return null;
                              },
                              keyboardType: TextInputType.name,
                              hintText: S.of(context).User_name_text_field,
                              controller: username,
                              prefixIcon: Icons.person_2_outlined,
                              fillColor: Theme.of(context).scaffoldBackgroundColor,
                              hintTextColor: Colors.grey.shade400,
                              iconColor: app_Colors_Light.ICon_textForm_color,
                              obscureText: false,
                            ),
                          ),
                          SizedBox(height: 16),

                          // Password Field
                          Row(
                            children: [
                              Container(
                                width: 4,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: app_Colors_Light.MainColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              SizedBox(width: 16),
                              Text(
                                S.of(context).Login_email_title_text_field,
                                style: Theme.of(context).textTheme.bodyMedium,
                              )
                            ],
                          ),
                          SizedBox(height: 10),
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
                              keyboardType: TextInputType.emailAddress,
                              hintText: S.of(context).Login_email_text_field_hint,
                              controller: email,
                              prefixIcon: Icons.email_outlined,
                              fillColor: Theme.of(context).scaffoldBackgroundColor,
                              obscureText: false,
                              hintTextColor: Colors.grey.shade400,
                              iconColor: app_Colors_Light.ICon_textForm_color,
                            ),
                          ),
                          SizedBox(height: 16),

                          // Phone Number Field
                          Row(
                            children: [
                              Container(
                                width: 4,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: app_Colors_Light.MainColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              SizedBox(width: 16),
                              Text(
                                S.of(context).Phone_Number_title,
                                style: Theme.of(context).textTheme.bodyMedium,
                              )
                            ],
                          ),
                          SizedBox(height: 10),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: customTextField(
                              context: context,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "${S.of(context).phone_vaild}";
                                }
                                return null;
                              },
                              keyboardType: TextInputType.phone,
                              hintText: S.of(context).Phone_Number_text_field,
                              controller: phone,
                              prefixIcon: Icons.local_phone_outlined,
                              fillColor: Theme.of(context).scaffoldBackgroundColor,
                              obscureText: false,
                              hintTextColor: Colors.grey.shade400,
                              iconColor: app_Colors_Light.ICon_textForm_color,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                            ),
                          ),

                          SizedBox(height: 16),
                          // Phone Number Field
                          Row(
                            children: [
                              Container(
                                width: 4,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: app_Colors_Light.MainColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              SizedBox(width: 16),
                              Text(
                                S.of(context).Login_title_password,
                                style: Theme.of(context).textTheme.bodyMedium,
                              )
                            ],
                          ),
                          SizedBox(height: 10),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: customTextField(
                              context: context,
                              validator:  (value) {
                                if (value == null || value.isEmpty) {
                                  return "${S.of(context).password_vaild}";
                                }else if (value.length< 8){
                                  return "${S.of(context).password_less_vaild}";
                                }
                                return null;
                              },
                              keyboardType: TextInputType.visiblePassword,
                              hintText: S.of(context).Login_title_password_text_field,
                              controller: password,
                              prefixIcon:  Icons.lock_outline,
                              suffixIcon: visblePassword==false ?Icons.visibility_off_outlined : Icons.remove_red_eye_outlined,
                              onSuffixIconTap: () {
                                if(visblePassword== true){
                                  setState(() {
                                    visblePassword = false ;
                                  });
                                }else{
                                  setState(() {
                                    visblePassword = true;
                                  });
                                }
                              },
                              fillColor: Theme.of(context).scaffoldBackgroundColor,
                              obscureText: visblePassword==false? true : false,
                              hintTextColor: Colors.grey.shade400,
                              iconColor: app_Colors_Light.ICon_textForm_color,
                            ),
                          ),
                          SizedBox(height: 16),
                          // Confirm Password Field
                          Row(
                            children: [
                              Container(
                                width: 4,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: app_Colors_Light.MainColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              SizedBox(width: 16),
                              Text(
                                S.of(context).Login_title_Confirm_Password_text_field,
                                style: Theme.of(context).textTheme.bodyMedium,
                              )
                            ],
                          ),
                          SizedBox(height: 10),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: customTextField(
                              context: context,

                              validator:  (value) {
                                if (value == null || value.isEmpty) {
                                  return "${S.of(context).password_vaild}";
                                }else if (repassword.text!=password.text){
                                  return "${S.of(context).password_less_vaild}";
                                }
                                return null;
                              },
                              keyboardType: TextInputType.visiblePassword,
                              hintText: S.of(context).Login_title_Confirm_Password_text_field,
                              controller: repassword,
                              prefixIcon: Icons.lock_outline,
                              suffixIcon: visblePassword==false ?Icons.visibility_off_outlined : Icons.remove_red_eye_outlined,
                              onSuffixIconTap: () {
                                setState(() {
                                  visblePassword = true ;
                                });
                              },
                              fillColor: Theme.of(context).scaffoldBackgroundColor,
                              obscureText: visblePassword==false? true : false,
                              hintTextColor: Colors.grey.shade400,
                              iconColor: app_Colors_Light.ICon_textForm_color,
                            ),
                          ),
                          SizedBox(height: 16),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              children: [
                                Transform.scale(
                                  scale: 1.5,
                                  child: Checkbox(
                                    value: isChecked,
                                    onChanged: (value) {
                                      setState(() {
                                        isChecked = value ?? false;
                                        showAgreementError = false; // Hide error if checkbox is checked
                                      });
                                    },
                                    fillColor: MaterialStateProperty.all(Theme.of(context).scaffoldBackgroundColor),
                                    side: BorderSide(color: app_Colors_Light.Strok_color),
                                    activeColor: app_Colors_Light.MainColor,
                                    checkColor: app_Colors_Light.MainColor,
                                  ),
                                ),
                                Text(
                                  S.of(context).Terms_agree,
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ],
                            ),
                          ),

                          // Error message if terms are not agreed
                          if (showAgreementError)
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: Text(
                               "${S.of(context).Active} ${S.of(context).Terms_agree}",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.red,
                                ),
                              ),
                            ),

                          SizedBox(height: 24),

                          // Signup Button
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: CustomButton(
                              text: S.of(context).SIGNUP_title,
                                onPressed: () {
                                  setState(() {
                                    if (_formKey.currentState!.validate()) {
                                      Navigator.pushNamedAndRemoveUntil(
                                        context,
                                        Navbar.routeName,
                                            (Route<dynamic> route) => false,);
                                    } else {
                                    }
                                    if (!isChecked) {
                                      showAgreementError = true;
                                    } else {
                                      showAgreementError = false;
                                      // Proceed with signup
                                    }
                                  });
                                }
                                ),
                          ),

                          SizedBox(height: 10),

                          // Login Text
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(S.of(context).Already_member,style: Theme.of(context).textTheme.bodyMedium,),
                              TextButton(
                                onPressed: () {
                               Navigator.pop(context);
                                },
                                child: Text(
                                  S.of(context).Login_title,
                                  style: Theme.of(context).textTheme.bodySmall!.copyWith(color: app_Colors_Light.MainColor),

                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
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
