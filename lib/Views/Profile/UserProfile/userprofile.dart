import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../../../Utils/Colors/colors.dart';
import '../../../Utils/Elevated_Button/button.dart';
import '../../../Utils/Text_Form_Field/text_field.dart';
import '../../../generated/l10n.dart';

class Userprofile extends StatefulWidget {
  static const routeName = "/Userprofile";
  const Userprofile({super.key});

  @override
  State<Userprofile> createState() => _UserprofileState();
}

class _UserprofileState extends State<Userprofile> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController repassword = TextEditingController();
  bool isChecked = false;
  bool showAgreementError = false;
  bool visblePassword = false;
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
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: WillPopScope(
        onWillPop: () {
          Navigator.pop(context);
          FocusScope.of(context).unfocus();
          return Future.value(true);
        },
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Row(
                    children: [
                      InkWell(
                        splashColor: Theme.of(context).scaffoldBackgroundColor,
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
                            color: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .color!
                                .withOpacity(0.8),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        S.of(context).UserProfile,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const Spacer(),
                    ],
                  ),
                  SizedBox(height: 50),

                  // Profile Image and Fields
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: app_Colors_Light.Strok_color,
                                    width: 2,
                                  ),
                                ),
                                child: CircleAvatar(
                                  radius: 40,
                                  backgroundImage: _image != null
                                      ? FileImage(_image!)
                                      : AssetImage('assets/images/person.jpg')
                                          as ImageProvider,
                                ),
                              ),
                              // Positioned icon at the bottom right
                              Positioned(
                                bottom: 0,
                                right: 7,
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap:
                                      _pickImage, // Open gallery on edit icon tap
                                  child: Container(
                                    padding:
                                        EdgeInsets.all(3), // Space around icon
                                    decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.edit_outlined,
                                      color: app_Colors_Light.MainColor,
                                      size: 18, // Adjust size as needed
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 16),

                        // User Name Field
                        Row(
                          children: [
                            Container(
                              width: 4,
                              height: 20,
                              decoration: BoxDecoration(
                                color: app_Colors_Light.MainColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            SizedBox(width: 16),
                            Text(
                              S.of(context).User_name_title,
                              style: Theme.of(context).textTheme.bodyMedium,
                            )
                          ],
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: customTextField(
                            isRequired: true,
                            context: context,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "${S.of(context).userName_vaild}";
                              }
                              return null;
                            },
                            keyboardType: TextInputType.name,
                            hintText: S.of(context).User_name_text_field,
                            controller: username,
                            prefixIcon: Icons.person_2_outlined,
                            fillColor:
                                Theme.of(context).scaffoldBackgroundColor,
                            hintTextColor: Colors.grey.shade400,
                            iconColor: app_Colors_Light.ICon_textForm_color,
                            obscureText: false,
                          ),
                        ),
                        SizedBox(height: 16),

                        // Email Field
                        Row(
                          children: [
                            Container(
                              width: 4,
                              height: 20,
                              decoration: BoxDecoration(
                                color: app_Colors_Light.MainColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            SizedBox(width: 16),
                            Text(
                              S.of(context).Login_email_title_text_field,
                              style: Theme.of(context).textTheme.bodyMedium,
                            )
                          ],
                        ),
                        SizedBox(height: 10),
                        Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: customTextField(
                              isRequired: true,
                              context: context,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return S.of(context).Email_vaild;
                                } else if (!value.contains('@') ||
                                    value.indexOf('@') < 3) {
                                  return "ُEmail not true";
                                }
                                return null;
                              },
                              hintText:
                                  S.of(context).Login_email_text_field_hint,
                              controller: email,
                              prefixIcon: Icons.email_outlined,
                              fillColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                              hintTextColor: Colors.grey.shade400,
                              iconColor: app_Colors_Light.ICon_textForm_color,
                              obscureText: false,
                            )),
                        SizedBox(height: 16),

                        // Phone Number Field
                        Row(
                          children: [
                            Container(
                              width: 4,
                              height: 20,
                              decoration: BoxDecoration(
                                color: app_Colors_Light.MainColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            SizedBox(width: 16),
                            Text(
                              S.of(context).Phone_Number_title,
                              style: Theme.of(context).textTheme.bodyMedium,
                            )
                          ],
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                            hintText: S.of(context).Phone_Number_text_field,
                            controller: phone,
                            prefixIcon: Icons.local_phone_outlined,
                            fillColor:
                                Theme.of(context).scaffoldBackgroundColor,
                            obscureText: false,
                            hintTextColor: Colors.grey.shade400,
                            iconColor: app_Colors_Light.ICon_textForm_color,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          ),
                        ),
                        SizedBox(height: 16),

                        // Update Button
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: CustomButton(
                              text: S.of(context).Update,
                              onPressed: () {
                                setState(() {
                                  if (_formKey.currentState!.validate()) {
                                    // Handle the update logic
                                  } else {
                                    // Handle form validation error
                                  }
                                });
                              }),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
