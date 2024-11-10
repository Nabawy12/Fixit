import 'package:flutter/material.dart';
import 'package:yourcolor/Utils/Colors/colors.dart';
import '../../../generated/l10n.dart';
import '../RseetPassword.dart';



class OTP_Screen extends StatefulWidget {
  static const routeName = "/OTP_Screen" ;

  @override
  State<OTP_Screen> createState() => _OTP_ScreenState();
}

class _OTP_ScreenState extends State<OTP_Screen> {
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());
  final List<TextEditingController> _controllers = List.generate(6, (_) => TextEditingController());

  @override
  void initState() {
    super.initState();
  }
  @override
  void dispose() {
    _focusNodes.forEach((node) => node.dispose());
    _controllers.forEach((controller) => controller.dispose());
    super.dispose();
  }

  void _submitOtp() {
    String otpCode = _controllers.map((controller) => controller.text).join();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Verification Code"),
          content: Text('Code entered is $otpCode'),
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(image: AssetImage("assets/images/OTP.png"),width: 190,height: 190,),
              SizedBox(height: 30,),
              Align(
                alignment: Alignment.center,
                child: Text(
                  S.of(context).VERIFY_OTP,
                  style: Theme.of(context).textTheme.bodyLarge,

                ),
              ),
              SizedBox(height: 5),
              Align(
                alignment: Alignment.center,
                child: Text(
                  S.of(context).VERIFY_OTP_des,
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
                          width: 4,
                          height: 20,
                          decoration: BoxDecoration(
                            color: app_Colors_Light.MainColor, // Line color
                            borderRadius: BorderRadius.circular(10), // Rounded edges
                          ),
                        ),
                        SizedBox(width: 16,),
                        Text(
                          S.of(context).VERIFY_OTP,
                          style: Theme.of(context).textTheme.bodyMedium,
                        )
                      ],
                    ),
                    SizedBox(height: 10,),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: [
                            ...List.generate(6, (index) {
                              return SizedBox(
                                width: 45,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                  child: TextFormField(
                                    cursorColor: app_Colors_Light.MainColor,
                                    autofocus: true,
                                    controller: _controllers[index],
                                    focusNode: _focusNodes[index],
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    maxLength: 1,
                                    decoration: InputDecoration(
                                      counterText: '', // لإخفاء العداد
                                      filled: true,
                                      fillColor: Theme.of(context).scaffoldBackgroundColor,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(color: Theme.of(context).colorScheme.outline), // تغيير لون الحدود إلى الأبيض
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(color: Theme.of(context).colorScheme.outline), // تغيير لون الحدود إلى الأبيض للحالة العادية
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(color: Theme.of(context).colorScheme.outline), // تغيير لون الحدود إلى الأبيض عند التركيز
                                      ),
                                    ),
                                    onChanged: (value) {
                                      if (value.isNotEmpty) {
                                        if (index < _focusNodes.length - 1) {
                                          _focusNodes[index + 1].requestFocus();
                                        } else {
                                          _focusNodes[index].unfocus();
                                          _submitOtp();
                                          Navigator.pushNamedAndRemoveUntil(context, Reset_Password_Screen.routeName,(Route<dynamic> route) => false,);
                                        }
                                      } else if (value.isEmpty && index > 0) {
                                        _focusNodes[index - 1].requestFocus();
                                      }
                                    },
                                  ),
                                ),
                              );
                            })
                          ],
                        ),
                    ),
                    SizedBox(height: 20),

                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        S.of(context).VERIFY_OTP_resend,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: app_Colors_Light.MainColor),

                      ),
                    )
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
