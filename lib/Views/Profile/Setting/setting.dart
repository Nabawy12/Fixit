  import 'package:flutter/material.dart';
  import 'package:provider/provider.dart';
  import 'package:yourcolor/Utils/Colors/colors.dart';
import 'package:yourcolor/Views/Profile/Setting/ChangeLange/change_lange.dart';

import '../../../generated/l10n.dart';
import '../../../providers/settings/settings.dart';
import 'ChangePassword/changepassword.dart';


  class Setting_Screen extends StatefulWidget {
    static const routeName = "Setting_Screen";

    @override
    State<Setting_Screen> createState() => _Setting_ScreenState();
  }

  class _Setting_ScreenState extends State<Setting_Screen> {
    bool switchh = false;

    @override
    Widget build(BuildContext context) {
      final settingProvider = Provider.of<setting_Providers>(context);
      return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: 20,),
              Row(
                children: [
                  InkWell(
                    splashColor: Theme.of(context).scaffoldBackgroundColor,
                    highlightColor: Theme.of(context).scaffoldBackgroundColor,
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.arrow_back_ios_new,
                        color: Theme.of(context).textTheme.bodyMedium!.color!.withOpacity(0.8),
                      ),
                    ),
                  ),
                  Spacer(),
                  Text  (
                    S.of(context).App_Setting,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Spacer(),
                ],
              ),
              SizedBox(height: 40,),
              Container(
                height: 320,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [

                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                        child: Icon(Icons.dark_mode,color: Theme.of(context).textTheme.bodyLarge!.color,),
                      ),
                      title: Text(
                        S.of(context).Dark_theme,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      trailing: Switch(
                        inactiveTrackColor: app_Colors_Light.BG_Card_color,
                        inactiveThumbColor: Colors.grey,
                        trackOutlineColor: WidgetStatePropertyAll(app_Colors_Light.BG_Card_color),
                        activeColor: app_Colors_Light.MainColor,
                        value: settingProvider.currentTheme == ThemeMode.light ? false : true ,
                        onChanged: (value) {
                         switchh == false ?
                          setState(() {
                            settingProvider.changeCurrentTheme(ThemeMode.dark);
                            switchh = !switchh;
                          }):
                              setState(() {
                                settingProvider.changeCurrentTheme(ThemeMode.light);
                                switchh = !switchh;
                              });
                        },
                      ),
                    ),
                    Divider(color: Theme.of(context).cardColor,),

                    // Change Currency Option
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                        child: Icon(Icons.monetization_on,color: Theme.of(context).textTheme.bodyLarge!.color,),
                      ),
                      title: Text(
                        S.of(context).Change_currency,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      trailing: Icon(Icons.arrow_forward_ios,
                        color: Theme.of(context).textTheme.bodyMedium!.color!.withOpacity(0.8),
                      ),
                      onTap: () {
                        // Navigate to Change Currency screen
                      },
                    ),
                    Divider(color: Theme.of(context).cardColor),

                    // Change Language Option
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                        child: Icon(Icons.language,color: Theme.of(context).textTheme.bodyLarge!.color,),
                      ),
                      title: Text(
                        S.of(context).Change_Language,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      trailing: Icon(Icons.arrow_forward_ios,
                        color: Theme.of(context).textTheme.bodyMedium!.color!.withOpacity(0.8),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, ChangeLange.routeName);
                      },
                    ),
                    Divider(color: Theme.of(context).cardColor),

                    // Change Password Option
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                        child: Icon(Icons.lock,color: Theme.of(context).textTheme.bodyLarge!.color,),
                      ),
                      title: Text(
                        S.of(context).Forget_password_settings,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      trailing: Icon(Icons.arrow_forward_ios,
                        color: Theme.of(context).textTheme.bodyMedium!.color!.withOpacity(0.8),
                      ),
                      onTap: () {

                        Navigator.pushNamed(context, changePassword.routeName);
                      },
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
