import 'package:flutter/material.dart';
import 'package:yourcolor/Utils/Colors/colors.dart';

Widget customTextField({
  required String hintText,
  required TextEditingController controller,
  bool obscureText = true,
  IconData? prefixIcon,
  IconData? suffixIcon,
  Color? fillColor, // Optional fill color
  Color? iconColor, // Optional icon color
  Color? hintTextColor, // Optional hint text color
}) {
  return Container(
    child: TextFormField(
      cursorColor: app_Colors_Light.MainColor,
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: hintTextColor ?? Colors.grey), // Set hint text color
        prefixIcon: prefixIcon != null
            ? Icon(prefixIcon, color: iconColor ?? Colors.grey)
            : null,
        suffixIcon: suffixIcon != null
            ? Icon(suffixIcon, color: iconColor ?? Colors.grey)
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: fillColor ?? Colors.grey[100], // Default to light grey
      ),
    ),
  );
}
