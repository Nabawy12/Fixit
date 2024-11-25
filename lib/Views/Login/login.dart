import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
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
  static const routeName = "/Login_Screen" ;

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
  bool visblePassword = false;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<setting_Providers>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: WillPopScope(

        onWillPop: () async  {
          if(provider.user == "user" || provider.currentNavigateAt == "login"){
            provider.user == "provider" ?
            provider.changeUserType() : null;
              Navigator.pushNamedAndRemoveUntil(
                context,
                Onboarding_provider.routeName,
                    (Route<dynamic> route) => false,
              );
              FocusScope.of(context).unfocus();
              return Future.value(true);

          }
          else{
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
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image(image: AssetImage('assets/images/logo.png'),width: 150,height: 120,),
                    SizedBox(height: 10,),
                    Align(
                      alignment: Localizations.localeOf(context).languageCode == 'en'
                          ? Alignment.centerLeft
                          : Alignment.centerRight,
                      child: Text(
                        provider.user == "user" ?
                        S.of(context).Login_title : "LOGIN AS A PROVIDER",
                        style: Theme.of(context).textTheme.bodyLarge
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
                                isRequired: true,
                                context: context,
                                validator:  (value) {
                                  if (value == null || value.isEmpty) {
                                    return S.of(context).Email_vaild;
                                  }
                                  return null;
                                },
                                hintText:S.of(context).Login_email_text_field_hint,
                                  controller: email,
                                  prefixIcon: Icons.email_outlined,
                                  fillColor: Theme.of(context).scaffoldBackgroundColor,
                                  hintTextColor: Colors.grey.shade400,
                                  iconColor: app_Colors_Light.ICon_textForm_color,
                                  obscureText: false,

                              )
                          ),
                          SizedBox(height: 16),
                          // Password Field
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
                                  S.of(context).Login_title_password,
                                style: Theme.of(context).textTheme.bodyMedium,
                              )
                            ],
                          ),
                          SizedBox(height: 10,),
                          Container(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: customTextField(
                                isRequired: true,
                                context: context,

                                validator:  (value) {
                                  if (value == null || value.isEmpty) {
                                    return S.of(context).password_vaild;
                                  }
                                  return null;
                                },
                                  hintText: S.of(context).Login_title_password_text_field,
                                  controller: password,
                                  prefixIcon: Icons.lock_outlined,
                                  suffixIcon: visblePassword==false ?Icons.visibility_off_outlined : Icons.remove_red_eye_outlined,
                                  fillColor: Theme.of(context).scaffoldBackgroundColor,
                                  obscureText: visblePassword==false? true : false,
                                  hintTextColor: Colors.grey.shade400,
                                  iconColor: app_Colors_Light.ICon_textForm_color,
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
                              )
                          ),

                          SizedBox(height: 10,),
                          // Forget Password
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Align(
                              alignment: Localizations.localeOf(context).languageCode == 'en'
                                  ? Alignment.centerRight
                                  : Alignment.centerLeft,
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context,Forget_Password_Screen.routeName,);
                                  FocusScope.of(context).unfocus();
                                },
                                child: Text(
                                    S.of(context).Forget_password,
                                  style: Theme.of(context).textTheme.bodySmall!.copyWith(color: app_Colors_Light.MainColor),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 24),
                          // Login Button
                          Container(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: CustomButton(
                                  onPressed: () {
                                    setState(() {
                                      if (_formKey.currentState!.validate()) {
                                        Navigator.pushNamedAndRemoveUntil(
                                          context,
                                          Navbar.routeName,
                                              (Route<dynamic> route) => false,
                                        );

                                      } else {
                                      }
                                    });
                                  },
                                  text: S.of(context).Login_title,
                              )
                          ),

                          SizedBox(height: 10),
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
                                  provider.user == "user" ?
                                  Navigator.pushNamed(context, SignUp_Screen.routeName) : Navigator.pushNamed(context, Signup_provider.routeName) ;
                                },
                                child: Text(
                                    S.of(context).SIGNUP_title,
                                  style: Theme.of(context).textTheme.bodySmall!.copyWith(color: app_Colors_Light.MainColor),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 24),


                    // Continue as Guest
                    provider.user == "user" ?
                    TextButton.icon(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(context, Navbar.routeName, (Route<dynamic> route) => false,);
                        },
                      icon: Icon(Icons.person_outline, color: Colors.grey),
                      label: Text(
                        S.of(context).Continue_guest,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: app_Colors_Light.Second_Text_Light),
                      ),
                    ) : Container(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /*void _showExitDialog(BuildContext context) {
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
                  S.of(context).Exit_title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 17),),
                SizedBox(height: 20),
                Image.asset("assets/images/log_out.png"),
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
                               border: Border.all(
                                   color: app_Colors_Light.MainColor
                               ),
                               shape: BoxShape.rectangle
                           ),
                         child: Text(
                           S.of(context).Exit_button_1,
                           style:Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 14),
                         ),
                         ),
                       )
                   ),
                    SizedBox(width: 8,),
                    // Exit Button
                    Expanded(
                        child: InkWell(
                          onTap: () =>SystemNavigator.pop(),
                          child: Container(
                            alignment: Alignment.center,
                            height: 50,
                            decoration: BoxDecoration(
                                color: app_Colors_Light.MainColor,
                                borderRadius: BorderRadius.circular(12),
                                shape: BoxShape.rectangle

                            ),
                            child: Text(
                              S.of(context).Exit_button_2,
                              style:Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 14),

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
  }*/
}


