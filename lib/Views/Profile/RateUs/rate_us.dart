import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yourcolor/Utils/Colors/colors.dart';
import 'package:yourcolor/Utils/Elevated_Button/button.dart';
import 'package:yourcolor/Utils/Text_Form_Field/text_field.dart';

class RateUs extends StatefulWidget {
  static const routeName = "/RateUs";
  const RateUs({super.key});

  @override
  State<RateUs> createState() => _RateUsState();
}

class _RateUsState extends State<RateUs> {
  TextEditingController comment = TextEditingController();
  int? _selectedEmoji; // Variable to store selected emoji index

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      splashColor: Theme.of(context).scaffoldBackgroundColor,
                      highlightColor: Theme.of(context).scaffoldBackgroundColor,
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          color: Theme.of(context).textTheme.bodyMedium!.color,
                        ),
                      ),
                    ),
                    Spacer(),
                    Text(
                      "Rate App",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Spacer(),
                  ],
                ),
                SizedBox(height: 30),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 15,),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                            "What do you think of the service provided by our workers and this app ?",
                          style: Theme.of(context).textTheme.bodyMedium,
                          textAlign: TextAlign.start,

                        ),
                      ),
                      SizedBox(height: 5),
                      Divider(color: Theme.of(context).scaffoldBackgroundColor,),
                      SizedBox(height: 10),
                      Text("Explain in emoji",style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 12),),
                      SizedBox(height: 7),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildEmojiOption(0, Icons.sentiment_very_dissatisfied, "Bad"),
                          _buildEmojiOption(1, Icons.sentiment_dissatisfied, "Okay"),
                          _buildEmojiOption(2, Icons.sentiment_satisfied, "Good"),
                          _buildEmojiOption(3, Icons.sentiment_very_satisfied, "Amazing"),
                          _buildEmojiOption(4, Icons.sentiment_very_satisfied_rounded, "Excellent"),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Text("Say something more",style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 12),),
                      SizedBox(height: 7,),
                      customTextField(
                          context: context,
                          MaxLines: 5,
                          hintText: "Write here",
                          controller: comment,
                          fillColor: Theme.of(context).scaffoldBackgroundColor,
                          focusColor: Theme.of(context).colorScheme.outline
                      ),
                      SizedBox(height: 10,),
                    ],
                  ),
                ),
                CustomButton(text: "Submit")
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper method to build each emoji option
  Widget _buildEmojiOption(int index, IconData icon, String label) {
    bool isSelected = _selectedEmoji == index;
    return Column(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              _selectedEmoji = index; // Update selected emoji
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: isSelected
                    ? app_Colors_Light.MainColor
                    : Theme.of(context).colorScheme.outline,
              ),
            ),
            padding: EdgeInsets.all(10),
            child: Icon(icon,
                color: isSelected
                    ? app_Colors_Light.MainColor
                    : Theme.of(context).textTheme.bodyMedium!.color!.withOpacity(0.7)
            ),
          ),
        ),
        SizedBox(height: 5),
        Text(label,style: Theme.of(context).textTheme.bodySmall!.copyWith(color: isSelected ? app_Colors_Light.MainColor : null),),
      ],
    );
  }
}
