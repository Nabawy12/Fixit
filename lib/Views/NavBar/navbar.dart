import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yourcolor/Utils/Colors/colors.dart';

import '../../generated/l10n.dart';
import '../Home/home.dart';
import '../Offer/offer.dart';
import '../Profile/profile.dart';
import '../booking/booking.dart';

class Navbar extends StatefulWidget {
  static const routeName = "/Navbar";

  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  DateTime? lastSwipeTime;
  int swipeCount = 0;
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    home_screen(),
    booking_screen(),
    offer_screen(),
    profile_screen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Action for the FAB
        },
        shape: CircleBorder(),
        backgroundColor: app_Colors_Light.MainColor,
        child: Icon(
          Icons.shopping_basket_outlined,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: WillPopScope(
          onWillPop: () async {
            DateTime now = DateTime.now();
            if (lastSwipeTime == null || now.difference(lastSwipeTime!) > Duration(seconds: 2)) {
              swipeCount = 1;
              lastSwipeTime = now;
              return false;
            } else {
              swipeCount++;
              lastSwipeTime = now;

              if (swipeCount == 2) {
                swipeCount = 0;
                _showExitDialog(context);
                return false;
              } else {
                swipeCount = 0;
                return false;
              }
            }
          },
          child: _screens[_selectedIndex]
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Theme.of(context).cardColor,
        clipBehavior: Clip.hardEdge,
        notchMargin: 8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () => _onItemTapped(0),
              child: Container(
                child: Column(
                  children: [
                    Icon(
                      _selectedIndex == 0 ? Icons.home : Icons.home_outlined,
                      color: _selectedIndex == 0
                          ? app_Colors_Light.MainColor
                          : Colors.grey,
                    ),
                    SizedBox(height: 3,),
                    Text(S.of(context).Home,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: _selectedIndex == 0
                                  ? app_Colors_Light.MainColor
                                  : Colors.grey,
                            ))
                  ],
                ),
              ),
            ),
            InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () => _onItemTapped(1),
              child: Container(
                child: Column(
                  children: [
                    Icon(
                      _selectedIndex == 1
                          ? Icons.bookmark
                          : Icons.bookmark_outline_outlined,
                      color: _selectedIndex == 1
                          ? app_Colors_Light.MainColor
                          : Colors.grey,
                    ),
                    SizedBox(height: 3,),
                    Text(S.of(context).Booking,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: _selectedIndex == 1
                                  ? app_Colors_Light.MainColor
                                  : Colors.grey,
                            ))
                  ],
                ),
              ),
            ),
            SizedBox(width: 40), // Spacer for the FAB
            InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () => _onItemTapped(2),
              child: Container(
                child: Column(
                  children: [
                    Icon(
                      _selectedIndex == 2
                          ? Icons.local_offer
                          : Icons.local_offer_outlined,
                      color: _selectedIndex == 2
                          ? app_Colors_Light.MainColor
                          : Colors.grey,
                    ),
                    SizedBox(height: 3,),

                    Text(S.of(context).Offer,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: _selectedIndex == 2
                                  ? app_Colors_Light.MainColor
                                  : Colors.grey,
                            ))
                  ],
                ),
              ),
            ),
            InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () => _onItemTapped(3),
              child: Container(
                child: Column(
                  children: [
                    Icon(
                      _selectedIndex == 3 ? Icons.person : Icons.person_outline,
                      color: _selectedIndex == 3
                          ? app_Colors_Light.MainColor
                          : Colors.grey,
                    ),
                    SizedBox(height: 3,),

                    Text(
                        S.of(context).Profile,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: _selectedIndex == 3
                                  ? app_Colors_Light.MainColor
                                  : Colors.grey,
                            ))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showExitDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () {
            SystemNavigator.pop();
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
                      onTap: () => SystemNavigator.pop(),
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        decoration: BoxDecoration(
                            color: app_Colors_Light.MainColor,
                            borderRadius: BorderRadius.circular(12),
                            shape: BoxShape.rectangle),
                        child: Text(
                          S.of(context).Exit_button_2,
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
