import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../generated/l10n.dart';
import '../../../../providers_state_mange/settings/settings.dart';

class HelpSupport extends StatelessWidget {
  static const routeName = "/HelpSupport";
  const HelpSupport({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<setting_Providers>(context);
    Future<void> launchEmail() async {
      final Uri emailUri = Uri(
        scheme: 'mailto',
        path: 'example.help%26support@gmail.com',
      );

      if (await canLaunchUrl(emailUri)) {
        await launchUrl(emailUri);
      } else {
        throw 'Could not launch $emailUri';
      }
    }

    Future<void> launchPhone(String phoneNumber) async {
      final Uri phoneUri = Uri(
        scheme: 'tel',
        path: phoneNumber,
      );

      if (await canLaunchUrl(phoneUri)) {
        await launchUrl(phoneUri);
      } else {
        throw 'Could not launch $phoneUri';
      }
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
              child: Container(
                color: Theme.of(context).cardColor,
              ),
            ),
            Container(
              color: Theme.of(context).cardColor,
              child: Row(
                children: [
                  InkWell(
                    splashColor: Theme.of(context).scaffoldBackgroundColor,
                    highlightColor: Theme.of(context).scaffoldBackgroundColor,
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      margin: provider.currentLocale.languageCode == "en"
                          ? const EdgeInsets.only(left: 16)
                          : const EdgeInsets.only(right: 16),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    S.of(context).Help_support,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const Spacer(),
                ],
              ),
            ),
            SizedBox(
              height: 10,
              child: Container(
                color: Theme.of(context).cardColor,
              ),
            ),
            ClipRRect(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                child: Image.asset("assets/images/support.png")),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "You Can Contact us by phone or email to receive any type of help 24 hours a day",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(12),
                border:
                    Border.all(color: Theme.of(context).colorScheme.outline),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.email_outlined, color: Colors.grey),
                      const SizedBox(width: 8),
                      Text(
                        'Email address :',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  InkWell(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      launchEmail();
                    },
                    child: Text(
                      'example.help&support@gmail.com',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Contact Number Section
                  Row(
                    children: [
                      const Icon(Icons.phone_outlined, color: Colors.grey),
                      const SizedBox(width: 8),
                      Text(
                        'Contact number :',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                  const SizedBox(height: 7),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          launchPhone("+201012126866");
                        },
                        child: Text(
                          '+201012126866',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          launchPhone("+201127547535");
                        },
                        child: Text(
                          '+201127547535',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
