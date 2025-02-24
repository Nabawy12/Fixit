import 'package:flutter/material.dart';

import '../../Utils/Colors/colors.dart';
import '../../Views/Login/login.dart';

class CustomExitDialog extends StatelessWidget {
  final BuildContext context;

  CustomExitDialog({required this.context});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pushNamed(context, Login_Screen.routeName);
        return Future.value(true);
      },
      child: AlertDialog(
        backgroundColor: Theme.of(context).cardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: EdgeInsets.all(16),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'هل أنت متأكد أنك تريد الخروج؟', // Replace this with your localized string
              textAlign: TextAlign.center,
              style:
                  Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 17),
            ),
            SizedBox(height: 20),
            Image.asset("assets/images/log_out.png"),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Cancel Button
                Expanded(
                    child: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                            color:
                                app_Colors_Light.MainColor), // Customize color
                        shape: BoxShape.rectangle),
                    child: Text(
                      'إلغاء', // Replace this with your localized string
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 14),
                    ),
                  ),
                )),
                SizedBox(
                  width: 8,
                ),
                // Exit Button
                Expanded(
                    child: InkWell(
                  onTap: () =>
                      Navigator.pushNamed(context, Login_Screen.routeName),
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    decoration: BoxDecoration(
                        color: app_Colors_Light.MainColor,
                        borderRadius: BorderRadius.circular(12),
                        shape: BoxShape.rectangle),
                    child: Text(
                      'الخروج', // Replace this with your localized string
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 14, color: Colors.white),
                    ),
                  ),
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
