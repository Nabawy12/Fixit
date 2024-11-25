import 'package:flutter/material.dart';
import 'package:yourcolor/Utils/Colors/colors.dart';

class OfferCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String buttonText;
  final String tag;

  const OfferCard({
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.tag,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,  // Ensure the container takes up the full width
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/service man.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                tag,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 12),
              ),
            ),
            SizedBox(height: 10),
            Text(
              title,
              style: Theme.of(context).textTheme.bodyMedium
            ),
            Text(
              subtitle,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Text(buttonText),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                backgroundColor: app_Colors_Light.MainColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
