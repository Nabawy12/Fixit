import 'package:flutter/material.dart';
import 'package:yourcolor/Views/Profile/AppDetails/privacy_policy/privacy_policy.dart';

import '../../../generated/l10n.dart';
import 'AboutUs/aboutus.dart';
import 'CancelPolicy/cancel_policy.dart';
import 'ContactUs/contactUs.dart';
import 'Help_Support/help_Support.dart';
import 'RefundPolicy/refund_policy.dart';

class Appdetails extends StatelessWidget {
  static const routeName = "/Appdetails";
  const Appdetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(height: 20),
            Row(
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
                      color: Theme.of(context).textTheme.bodyMedium!.color!.withOpacity(0.8),
                    ),
                  ),
                ),
                const Spacer(),
                Text(
                  S.of(context).App_details,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const Spacer(),
              ],
            ),
            SizedBox(height: 50,),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              padding: EdgeInsets.symmetric(vertical: 16.0),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  // Shadow for the top
                  BoxShadow(
                    color: Theme.of(context).cardColor,
                    spreadRadius: 0,
                    blurRadius: 7,
                    offset: Offset(0, -3), // Negative Y offset for top shadow
                  ),
                  // Shadow for the bottom
                  BoxShadow(
                    color: Theme.of(context).cardColor,
                    spreadRadius: 0,
                    blurRadius: 7,
                    offset: Offset(0, 3), // Positive Y offset for bottom shadow
                  ),
                ],
              ),
              child: Column(
                children: [
                  buildListItem(
                    context,
                    icon: Icons.info_outline,
                    text: S.of(context).About_us,
                    onTap: () => Navigator.pushNamed(context,Aboutus.routeName),
                  ),
                  buildDivider(context),
                  buildListItem(
                    context,
                    icon: Icons.privacy_tip_outlined,
                    text: S.of(context).Privacy_policy,
                    onTap: () => Navigator.pushNamed(context,PrivacyPolicy.routeName),
                  ),
                  buildDivider(context),
                  buildListItem(
                    context,
                    icon: Icons.cancel_outlined,
                    text: S.of(context).Cancellation_policy,
                    onTap: () => Navigator.pushNamed(context,CancelPolicy.routeName),
                  ),
                  buildDivider(context),
                  buildListItem(
                    context,
                    icon: Icons.money_off_outlined,
                    text: S.of(context).Refund_policy,
                    onTap: () => Navigator.pushNamed(context,RefundPolicy.routeName),
                  ),
                  buildDivider(context),
                  buildListItem(
                    context,
                    icon: Icons.support_agent_outlined,
                    text: S.of(context).Help_support,
                    onTap: () => Navigator.pushNamed(context,HelpSupport.routeName),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget buildListItem(BuildContext context, {required IconData icon, required String text, void Function()? onTap}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              child:Icon(
                icon,
                color: Theme.of(context).textTheme.bodyMedium!.color!.withOpacity(0.8),
                size: 24,
              ) ,
            ),
            SizedBox(width: 16),
            Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios_outlined,
              color: Theme.of(context).textTheme.bodyMedium!.color!.withOpacity(0.8),
              size: 18,

            )

          ],
        ),
      ),
    );
  }

  Widget buildDivider(BuildContext context,) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Divider(
        color: Theme.of(context).scaffoldBackgroundColor,
        thickness: 1,
      ),
    );
  }
}
