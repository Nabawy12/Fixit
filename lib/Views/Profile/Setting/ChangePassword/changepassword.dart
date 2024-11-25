import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

import '../../../../Utils/Colors/colors.dart';
import '../../../../Utils/Elevated_Button/button.dart';
import '../../../../Utils/Text_Form_Field/text_field.dart';
import '../../../../generated/l10n.dart';
import '../../../Login/login.dart';

class changePassword extends StatefulWidget {
  static const routeName = "/changePassword" ;
  const changePassword({super.key});

  @override
  State<changePassword> createState() => _changePasswordState();
}

class _changePasswordState extends State<changePassword> {
  final _formKey = GlobalKey<FormState>();
  bool visblePassword = false;
  TextEditingController currentpassword = TextEditingController();
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
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      InkWell(
                        splashColor: Theme.of(context).scaffoldBackgroundColor,
                        highlightColor: Theme.of(context).scaffoldBackgroundColor,
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(Icons.arrow_back_ios_new,


                            color:Theme.of(context).textTheme.bodyMedium!.color!.withOpacity(0.8),

                          ),
                        ),
                      ),
                      Spacer(),
                      Text(
                        S.of(context).Forget_pass_screen,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Spacer(),
                    ],
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
                        // Current Password
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
                              S.of(context).Current_Password,
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
                                return "${S.of(context).password_vaild}";
                              }else if (value.length< 8){
                                return "${S.of(context).password_less_vaild}";
                              }
                              return null;
                            },
                            hintText: S.of(context).Current_Password,
                            controller: currentpassword,
                            prefixIcon: Icons.lock_outlined,
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
                            hintTextColor: Colors.grey.shade400,
                            iconColor: app_Colors_Light.ICon_textForm_color,
                            obscureText: visblePassword==false? true : false,
                          ),
                        ),
                        SizedBox(height: 10,),

                        //NewPassword
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
                              S.of(context).New_Password_text_field,
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
                                return "${S.of(context).password_vaild}";
                              }else if (value.length< 8){
                                return "${S.of(context).password_less_vaild}";
                              }
                              return null;
                            },
                            hintText: S.of(context).New_Password_text_field_content,
                            controller: password,
                            prefixIcon: Icons.lock_outlined,
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
                            hintTextColor: Colors.grey.shade400,
                            iconColor: app_Colors_Light.ICon_textForm_color,
                            obscureText: visblePassword==false? true : false,
                          ),
                        ),
                        SizedBox(height: 10,),
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
                              S.of(context).Login_title_Confirm_Password,
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
                                return "${S.of(context).password_vaild}";
                              }else if (repassword.text!=password.text){
                                return "${S.of(context).password_not_match}";
                              }
                              return null;
                            },
                            hintText:S.of(context).Login_title_Confirm_Password,
                            controller: repassword,
                            prefixIcon: Icons.lock_outlined,
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

                            fillColor:Theme.of(context).scaffoldBackgroundColor,
                            hintTextColor: Colors.grey.shade400,
                            iconColor: app_Colors_Light.ICon_textForm_color,
                            obscureText: visblePassword==false? true : false,
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
                                  } else {
                                  }
                                });
                              },
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

  void showCustomDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent closing when tapping outside
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () {
            Navigator.pushNamedAndRemoveUntil(context, Login_Screen.routeName,(Route<dynamic> route) => false,);
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
                child: CustomButton(text: S.of(context).Login_again,onPressed: () => Navigator.pushNamedAndRemoveUntil(context, Login_Screen.routeName,(Route<dynamic> route) => false,),),
              ),
            ],
          ),
        );
      },
    );
  }

}
