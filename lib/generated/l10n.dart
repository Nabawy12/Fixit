// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Enter`
  String get Enter {
    return Intl.message(
      'Enter',
      name: 'Enter',
      desc: '',
      args: [],
    );
  }

  /// `SKIP`
  String get SKIP {
    return Intl.message(
      'SKIP',
      name: 'SKIP',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to Our App`
  String get onbording_1 {
    return Intl.message(
      'Welcome to Our App',
      name: 'onbording_1',
      desc: '',
      args: [],
    );
  }

  /// `Experience the best service and product with us.`
  String get onbording_des_1 {
    return Intl.message(
      'Experience the best service and product with us.',
      name: 'onbording_des_1',
      desc: '',
      args: [],
    );
  }

  /// `Easy to Use`
  String get onbording_2 {
    return Intl.message(
      'Easy to Use',
      name: 'onbording_2',
      desc: '',
      args: [],
    );
  }

  /// `User-friendly interface and smooth navigation.`
  String get onbording_des_2 {
    return Intl.message(
      'User-friendly interface and smooth navigation.',
      name: 'onbording_des_2',
      desc: '',
      args: [],
    );
  }

  /// `Stay Connected.`
  String get onbording_3 {
    return Intl.message(
      'Stay Connected.',
      name: 'onbording_3',
      desc: '',
      args: [],
    );
  }

  /// `Stay updated with our latest features and offers.`
  String get onbording_des_3 {
    return Intl.message(
      'Stay updated with our latest features and offers.',
      name: 'onbording_des_3',
      desc: '',
      args: [],
    );
  }

  /// `LOGIN`
  String get Login_title {
    return Intl.message(
      'LOGIN',
      name: 'Login_title',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get Login_email_title_text_field {
    return Intl.message(
      'Email',
      name: 'Login_email_title_text_field',
      desc: '',
      args: [],
    );
  }

  /// `Enter email address`
  String get Login_email_text_field_hint {
    return Intl.message(
      'Enter email address',
      name: 'Login_email_text_field_hint',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get Login_title_password {
    return Intl.message(
      'Password',
      name: 'Login_title_password',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get Login_title_password_text_field {
    return Intl.message(
      'Enter your password',
      name: 'Login_title_password_text_field',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get Login_title_Confirm_Password {
    return Intl.message(
      'Confirm Password',
      name: 'Login_title_Confirm_Password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get Login_title_Confirm_Password_text_field {
    return Intl.message(
      'Confirm Password',
      name: 'Login_title_Confirm_Password_text_field',
      desc: '',
      args: [],
    );
  }

  /// `Login again`
  String get Login_again {
    return Intl.message(
      'Login again',
      name: 'Login_again',
      desc: '',
      args: [],
    );
  }

  /// `Forget password?`
  String get Forget_password {
    return Intl.message(
      'Forget password?',
      name: 'Forget_password',
      desc: '',
      args: [],
    );
  }

  /// `Not a member?`
  String get Not_member {
    return Intl.message(
      'Not a member?',
      name: 'Not_member',
      desc: '',
      args: [],
    );
  }

  /// `SIGNUP`
  String get SIGNUP_title {
    return Intl.message(
      'SIGNUP',
      name: 'SIGNUP_title',
      desc: '',
      args: [],
    );
  }

  /// `User name`
  String get User_name_title {
    return Intl.message(
      'User name',
      name: 'User_name_title',
      desc: '',
      args: [],
    );
  }

  /// `Enter Name`
  String get User_name_text_field {
    return Intl.message(
      'Enter Name',
      name: 'User_name_text_field',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get Phone_Number_title {
    return Intl.message(
      'Phone Number',
      name: 'Phone_Number_title',
      desc: '',
      args: [],
    );
  }

  /// `Enter Phone`
  String get Phone_Number_text_field {
    return Intl.message(
      'Enter Phone',
      name: 'Phone_Number_text_field',
      desc: '',
      args: [],
    );
  }

  /// `Agree With terms & condition`
  String get Terms_agree {
    return Intl.message(
      'Agree With terms & condition',
      name: 'Terms_agree',
      desc: '',
      args: [],
    );
  }

  /// `Already member?`
  String get Already_member {
    return Intl.message(
      'Already member?',
      name: 'Already_member',
      desc: '',
      args: [],
    );
  }

  /// `You Must Active`
  String get Active {
    return Intl.message(
      'You Must Active',
      name: 'Active',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your register mail`
  String get Forget_Password_des {
    return Intl.message(
      'Enter Your register mail',
      name: 'Forget_Password_des',
      desc: '',
      args: [],
    );
  }

  /// `Send OTP`
  String get Send_OTP {
    return Intl.message(
      'Send OTP',
      name: 'Send_OTP',
      desc: '',
      args: [],
    );
  }

  /// `VERIFY OTP`
  String get VERIFY_OTP {
    return Intl.message(
      'VERIFY OTP',
      name: 'VERIFY_OTP',
      desc: '',
      args: [],
    );
  }

  /// `Enter the verification code that sent to you on`
  String get VERIFY_OTP_des {
    return Intl.message(
      'Enter the verification code that sent to you on',
      name: 'VERIFY_OTP_des',
      desc: '',
      args: [],
    );
  }

  /// `Resend Code ?`
  String get VERIFY_OTP_resend {
    return Intl.message(
      'Resend Code ?',
      name: 'VERIFY_OTP_resend',
      desc: '',
      args: [],
    );
  }

  /// `RESET PASSWORD`
  String get RESET_PASSWORD {
    return Intl.message(
      'RESET PASSWORD',
      name: 'RESET_PASSWORD',
      desc: '',
      args: [],
    );
  }

  /// `Hello, you have been missed !`
  String get RESET_PASSWORD_des {
    return Intl.message(
      'Hello, you have been missed !',
      name: 'RESET_PASSWORD_des',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get New_Password_text_field {
    return Intl.message(
      'New Password',
      name: 'New_Password_text_field',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get New_Password_text_field_content {
    return Intl.message(
      'New Password',
      name: 'New_Password_text_field_content',
      desc: '',
      args: [],
    );
  }

  /// `Successfully changed`
  String get Successfully_changed {
    return Intl.message(
      'Successfully changed',
      name: 'Successfully_changed',
      desc: '',
      args: [],
    );
  }

  /// `Thank you! The attempt to reset your password was successful.`
  String get Successfully_changed_des {
    return Intl.message(
      'Thank you! The attempt to reset your password was successful.',
      name: 'Successfully_changed_des',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to exit?`
  String get Exit_title {
    return Intl.message(
      'Are you sure you want to exit?',
      name: 'Exit_title',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get Exit_button_1 {
    return Intl.message(
      'Cancel',
      name: 'Exit_button_1',
      desc: '',
      args: [],
    );
  }

  /// `Exit`
  String get Exit_button_2 {
    return Intl.message(
      'Exit',
      name: 'Exit_button_2',
      desc: '',
      args: [],
    );
  }

  /// `Username cannot be empty`
  String get userName_vaild {
    return Intl.message(
      'Username cannot be empty',
      name: 'userName_vaild',
      desc: '',
      args: [],
    );
  }

  /// `Email cannot be empty`
  String get Email_vaild {
    return Intl.message(
      'Email cannot be empty',
      name: 'Email_vaild',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number cannot be empty`
  String get phone_vaild {
    return Intl.message(
      'Phone Number cannot be empty',
      name: 'phone_vaild',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number cannot be empty`
  String get password_vaild {
    return Intl.message(
      'Phone Number cannot be empty',
      name: 'password_vaild',
      desc: '',
      args: [],
    );
  }

  /// `Password can not be no less than 8`
  String get password_less_vaild {
    return Intl.message(
      'Password can not be no less than 8',
      name: 'password_less_vaild',
      desc: '',
      args: [],
    );
  }

  /// `Password did not match`
  String get password_not_match {
    return Intl.message(
      'Password did not match',
      name: 'password_not_match',
      desc: '',
      args: [],
    );
  }

  /// `If you log out, you will not be able to change your password`
  String get exit_reset {
    return Intl.message(
      'If you log out, you will not be able to change your password',
      name: 'exit_reset',
      desc: '',
      args: [],
    );
  }

  /// `Continue as a guest`
  String get Continue_guest {
    return Intl.message(
      'Continue as a guest',
      name: 'Continue_guest',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get Home {
    return Intl.message(
      'Home',
      name: 'Home',
      desc: '',
      args: [],
    );
  }

  /// `Booking`
  String get Booking {
    return Intl.message(
      'Booking',
      name: 'Booking',
      desc: '',
      args: [],
    );
  }

  /// `Offer`
  String get Offer {
    return Intl.message(
      'Offer',
      name: 'Offer',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get Profile {
    return Intl.message(
      'Profile',
      name: 'Profile',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password`
  String get Forget_pass_screen {
    return Intl.message(
      'Forget Password',
      name: 'Forget_pass_screen',
      desc: '',
      args: [],
    );
  }

  /// `Current Password`
  String get Current_Password {
    return Intl.message(
      'Current Password',
      name: 'Current_Password',
      desc: '',
      args: [],
    );
  }

  /// `Change Language`
  String get Change_Language {
    return Intl.message(
      'Change Language',
      name: 'Change_Language',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get Arabic {
    return Intl.message(
      'Arabic',
      name: 'Arabic',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get English {
    return Intl.message(
      'English',
      name: 'English',
      desc: '',
      args: [],
    );
  }

  /// `App Setting`
  String get App_Setting {
    return Intl.message(
      'App Setting',
      name: 'App_Setting',
      desc: '',
      args: [],
    );
  }

  /// `Dark theme`
  String get Dark_theme {
    return Intl.message(
      'Dark theme',
      name: 'Dark_theme',
      desc: '',
      args: [],
    );
  }

  /// `Change currency`
  String get Change_currency {
    return Intl.message(
      'Change currency',
      name: 'Change_currency',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password`
  String get Forget_password_settings {
    return Intl.message(
      'Forget Password',
      name: 'Forget_password_settings',
      desc: '',
      args: [],
    );
  }

  /// `UserProfile`
  String get UserProfile {
    return Intl.message(
      'UserProfile',
      name: 'UserProfile',
      desc: '',
      args: [],
    );
  }

  /// `Update`
  String get Update {
    return Intl.message(
      'Update',
      name: 'Update',
      desc: '',
      args: [],
    );
  }

  /// `Profile & setting`
  String get title_profile {
    return Intl.message(
      'Profile & setting',
      name: 'title_profile',
      desc: '',
      args: [],
    );
  }

  /// `Total available balance :`
  String get Total_balance {
    return Intl.message(
      'Total available balance :',
      name: 'Total_balance',
      desc: '',
      args: [],
    );
  }

  /// `GENERAL`
  String get GENERAL {
    return Intl.message(
      'GENERAL',
      name: 'GENERAL',
      desc: '',
      args: [],
    );
  }

  /// `Favourite list`
  String get Favourite_list {
    return Intl.message(
      'Favourite list',
      name: 'Favourite_list',
      desc: '',
      args: [],
    );
  }

  /// `Manage locations`
  String get Manage_locations {
    return Intl.message(
      'Manage locations',
      name: 'Manage_locations',
      desc: '',
      args: [],
    );
  }

  /// `My reviews`
  String get My_reviews {
    return Intl.message(
      'My reviews',
      name: 'My_reviews',
      desc: '',
      args: [],
    );
  }

  /// `ABOUT APP`
  String get ABOUT_APP {
    return Intl.message(
      'ABOUT APP',
      name: 'ABOUT_APP',
      desc: '',
      args: [],
    );
  }

  /// `App details`
  String get App_details {
    return Intl.message(
      'App details',
      name: 'App_details',
      desc: '',
      args: [],
    );
  }

  /// `Rate Us`
  String get Rate_Us {
    return Intl.message(
      'Rate Us',
      name: 'Rate_Us',
      desc: '',
      args: [],
    );
  }

  /// `Share app`
  String get Share_app {
    return Intl.message(
      'Share app',
      name: 'Share_app',
      desc: '',
      args: [],
    );
  }

  /// `Become a provider`
  String get Become_provider {
    return Intl.message(
      'Become a provider',
      name: 'Become_provider',
      desc: '',
      args: [],
    );
  }

  /// `ALERT ZONE`
  String get ALERT_ZONE {
    return Intl.message(
      'ALERT ZONE',
      name: 'ALERT_ZONE',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get Log_Out {
    return Intl.message(
      'Log Out',
      name: 'Log_Out',
      desc: '',
      args: [],
    );
  }

  /// `About Us`
  String get About_us {
    return Intl.message(
      'About Us',
      name: 'About_us',
      desc: '',
      args: [],
    );
  }

  /// `Privacy policy`
  String get Privacy_policy {
    return Intl.message(
      'Privacy policy',
      name: 'Privacy_policy',
      desc: '',
      args: [],
    );
  }

  /// `Cancellation policy`
  String get Cancellation_policy {
    return Intl.message(
      'Cancellation policy',
      name: 'Cancellation_policy',
      desc: '',
      args: [],
    );
  }

  /// `Refund policy`
  String get Refund_policy {
    return Intl.message(
      'Refund policy',
      name: 'Refund_policy',
      desc: '',
      args: [],
    );
  }

  /// `Help & support`
  String get Help_support {
    return Intl.message(
      'Help & support',
      name: 'Help_support',
      desc: '',
      args: [],
    );
  }

  /// `Message`
  String get Message {
    return Intl.message(
      'Message',
      name: 'Message',
      desc: '',
      args: [],
    );
  }

  /// `Write Here`
  String get Write_Here {
    return Intl.message(
      'Write Here',
      name: 'Write_Here',
      desc: '',
      args: [],
    );
  }

  /// `Purchase error`
  String get Purchase_error {
    return Intl.message(
      'Purchase error',
      name: 'Purchase_error',
      desc: '',
      args: [],
    );
  }

  /// `Technical error`
  String get Technical_error {
    return Intl.message(
      'Technical error',
      name: 'Technical_error',
      desc: '',
      args: [],
    );
  }

  /// `App Error`
  String get App_Error {
    return Intl.message(
      'App Error',
      name: 'App_Error',
      desc: '',
      args: [],
    );
  }

  /// `Feedback`
  String get Feedback {
    return Intl.message(
      'Feedback',
      name: 'Feedback',
      desc: '',
      args: [],
    );
  }

  /// `Contact US`
  String get Contact_US {
    return Intl.message(
      'Contact US',
      name: 'Contact_US',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get Submit {
    return Intl.message(
      'Submit',
      name: 'Submit',
      desc: '',
      args: [],
    );
  }

  /// `About us policy help & support`
  String get body_details_app {
    return Intl.message(
      'About us policy help & support',
      name: 'body_details_app',
      desc: '',
      args: [],
    );
  }

  /// `Favourite List`
  String get Favourite_List {
    return Intl.message(
      'Favourite List',
      name: 'Favourite_List',
      desc: '',
      args: [],
    );
  }

  /// `Search here`
  String get Search_here {
    return Intl.message(
      'Search here',
      name: 'Search_here',
      desc: '',
      args: [],
    );
  }

  /// `Provider list`
  String get Provider_list {
    return Intl.message(
      'Provider list',
      name: 'Provider_list',
      desc: '',
      args: [],
    );
  }

  /// `Service list`
  String get Service_list {
    return Intl.message(
      'Service list',
      name: 'Service_list',
      desc: '',
      args: [],
    );
  }

  /// `Provider`
  String get Provider {
    return Intl.message(
      'Provider',
      name: 'Provider',
      desc: '',
      args: [],
    );
  }

  /// `Service`
  String get Service {
    return Intl.message(
      'Service',
      name: 'Service',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
