import 'package:flutter/material.dart';
import 'package:yourcolor/Utils/Colors/colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color? color;
  final VoidCallback? onPressed; // Add the optional onPressed parameter

  const CustomButton({
    Key? key,
    required this.text,
    this.color,
    this.onPressed, // Include the parameter in the constructor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0, // constant height
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed ?? () {}, // Use the provided onPressed or a default no-op
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? app_Colors_Light.MainColor, // default color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0), // optional rounded corners
          ),
        ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
