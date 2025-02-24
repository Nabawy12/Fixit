import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:yourcolor/Utils/Colors/colors.dart';

import '../../generated/l10n.dart';
import '../../providers_state_mange/settings/settings.dart';
import '../Home/home.dart';
import '../Offer/offer.dart';
import '../Profile/profile.dart';
import '../Providers/AddNew_Services/add_new_services.dart';
import '../Providers/Home/home.dart';
import '../Providers/profile_po/profile.dart';
import '../Providers/wallet/walet.dart';
import '../booking/booking.dart';

class Navbar extends StatefulWidget {
  static const routeName = "/Navbar";

  const Navbar({super.key});

  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  DateTime? lastSwipeTime;
  int swipeCount = 0;
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<setting_Providers>(context);
    final List<Widget> screens = [
      provider.user == "user" ? const home_screen() : const home_provider(),
      const booking_screen(),
      provider.user == "user" ? const offer_screen() : const Walet(),
      provider.user == "user"
          ? const profile_screen()
          : const Profile_provider(),
    ];

    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      extendBody: true,
      resizeToAvoidBottomInset: false,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        onPressed: () {
          provider.user == "user"
              ? print("USER")
              : Navigator.pushNamed(context, AddNewServices.routeName);
          // Action for the FAB
        },
        shape: const CircleBorder(),
        backgroundColor: app_Colors_Light.MainColor,
        child: Icon(
          provider.user == "user"
              ? Icons.shopping_basket_outlined
              : Icons.add_outlined,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: WillPopScope(
          onWillPop: () async {
            DateTime now = DateTime.now();

            // إذا مر وقت طويل بين السحب الأخير والوقت الحالي
            if (lastSwipeTime == null ||
                now.difference(lastSwipeTime!) > const Duration(seconds: 2)) {
              swipeCount = 1; // أول سحب
              lastSwipeTime = now;
              setState(() {
                _selectedIndex = 0; // الرجوع إلى الـ index 0
              });
              return false;
            } else {
              swipeCount++; // زيادة عدد السحبات
              lastSwipeTime = now;

              if (_selectedIndex != 0) {
                setState(() {
                  _selectedIndex = 0; // الرجوع إلى الـ index 0
                });
                return false; // إذا كان الـ index ليس 0 نرجع للـ index 0
              } else {
                if (swipeCount == 2) {
                  swipeCount = 0; // عند السحب الثاني
                  _showExitDialog(context); // عرض الـ dialog
                  return false; // منع الرجوع
                } else {
                  swipeCount = 0; // إعادة تعيين عدد السحبات في المرة الأولى
                  return false;
                }
              }
            }
          },
          child: screens[_selectedIndex]),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        shape: const CircularNotchedRectangle(),
        color: Theme.of(context).cardColor,
        clipBehavior: Clip.hardEdge,
        notchMargin: 5,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () => _onItemTapped(0),
              child: Column(
                children: [
                  Icon(
                    _selectedIndex == 0 ? Icons.home : Icons.home_outlined,
                    color: _selectedIndex == 0
                        ? app_Colors_Light.MainColor
                        : Colors.grey,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(S.of(context).Home,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: _selectedIndex == 0
                                ? app_Colors_Light.MainColor
                                : Colors.grey,
                          ))
                ],
              ),
            ),
            InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () => _onItemTapped(1),
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
                  const SizedBox(
                    height: 3,
                  ),
                  Text(S.of(context).Booking,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: _selectedIndex == 1
                                ? app_Colors_Light.MainColor
                                : Colors.grey,
                          ))
                ],
              ),
            ),
            const SizedBox(width: 40), // Spacer for the FAB
            InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () => _onItemTapped(2),
              child: Column(
                children: [
                  provider.user == "user"
                      ? Icon(
                          _selectedIndex == 2
                              ? Icons.local_offer
                              : Icons.local_offer_outlined,
                          color: _selectedIndex == 2
                              ? app_Colors_Light.MainColor
                              : Colors.grey,
                        )
                      : Icon(
                          _selectedIndex == 2
                              ? Icons.wallet_outlined
                              : Icons.wallet,
                          color: _selectedIndex == 2
                              ? app_Colors_Light.MainColor
                              : Theme.of(context).textTheme.bodySmall!.color,
                        ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(provider.user == "user" ? S.of(context).Offer : "Wallet",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: _selectedIndex == 2
                                ? app_Colors_Light.MainColor
                                : Colors.grey,
                          ))
                ],
              ),
            ),
            InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () => _onItemTapped(3),
              child: Column(
                children: [
                  Icon(
                    _selectedIndex == 3 ? Icons.person : Icons.person_outline,
                    color: _selectedIndex == 3
                        ? app_Colors_Light.MainColor
                        : Colors.grey,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(S.of(context).Profile,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: _selectedIndex == 3
                                ? app_Colors_Light.MainColor
                                : Colors.grey,
                          ))
                ],
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
            contentPadding: const EdgeInsets.all(16),
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
                const SizedBox(height: 20),
                Image.asset("assets/images/log_out.png"),
                const SizedBox(height: 20),
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
                    const SizedBox(
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
