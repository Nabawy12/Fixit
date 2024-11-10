import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Utils/Colors/colors.dart';

class LanguageOption extends StatelessWidget {
  final bool isSelected;
  final String flagPath;
  final String language;

  const LanguageOption({
    required this.isSelected,
    required this.flagPath,
    required this.language,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: isSelected
                ? app_Colors_Light.MainColor.withOpacity(0.3)
                : Theme.of(context).cardColor,
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
        border: isSelected
            ? Border.all(color: app_Colors_Light.MainColor, width: 2)
            : Border.all(color: Colors.transparent),
      ),
      child: Row(
        children: [
          Image.asset(flagPath, width: 50, height: 50),
          SizedBox(width: 20),
          Text(
            language,
            style:isSelected? Theme.of(context).textTheme.bodyMedium!.copyWith(color: app_Colors_Light.MainColor):Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
