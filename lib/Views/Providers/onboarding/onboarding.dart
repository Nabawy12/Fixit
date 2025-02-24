import 'package:flutter/material.dart';
import '../../../Utils/Colors/colors.dart';
import '../../../Utils/Elevated_Button/button.dart';
import '../../../providers_state_mange/settings/settings.dart';
import '../../Login/login.dart';
import '../SignUp/signUP.dart';
import 'package:provider/provider.dart';

class Onboarding_provider extends StatelessWidget {
  static const routeName = "/Onboarding_provider";
  const Onboarding_provider({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<setting_Providers>(context);
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      body: WillPopScope(
        onWillPop: () {
          Navigator.pop(context);
          FocusScope.of(context).unfocus();
          provider.user == "user" ? null : provider.changeUserType();
          return Future.value(true);
        },
        child: Column(
          children: [
            // Image Section (height is fixed)
            Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                height: screenHeight * 0.4, // 40% of screen height
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/service man.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            // Content Section wrapped with SingleChildScrollView
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.05, // 5% of screen width
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 2,
                        width: screenWidth * 0.1, // 10% of screen width
                        decoration:
                            BoxDecoration(color: app_Colors_Light.MainColor),
                      ),
                      SizedBox(
                          height: screenHeight * 0.02), // 2% of screen height
                      Text(
                        "GET MONEY BY ONE CLICK",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                          height: screenHeight * 0.02), // 2% of screen height
                      Text(
                        "Now manage all your service & shop by just one click",
                        style: Theme.of(context).textTheme.bodySmall,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      CustomButton(
                        text: "Login as provider",
                        onPressed: () {
                          if (provider.user == "user") {
                            provider.changeUserType();
                            Navigator.pushNamed(
                                context, Login_Screen.routeName);
                          } else {
                            Navigator.pushNamed(
                                context, Login_Screen.routeName);
                          }
                        },
                      ),
                      SizedBox(
                          height: screenHeight * 0.03), // 3% of screen height
                      provider.user == "user"
                          ? InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, Login_Screen.routeName);
                              },
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 10),
                                alignment: Alignment.center,
                                width: double.infinity,
                                padding: EdgeInsets.all(
                                    screenHeight * 0.02), // 2% of screen height
                                decoration: BoxDecoration(
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                      color: app_Colors_Light.MainColor,
                                      width: 1),
                                ),
                                child: const Text("Login as User"),
                              ),
                            )
                          : Container(),
                      SizedBox(
                          height: screenHeight * 0.03), // 3% of screen height
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02), // 2% of screen height

            // SignUp link for provider
            provider.user == "provider"
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(width: 5),
                      InkWell(
                        onTap: () => Navigator.pushNamed(
                            context, Signup_provider.routeName),
                        child: Text(
                          "SignUp",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: app_Colors_Light.MainColor),
                        ),
                      ),
                    ],
                  )
                : Container(
                    color: Theme.of(context).cardColor,
                  ),
          ],
        ),
      ),
    );
  }
}
