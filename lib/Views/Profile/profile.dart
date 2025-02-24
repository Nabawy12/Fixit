import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:yourcolor/Utils/Colors/colors.dart';
import 'package:yourcolor/Views/Login/login.dart';
import 'package:yourcolor/Views/Profile/FavouriteList/favourite_list.dart';
import 'package:yourcolor/Views/Profile/Location/location.dart';
import 'package:yourcolor/Views/SignUp/SignUp.dart';
import '../../Widgets/exit/exit.dart';
import '../../generated/l10n.dart';
import '../../providers_state_mange/settings/settings.dart';
import '../Providers/onboarding/onboarding.dart';
import 'AppDetails/appdetails.dart';
import 'MyReviews/myReviews.dart';
import 'RateUs/rate_us.dart';
import 'Setting/setting.dart';
import 'UserProfile/userprofile.dart';

class profile_screen extends StatelessWidget {
  const profile_screen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<setting_Providers>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 100, top: 10),
        child: Container(
          margin: EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //TITLE

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(S.of(context).title_profile,
                      style: Theme.of(context).textTheme.bodyLarge),
                  Spacer(),
                  InkWell(
                    splashColor: Theme.of(context).scaffoldBackgroundColor,
                    highlightColor: Theme.of(context).scaffoldBackgroundColor,
                    onTap: () {
                      Navigator.pushNamed(context, Setting_Screen.routeName);
                    },
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          shape: BoxShape.circle),
                      child: Icon(
                        Icons.settings_outlined,
                        color: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .color!
                            .withOpacity(0.8),
                      ),
                    ),
                  )
                ],
              ),

              SizedBox(
                height: 30,
              ),
              //DETAILS_OF_USER
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Top row with Edit icon at the end
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () => Navigator.pushNamed(
                              context, Userprofile.routeName),
                          child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                shape: BoxShape.circle),
                            child: Icon(
                              Icons.edit,
                              color: app_Colors_Light.MainColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),

                    // Profile image
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: app_Colors_Light.Strok_color, width: 2)),
                      child: CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage('assets/images/forget.png'),
                      ),
                    ),
                    SizedBox(height: 10),

                    // Name
                    Text(
                      'Zeyad Nabawy',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),

                    // Email
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.email_outlined,
                          size: 16,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 5),
                        Text(
                          'ZeaydNabawy118@gmail.com',
                          style: TextStyle(
                            color: app_Colors_Light.Second_Text_Light,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 20),

                    // Balance information
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: app_Colors_Light.MainColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            S.of(context).Total_balance,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.white),
                          ),
                          SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('\$152.23',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          color: Colors.white, fontSize: 25)),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                S.of(context).GENERAL,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: app_Colors_Light.MainColor),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(12.0),
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
                      offset:
                          Offset(0, 3), // Positive Y offset for bottom shadow
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    _buildMenuItem(
                      icon: Icons.favorite_border,
                      text: S.of(context).Favourite_list,
                      context: context,
                      onTap: () => Navigator.pushNamed(
                          context, Favourite_List.routeName),
                    ),
                    Divider(color: Theme.of(context).scaffoldBackgroundColor),
                    _buildMenuItem(
                      icon: Icons.location_on_outlined,
                      text: S.of(context).Manage_locations,
                      context: context,
                      onTap: () =>
                          Navigator.pushNamed(context, Location.routeName),
                    ),
                    Divider(color: Theme.of(context).scaffoldBackgroundColor),
                    _buildMenuItem(
                      icon: Icons.rate_review_outlined,
                      text: S.of(context).My_reviews,
                      context: context,
                      onTap: () =>
                          Navigator.pushNamed(context, MyReviews.routeName),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                S.of(context).ABOUT_APP,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: app_Colors_Light.MainColor),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(12.0),
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
                      offset:
                          Offset(0, 3), // Positive Y offset for bottom shadow
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    _buildMenuItem(
                      icon: Icons.mobile_friendly,
                      text: S.of(context).App_details,
                      body_text: S.of(context).body_details_app,
                      context: context,
                      onTap: () =>
                          Navigator.pushNamed(context, Appdetails.routeName),
                    ),
                    Divider(color: Theme.of(context).scaffoldBackgroundColor),
                    _buildMenuItem(
                      icon: Icons.star_border_outlined,
                      text: S.of(context).Rate_Us,
                      context: context,
                      onTap: () =>
                          Navigator.pushNamed(context, RateUs.routeName),
                    ),
                    Divider(color: Theme.of(context).scaffoldBackgroundColor),
                    _buildMenuItem(
                        icon: Icons.share,
                        text: S.of(context).Share_app,
                        context: context,
                        onTap: () {
                          Share.share('https://facebook.com/zeyadnabawy12');
                        }),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  provider.changeNavigateAt();
                  provider.changeUserType();
                  Navigator.pushNamed(
                    context,
                    Onboarding_provider.routeName,
                  );
                },
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
                  decoration: BoxDecoration(
                    color: app_Colors_Light.MainColor.withOpacity(
                        0.07), // Light background color
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Row(
                    children: [
                      // Profile Image (Circular Avatar)
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: app_Colors_Light.MainColor.withOpacity(
                              0.2), // Background color for the avatar
                        ),
                        child: Icon(
                          Icons.person, // Replace with an image if available
                          color: app_Colors_Light.MainColor,
                          size: 28,
                        ),
                      ),
                      SizedBox(
                          width: 12.0), // Space between the avatar and the text

                      // Main Text
                      Expanded(
                        child: Text(
                          S.of(context).Become_provider,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: app_Colors_Light.MainColor),
                        ),
                      ),

                      // Trailing Arrow Icon
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                        color: app_Colors_Light.MainColor.withOpacity(0.9),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return CustomExitDialog(context: context);
                    },
                  );
                },
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
                  decoration: BoxDecoration(
                    color:
                        Colors.red.withOpacity(0.07), // Light background color
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Row(
                    children: [
                      // Profile Image (Circular Avatar)
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red.withOpacity(
                              0.2), // Background color for the avatar
                        ),
                        child: Icon(
                          Icons
                              .logout_outlined, // Replace with an image if available
                          color: Colors.red,
                          size: 28,
                        ),
                      ),
                      SizedBox(
                          width: 12.0), // Space between the avatar and the text

                      // Main Text
                      Expanded(
                        child: Text(S.of(context).Log_Out,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.red)),
                      ),

                      // Trailing Arrow Icon
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                        color: Colors.red.withOpacity(0.9),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 35,
              ),
              //
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String text,
    String? body_text, // Optional parameter for subtitle
    required BuildContext context,
    VoidCallback? onTap, // Optional onTap parameter
  }) {
    return ListTile(
      leading: Container(
        padding: EdgeInsets.all(8),
        child: Icon(
          icon,
          color:
              Theme.of(context).textTheme.bodyMedium!.color!.withOpacity(0.7),
        ),
      ),
      title: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(fontWeight: FontWeight.w600),
      ),
      subtitle: body_text != null
          ? Text(
              body_text,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(fontSize: 11, fontWeight: FontWeight.w500),
            )
          : null,
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 18,
        color: Theme.of(context).textTheme.bodyMedium!.color!.withOpacity(0.7),
      ),
      onTap: onTap, // onTap is optional
    );
  }

  void _showExitDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
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
                  S.of(context).Exit_title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontSize: 17),
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
                            border:
                                Border.all(color: app_Colors_Light.MainColor),
                            shape: BoxShape.rectangle),
                        child: Text(
                          S.of(context).Exit_button_1,
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
                          S.of(context).Log_Out,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(fontSize: 14),
                        ),
                      ),
                    )),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
