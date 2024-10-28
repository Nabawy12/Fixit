import 'package:flutter/material.dart';
import 'package:yourcolor/Utils/Colors/colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color? color;

  const CustomButton({
    Key? key,
    required this.text,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      height: 50.0, // constant height
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? app_Colors_Light.mainColor, // default color is blue
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0), // optional rounded corners
          ),
        ),
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
