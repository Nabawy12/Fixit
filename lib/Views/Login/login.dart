import 'package:flutter/material.dart';
import 'package:yourcolor/Utils/Colors/colors.dart';
import 'package:yourcolor/Utils/Elevated_Button/button.dart';
import 'package:yourcolor/Utils/Text_Form_Field/text_field.dart';
import 'package:yourcolor/Widgets/ForgetPassword/ForgetPassword.dart';

class Login_Screen extends StatelessWidget {
  static const routeName = "/Login_Screen" ;
  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 30,),
                Text("LOGOHERE"),
                SizedBox(height: 30,),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'LOGIN',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: app_Colors_Light.Main_Text_Dark,
                    ),
                  ),
                ),
                SizedBox(height: 16),

                // Email and Password Fields
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    color: app_Colors_Light.BG_Card_color,
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
                          Text("Email",
                          style: TextStyle(
                            fontFamily: "DMSans",
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                          )
                        ],
                      ),
                      SizedBox(height: 10,),
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: customTextField(hintText: "Email Address",
                              controller: email,
                              prefixIcon: Icons.email_outlined,
                              fillColor: app_Colors_Light.BG_color,
                              hintTextColor: Colors.grey.shade400,
                              iconColor: Colors.grey.shade400,
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
                          Text("Password",
                          style: TextStyle(
                            fontFamily: "DMSans",
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                          )
                        ],
                      ),
                      SizedBox(height: 10,),
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: customTextField(hintText: "Password",
                              controller: password,
                              prefixIcon: Icons.remove_red_eye_outlined,
                              fillColor: app_Colors_Light.BG_color,
                              obscureText: true,hintTextColor: Colors.grey.shade400,
                              iconColor: Colors.grey.shade400,
                          )
                      ),

                      SizedBox(height: 10,),
                      // Forget Password
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            onTap: () => Navigator.pushNamed(context,Forget_Password_Screen.routeName),
                            child: Text(
                              'Forget password?',
                              style: TextStyle(
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 24),
                      // Login Button
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: CustomButton(
                              text: "Login",
                          )
                      ),

                      SizedBox(height: 10),
                      // Sign Up Text
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Not a member?"),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'Sign up',
                              style: TextStyle(
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 24),


                // Continue as Guest
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.person_outline, color: Colors.grey),
                  label: Text(
                    'Continue as a guest',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
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
