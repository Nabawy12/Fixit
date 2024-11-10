import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yourcolor/Utils/Colors/colors.dart';

Widget customTextField({
  required BuildContext context,
  required String hintText,
  required TextEditingController controller,
  bool obscureText = false,
  int MaxLines = 1,
  IconData? prefixIcon,
  IconData? suffixIcon,
  Color? fillColor,
  Color? iconColor,
  Color? hintTextColor,
  Color? focusColor,
  TextInputType? keyboardType,
  String? Function(String?)? validator,
  void Function()? onSuffixIconTap,
  List<TextInputFormatter>? inputFormatters,
}) {
  final isDarkMode = Theme.of(context).brightness == Brightness.dark;

  return TextFormField(
    maxLines: MaxLines,
    controller: controller,
    obscureText: obscureText,
    keyboardType: keyboardType,
    validator: validator,
    inputFormatters: inputFormatters,
    style: GoogleFonts.cairo(
      color: isDarkMode ? Colors.white : Colors.black,
      fontSize: 15,
    ),
    cursorColor: app_Colors_Light.MainColor,
    decoration: InputDecoration(
      hintText: hintText,
      hintStyle: GoogleFonts.dmSans(
        color: hintTextColor ?? (isDarkMode ? Colors.white60 : Colors.grey),
        fontSize: 15,
      ),
      prefixIcon: prefixIcon != null
          ? Icon(prefixIcon, color: iconColor ?? (isDarkMode ? Colors.white70 : Colors.grey))
          : null,
      suffixIcon: suffixIcon != null
          ? GestureDetector(
        onTap: onSuffixIconTap,
        child: Icon(suffixIcon, color: iconColor ?? (isDarkMode ? Colors.white70 : Colors.grey)),
      )
          : null,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide.none,
      ),
      filled: true,
      fillColor: fillColor ?? (isDarkMode ? Colors.grey[850] : Colors.grey[100]),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide(
          color: focusColor ?? Theme.of(context).colorScheme.outline,
        ),
      ),
      errorStyle: GoogleFonts.dmSans(color: Colors.red, fontSize: 12),
    ),
  );
}
