import 'package:flutter/material.dart';
import 'package:yourcolor/Utils/Colors/colors.dart';
import 'package:yourcolor/Utils/Elevated_Button/button.dart';
import 'package:yourcolor/Utils/Text_Form_Field/text_field.dart';

class Forget_Password_Screen extends StatelessWidget {
  static const routeName = "/Forget_Password" ;
  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: InkWell(
                  overlayColor: WidgetStatePropertyAll(app_Colors_Light.BG_color),
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: app_Colors_Light.BG_Card_color,
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
                  'ForgetPassword',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: app_Colors_Light.Main_Text_Dark,
                  ),
                ),
              ),
              SizedBox(height: 5),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Enter Your register mail',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: app_Colors_Light.Second_Text_Light,
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
                        child: customTextField(
                            hintText: "Email Address",
                            controller: email,
                            prefixIcon: Icons.email_outlined,
                            fillColor: app_Colors_Light.BG_color,
                            hintTextColor: Colors.grey.shade400,
                            iconColor: Colors.grey.shade400,
                            obscureText: false,
                        )
                    ),
                    SizedBox(height: 20),
                    // Login Button
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: CustomButton(
                        text: "Send OTP",
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
