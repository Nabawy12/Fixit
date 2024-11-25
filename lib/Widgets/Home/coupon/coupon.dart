import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yourcolor/Utils/Colors/colors.dart';

import '../../../providers_state_mange/settings/settings.dart';

class CouponCard extends StatelessWidget {
  final String bank;
  final String code;
  final String discount;

  const CouponCard({
    required this.bank,
    required this.code,
    required this.discount,
  });

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<setting_Providers>(context);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Theme.of(context).colorScheme.outline),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Row(
          children: [
            // Left Section
            Expanded(
              flex: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: app_Colors_Light.MainColor,
                    child: Icon(
                      Icons.account_balance,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          bank,
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 13),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Use code $code",
                          style: Theme.of(context).textTheme.bodySmall,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Dashed Divider (No height constraint)
            Container(
              width: 1,
              margin: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                ),
              ),
            ),
            // Right Section with Discount
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                discount,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: app_Colors_Light.MainColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
