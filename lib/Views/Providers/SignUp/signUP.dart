import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:yourcolor/Utils/Elevated_Button/button.dart';
import '../../../Utils/Colors/colors.dart';
import '../../../Utils/Text_Form_Field/text_field.dart';
import '../../../generated/l10n.dart';
import '../../../providers_state_mange/settings/settings.dart';
import '../../ForgetPassword/ForgetPassword.dart';
import '../../NavBar/navbar.dart';
import '../../SignUp/SignUp.dart';

class Signup_provider extends StatefulWidget {
  static const routeName = "/Signup_provider";
  const Signup_provider({super.key});

  @override
  State<Signup_provider> createState() => _Signup_providerState();
}

class _Signup_providerState extends State<Signup_provider> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();

  double _progress = 0.5;
  PageController _pageController = PageController();

  String _selectedType = "Select type";

  void _increaseProgress() {
    setState(() {
      // Ensure progress is between 0.0 and 1.0
      _progress = (_progress + 0.1).clamp(0.0, 1.0);
    });
  }

  void _toggleType() {
    setState(() {
      _selectedType = _selectedType == "Male" ? "Female" : "Male";
    });
  }

  File? _image;

  // Explicitly choose the gallery
  Future<void> _pickImage() async {
    final picker = ImagePicker();

    // Open the gallery and allow the user to pick an image
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path); // Update the selected image
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<setting_Providers>(context);
    return Scaffold(
      body: Column(
        children: [
          // Fixed content: App Bar and Progress Bar
          SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20),
                    // App Bar
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          splashColor:
                              Theme.of(context).scaffoldBackgroundColor,
                          highlightColor:
                              Theme.of(context).scaffoldBackgroundColor,
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
                              color:
                                  Theme.of(context).textTheme.bodyMedium!.color,
                            ),
                          ),
                        ),
                        Spacer(),
                        Text(
                          S.of(context).SIGNUP_title,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Spacer(),
                      ],
                    ),
                    SizedBox(height: 20),
                    // Progress Bar with Animation
                    Stack(
                      children: [
                        // Background progress bar
                        Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        // Foreground progress indicator with AnimatedContainer
                        AnimatedContainer(
                          duration: Duration(
                              milliseconds: 500), // Duration of the animation
                          curve: Curves.easeInOut, // Animation curve
                          height: 50,
                          width: (MediaQuery.of(context).size.width * _progress)
                                  .isFinite
                              ? MediaQuery.of(context).size.width * _progress
                              : 0.0, // Default to 0.0 if the width is not a valid number
                          decoration: BoxDecoration(
                            color: app_Colors_Light.MainColor,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'Few more steps to earn more',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(fontSize: 11, color: Colors.white),
                          ),
                        ),
                        // Coin icon at the end
                        provider.currentLocale.languageCode == "en"
                            ? Positioned(
                                right: 10,
                                top: 5,
                                child: Icon(Icons.attach_money,
                                    color: Colors.yellow[700], size: 40),
                              )
                            : Positioned(
                                left: 10,
                                top: 5,
                                child: Icon(Icons.attach_money,
                                    color: Colors.yellow[700], size: 40),
                              ),
                      ],
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
          // PageView for the next screens, disabled swipe and use button to navigate
          Expanded(
            child: PageView(
              controller:
                  _pageController, // Controller to manage page navigation
              physics: NeverScrollableScrollPhysics(), // Disable swipe gestures
              children: [
                // First screen (sign up screen)
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Align(
                                  alignment: Alignment.topCenter,
                                  child: Text("PROVIDER DETAILS")),
                              Divider(
                                  color: Theme.of(context)
                                      .scaffoldBackgroundColor),
                              SizedBox(height: 10),
                              // Name Field
                              Row(
                                children: [
                                  Container(
                                    width: 4, // Fixed width for the line
                                    height:
                                        20, // Line height based on responsive text height
                                    decoration: BoxDecoration(
                                      color: app_Colors_Light
                                          .MainColor, // Line color
                                      borderRadius: BorderRadius.circular(
                                          10), // Rounded edges
                                    ),
                                  ),
                                  SizedBox(width: 16),
                                  Text("Owner name",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium),
                                ],
                              ),
                              SizedBox(height: 10),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                child: customTextField(
                                  isRequired: true,
                                  prefixIcon: Icons.person_outline,
                                  context: context,
                                  hintText: "Enter Name",
                                  controller: name,
                                  focusColor:
                                      Theme.of(context).colorScheme.outline,
                                  fillColor:
                                      Theme.of(context).scaffoldBackgroundColor,
                                ),
                              ),
                              SizedBox(height: 16),
                              Row(
                                children: [
                                  Container(
                                    width: 4, // Fixed width for the line
                                    height:
                                        20, // Line height based on responsive text height
                                    decoration: BoxDecoration(
                                      color: app_Colors_Light
                                          .MainColor, // Line color
                                      borderRadius: BorderRadius.circular(
                                          10), // Rounded edges
                                    ),
                                  ),
                                  SizedBox(width: 16),
                                  Text("Phone Number",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium),
                                ],
                              ),
                              SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: customTextField(
                                  isRequired: true,
                                  context: context,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "${S.of(context).phone_vaild}";
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.phone,
                                  hintText:
                                      S.of(context).Phone_Number_text_field,
                                  controller: phone,
                                  prefixIcon: Icons.local_phone_outlined,
                                  fillColor:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  obscureText: false,
                                  hintTextColor: Colors.grey.shade400,
                                  iconColor:
                                      app_Colors_Light.ICon_textForm_color,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                ),
                              ),
                              SizedBox(height: 16),
                              Row(
                                children: [
                                  Container(
                                    width: 4, // Fixed width for the line
                                    height:
                                        20, // Line height based on responsive text height
                                    decoration: BoxDecoration(
                                      color: app_Colors_Light
                                          .MainColor, // Line color
                                      borderRadius: BorderRadius.circular(
                                          10), // Rounded edges
                                    ),
                                  ),
                                  SizedBox(width: 16),
                                  Text("Email",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium),
                                ],
                              ),
                              SizedBox(height: 10),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                child: customTextField(
                                  isRequired: true,
                                  prefixIcon: Icons.email_outlined,
                                  context: context,
                                  hintText: "Enter Email",
                                  controller: name,
                                  focusColor:
                                      Theme.of(context).colorScheme.outline,
                                  fillColor:
                                      Theme.of(context).scaffoldBackgroundColor,
                                ),
                              ),
                              SizedBox(height: 16),
                              Row(
                                children: [
                                  Container(
                                    width: 4, // Fixed width for the line
                                    height:
                                        20, // Line height based on responsive text height
                                    decoration: BoxDecoration(
                                      color: app_Colors_Light
                                          .MainColor, // Line color
                                      borderRadius: BorderRadius.circular(
                                          10), // Rounded edges
                                    ),
                                  ),
                                  SizedBox(width: 16),
                                  Text("Identity type",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium),
                                ],
                              ),
                              SizedBox(height: 10),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                child: InkWell(
                                  onTap:
                                      _toggleType, // Toggle between Male and Female
                                  child: Container(
                                    padding: EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(_selectedType == "Male"
                                            ? Icons.male
                                            : _selectedType == "Female"
                                                ? Icons.female
                                                : Icons.select_all_outlined),
                                        SizedBox(width: 10),
                                        Text(
                                          _selectedType,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 16),
                              Row(
                                children: [
                                  Container(
                                    width: 4, // Fixed width for the line
                                    height:
                                        20, // Line height based on responsive text height
                                    decoration: BoxDecoration(
                                      color: app_Colors_Light
                                          .MainColor, // Line color
                                      borderRadius: BorderRadius.circular(
                                          10), // Rounded edges
                                    ),
                                  ),
                                  SizedBox(width: 16),
                                  Text("Upload Photo",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium),
                                ],
                              ),
                              SizedBox(height: 10),
                              InkWell(
                                onTap: () {
                                  _pickImage(); // Open image picker when tapped
                                },
                                child: _image == null
                                    ? Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 16),
                                        padding: EdgeInsets.all(20),
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            color: Theme.of(context)
                                                .scaffoldBackgroundColor,
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.upload),
                                            SizedBox(height: 10),
                                            Text(
                                              "Upload logo Image",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium,
                                            ),
                                          ],
                                        ),
                                      )
                                    : CircleAvatar(
                                        radius: 60, // Adjust size as needed
                                        backgroundImage: FileImage(_image!),
                                      ), // Show the uploaded image as a circular avatar
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        CustomButton(
                          text: "Next",
                          onPressed: () {
                            // Navigate to the next page
                            _pageController.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeIn,
                            );
                            _increaseProgress();
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
                // Second screen (Black screen)
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("COMPANY DETAILS"),
                              Divider(
                                  color: Theme.of(context)
                                      .scaffoldBackgroundColor),
                              SizedBox(height: 20),
                              // Name Field
                              Row(
                                children: [
                                  Container(
                                    width: 4, // Fixed width for the line
                                    height:
                                        20, // Line height based on responsive text height
                                    decoration: BoxDecoration(
                                      color: app_Colors_Light
                                          .MainColor, // Line color
                                      borderRadius: BorderRadius.circular(
                                          10), // Rounded edges
                                    ),
                                  ),
                                  SizedBox(width: 16),
                                  Text("Upload Logo",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium),
                                ],
                              ),
                              SizedBox(height: 10),
                              InkWell(
                                onTap: () {
                                  _pickImage(); // Open image picker when tapped
                                },
                                child: _image == null
                                    ? Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 16),
                                        padding: EdgeInsets.all(20),
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            color: Theme.of(context)
                                                .scaffoldBackgroundColor,
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.upload),
                                            SizedBox(height: 10),
                                            Text(
                                              "Upload logo Image",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium,
                                            ),
                                          ],
                                        ),
                                      )
                                    : CircleAvatar(
                                        radius: 60, // Adjust size as needed
                                        backgroundImage: FileImage(_image!),
                                      ), // Show the uploaded image as a circular avatar
                              ),
                              SizedBox(height: 16),
                              Row(
                                children: [
                                  Container(
                                    width: 4, // Fixed width for the line
                                    height:
                                        20, // Line height based on responsive text height
                                    decoration: BoxDecoration(
                                      color: app_Colors_Light
                                          .MainColor, // Line color
                                      borderRadius: BorderRadius.circular(
                                          10), // Rounded edges
                                    ),
                                  ),
                                  SizedBox(width: 16),
                                  Text("Company Name",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium),
                                ],
                              ),
                              SizedBox(height: 10),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                child: customTextField(
                                  prefixIcon: Icons.email_outlined,
                                  context: context,
                                  hintText: "Enter Company Name",
                                  controller: name,
                                  focusColor:
                                      Theme.of(context).colorScheme.outline,
                                  fillColor:
                                      Theme.of(context).scaffoldBackgroundColor,
                                ),
                              ),
                              SizedBox(height: 16),
                              Row(
                                children: [
                                  Container(
                                    width: 4, // Fixed width for the line
                                    height:
                                        20, // Line height based on responsive text height
                                    decoration: BoxDecoration(
                                      color: app_Colors_Light
                                          .MainColor, // Line color
                                      borderRadius: BorderRadius.circular(
                                          10), // Rounded edges
                                    ),
                                  ),
                                  SizedBox(width: 16),
                                  Text("Phone Number",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium),
                                ],
                              ),
                              SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: customTextField(
                                  context: context,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "${S.of(context).phone_vaild}";
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.phone,
                                  hintText:
                                      S.of(context).Phone_Number_text_field,
                                  controller: phone,
                                  prefixIcon: Icons.local_phone_outlined,
                                  fillColor:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  obscureText: false,
                                  hintTextColor: Colors.grey.shade400,
                                  iconColor:
                                      app_Colors_Light.ICon_textForm_color,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                ),
                              ),
                              SizedBox(height: 16),
                              Row(
                                children: [
                                  Container(
                                    width: 4, // Fixed width for the line
                                    height:
                                        20, // Line height based on responsive text height
                                    decoration: BoxDecoration(
                                      color: app_Colors_Light
                                          .MainColor, // Line color
                                      borderRadius: BorderRadius.circular(
                                          10), // Rounded edges
                                    ),
                                  ),
                                  SizedBox(width: 16),
                                  Text("Company Email",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium),
                                ],
                              ),
                              SizedBox(height: 10),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                child: customTextField(
                                  prefixIcon: Icons.email_outlined,
                                  context: context,
                                  hintText: "Enter Company Email",
                                  controller: name,
                                  focusColor:
                                      Theme.of(context).colorScheme.outline,
                                  fillColor:
                                      Theme.of(context).scaffoldBackgroundColor,
                                ),
                              ),
                              SizedBox(height: 16),
                              Row(
                                children: [
                                  Container(
                                    width: 4, // Fixed width for the line
                                    height:
                                        20, // Line height based on responsive text height
                                    decoration: BoxDecoration(
                                      color: app_Colors_Light
                                          .MainColor, // Line color
                                      borderRadius: BorderRadius.circular(
                                          10), // Rounded edges
                                    ),
                                  ),
                                  SizedBox(width: 16),
                                  Text("Description",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium),
                                ],
                              ),
                              SizedBox(height: 10),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                child: customTextField(
                                  MaxLines: 5,
                                  context: context,
                                  hintText: "Enter Details",
                                  controller: name,
                                  focusColor:
                                      Theme.of(context).colorScheme.outline,
                                  fillColor:
                                      Theme.of(context).scaffoldBackgroundColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        CustomButton(
                          text: "Finish",
                          onPressed: () {
                            // Navigate to the next page
                            _pageController.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeIn,
                            );
                            _increaseProgress();
                            _increaseProgress();
                            _increaseProgress();
                            _increaseProgress();
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
