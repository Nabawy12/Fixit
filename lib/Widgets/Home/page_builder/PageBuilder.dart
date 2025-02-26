import 'package:flutter/material.dart';
import 'package:yourcolor/Utils/Colors/colors.dart';

class OfferCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String buttonText;
  final String tag;

  const OfferCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.tag,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
          image: AssetImage("assets/images/serviceman.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                color: app_Colors_Light.OFFER_Selcted,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                tag,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontSize: 12, color: Colors.white),
              ),
            ),
            const SizedBox(height: 10),
            Text(title,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.w700)),
            const SizedBox(height: 20),
            SizedBox(
              height: 38,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  overlayColor: app_Colors_Light.MainColor,
                  shadowColor: app_Colors_Light.MainColor,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  backgroundColor: app_Colors_Light.MainColor,
                ),
                child: Text(
                  buttonText,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
