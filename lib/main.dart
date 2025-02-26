import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:yourcolor/Utils/Colors/colors.dart';
import 'package:yourcolor/Views/NavBar/navbar.dart';
import 'package:yourcolor/Views/Splash/splash.dart';
import 'package:yourcolor/providers_state_mange/settings/settings.dart';
import 'Utils/Dark_Mode/dark_mode.dart';
import 'Views/All_Category/all_category.dart';
import 'Views/Details_provider/details_provider.dart';
import 'Views/ForgetPassword/OTP/otp.dart';
import 'Views/ForgetPassword/RseetPassword.dart';
import 'Views/Login/login.dart';
import 'Views/OnBoarding/on_boarding.dart';
import 'Views/ForgetPassword/ForgetPassword.dart';
import 'Views/Profile/AppDetails/AboutUs/aboutus.dart';
import 'Views/Profile/AppDetails/CancelPolicy/cancel_policy.dart';
import 'Views/Profile/AppDetails/ContactUs/contactUs.dart';
import 'Views/Profile/AppDetails/Help_Support/help_Support.dart';
import 'Views/Profile/AppDetails/RefundPolicy/refund_policy.dart';
import 'Views/Profile/AppDetails/appdetails.dart';
import 'Views/Profile/AppDetails/privacy_policy/privacy_policy.dart';
import 'Views/Profile/FavouriteList/favourite_list.dart';
import 'Views/Profile/Location/location.dart';
import 'Views/Profile/MyReviews/myReviews.dart';
import 'Views/Profile/RateUs/rate_us.dart';
import 'Views/Profile/Setting/ChangeLange/change_lange.dart';
import 'Views/Profile/Setting/ChangePassword/changepassword.dart';
import 'Views/Profile/Setting/setting.dart';
import 'Views/Profile/UserProfile/userprofile.dart';
import 'Views/Providers/AddNew_Services/add_new_services.dart';
import 'Views/Providers/SignUp/signUP.dart';
import 'Views/Providers/SingleService/all review/all_reviews.dart';
import 'Views/Providers/SingleService/singleservice.dart';
import 'Views/Providers/onboarding/onboarding.dart';
import 'Views/Providers/profile_po/CompanyDetails/company_details.dart';
import 'Views/SignUp/SignUp.dart';
import 'Views/single_services/single_services.dart';
import 'Widgets/Home/bookings/Details_booking/details_booking.dart';
import 'Widgets/Main/style_navigate.dart';
import 'generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(ChangeNotifierProvider(
    create: (context) => setting_Providers(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<setting_Providers>(context);
    return MaterialApp(
      title: "FixIt",
      color: app_Colors_Light.MainColor,
      debugShowCheckedModeBanner: false,
      themeMode: provider.currentTheme,
      theme: style_mode.LightTheme,
      darkTheme: style_mode.DarkTheme,
      locale: provider.currentLocale,
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      initialRoute: Splash_Screen.routeName,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case Splash_Screen.routeName:
            return createSlideRoute(const Splash_Screen(), TransitionType.fade);
          case Onboarding_Screen.routeName:
            return createSlideRoute(
                const Onboarding_Screen(), TransitionType.scale);
          case Login_Screen.routeName:
            return createSlideRoute(Login_Screen(), TransitionType.slide);
          case Forget_Password_Screen.routeName:
            return createSlideRoute(
                Forget_Password_Screen(),
                provider.currentLocale.languageCode == "en"
                    ? TransitionType.rightToLeft
                    : TransitionType.leftToRight);
          case OTP_Screen.routeName:
            return createSlideRoute(OTP_Screen(), TransitionType.bottomToTop);
          case Reset_Password_Screen.routeName:
            return createSlideRoute(
                Reset_Password_Screen(),
                provider.currentLocale.languageCode == "en"
                    ? TransitionType.rightToLeft
                    : TransitionType.leftToRight);
          case SignUp_Screen.routeName:
            return createSlideRoute(SignUp_Screen(), TransitionType.fade);
          case Navbar.routeName:
            return createSlideRoute(Navbar(), TransitionType.scale);
          case Setting_Screen.routeName:
            return createSlideRoute(Setting_Screen(), TransitionType.slide);
          case ChangeLange.routeName:
            return createSlideRoute(
                const ChangeLange(),
                provider.currentLocale.languageCode == "en"
                    ? TransitionType.rightToLeft
                    : TransitionType.leftToRight);
          case changePassword.routeName:
            return createSlideRoute(
                const changePassword(),
                provider.currentLocale.languageCode == "en"
                    ? TransitionType.rightToLeft
                    : TransitionType.leftToRight);
          case Userprofile.routeName:
            return createSlideRoute(const Userprofile(), TransitionType.scale);
          case Favourite_List.routeName:
            return createSlideRoute(
                Favourite_List(),
                provider.currentLocale.languageCode == "en"
                    ? TransitionType.rightToLeft
                    : TransitionType.leftToRight);
          case Appdetails.routeName:
            return createSlideRoute(
                const Appdetails(),
                provider.currentLocale.languageCode == "en"
                    ? TransitionType.rightToLeft
                    : TransitionType.leftToRight);
          case Contactus.routeName:
            return createSlideRoute(
                const Contactus(),
                provider.currentLocale.languageCode == "en"
                    ? TransitionType.rightToLeft
                    : TransitionType.leftToRight);
          case MyReviews.routeName:
            return createSlideRoute(
                const MyReviews(),
                provider.currentLocale.languageCode == "en"
                    ? TransitionType.rightToLeft
                    : TransitionType.leftToRight);
          case Location.routeName:
            return createSlideRoute(
                const Location(),
                provider.currentLocale.languageCode == "en"
                    ? TransitionType.rightToLeft
                    : TransitionType.leftToRight);
          case HelpSupport.routeName:
            return createSlideRoute(
                const HelpSupport(),
                provider.currentLocale.languageCode == "en"
                    ? TransitionType.rightToLeft
                    : TransitionType.leftToRight);
          case RateUs.routeName:
            return createSlideRoute(
                const RateUs(),
                provider.currentLocale.languageCode == "en"
                    ? TransitionType.rightToLeft
                    : TransitionType.leftToRight);
          case Aboutus.routeName:
            return createSlideRoute(
                const Aboutus(),
                provider.currentLocale.languageCode == "en"
                    ? TransitionType.rightToLeft
                    : TransitionType.leftToRight);
          case PrivacyPolicy.routeName:
            return createSlideRoute(
                const PrivacyPolicy(),
                provider.currentLocale.languageCode == "en"
                    ? TransitionType.rightToLeft
                    : TransitionType.leftToRight);
          case CancelPolicy.routeName:
            return createSlideRoute(
                const CancelPolicy(),
                provider.currentLocale.languageCode == "en"
                    ? TransitionType.rightToLeft
                    : TransitionType.leftToRight);
          case RefundPolicy.routeName:
            return createSlideRoute(
                const RefundPolicy(),
                provider.currentLocale.languageCode == "en"
                    ? TransitionType.rightToLeft
                    : TransitionType.leftToRight);
          case Onboarding_provider.routeName:
            return createSlideRoute(
                const Onboarding_provider(),
                provider.currentLocale.languageCode == "en"
                    ? TransitionType.rightToLeft
                    : TransitionType.leftToRight);
          case Signup_provider.routeName:
            return createSlideRoute(
                const Signup_provider(),
                provider.currentLocale.languageCode == "en"
                    ? TransitionType.rightToLeft
                    : TransitionType.leftToRight);
          case CompanyDetails_profile.routeName:
            return createSlideRoute(
                const CompanyDetails_profile(),
                provider.currentLocale.languageCode == "en"
                    ? TransitionType.rightToLeft
                    : TransitionType.leftToRight);
          case AddNewServices.routeName:
            return createSlideRoute(
                const AddNewServices(), TransitionType.slide);
          case Singleservice_Pro.routeName:
            return createSlideRoute(
                const Singleservice_Pro(),
                provider.currentLocale.languageCode == "en"
                    ? TransitionType.rightToLeft
                    : TransitionType.leftToRight);
          case AllReviewsScreen.routeName:
            return createSlideRoute(
                const AllReviewsScreen(),
                provider.currentLocale.languageCode == "en"
                    ? TransitionType.rightToLeft
                    : TransitionType.leftToRight);
          case DetailsBooking.routeName:
            return createSlideRoute(
                const DetailsBooking(),
                provider.currentLocale.languageCode == "en"
                    ? TransitionType.rightToLeft
                    : TransitionType.leftToRight);
          case AllCategory.routeName:
            return createSlideRoute(const AllCategory(), TransitionType.slide);
          case Singleservice_user.routeName:
            return createSlideRoute(
                const Singleservice_user(),
                provider.currentLocale.languageCode == "en"
                    ? TransitionType.rightToLeft
                    : TransitionType.leftToRight);
          case DetailsProvider.routeName:
            return createSlideRoute(
                const DetailsProvider(),
                provider.currentLocale.languageCode == "en"
                    ? TransitionType.rightToLeft
                    : TransitionType.leftToRight);

          default:
            return null;
        }
      },
    );
  }

  Route createSlideRoute(Widget page, TransitionType type) {
    switch (type) {
      case TransitionType.fade:
        return FadeRoute(page);
      case TransitionType.scale:
        return ScaleRoute(page);
      case TransitionType.slide:
        return SlideRoute(page);
      case TransitionType.rightToLeft:
        return SlideRoute(page,
            begin: const Offset(1.0, 0.0), end: Offset.zero);
      case TransitionType.leftToRight:
        return SlideRoute(page,
            begin: const Offset(-1.0, 0.0), end: Offset.zero);
      case TransitionType.bottomToTop:
        return SlideRoute(page,
            begin: const Offset(0.0, 1.0), end: Offset.zero);
    }
  }
}
