import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../Utils/Colors/colors.dart';
import '../../../../Utils/Elevated_Button/button.dart';
import '../../../../Utils/Text_Form_Field/text_field.dart';
import '../../../../generated/l10n.dart';

class CompanyDetails_profile  extends StatefulWidget {
  static const routeName = "/CompanyDetails_profile" ;
  const CompanyDetails_profile ({super.key});

  @override
  State<CompanyDetails_profile> createState() => _CompanyDetailsState();
}

class _CompanyDetailsState extends State<CompanyDetails_profile> {
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
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
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Row(
                    children: [
                      InkWell(
                        splashColor: Theme.of(context).scaffoldBackgroundColor,
                        highlightColor: Theme.of(context).scaffoldBackgroundColor,
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
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        "company Details",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const Spacer(),
                    ],
                  ),
                  SizedBox(height: 20),
                  Column(
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
                            Divider(color: Theme.of(context).scaffoldBackgroundColor),
                            SizedBox(height: 20),
                            // Name Field
                            Row(
                              children: [
                                Container(
                                  width: 4, // Fixed width for the line
                                  height: 20, // Line height based on responsive text height
                                  decoration: BoxDecoration(
                                    color: app_Colors_Light.MainColor, // Line color
                                    borderRadius: BorderRadius.circular(10), // Rounded edges
                                  ),
                                ),
                                SizedBox(width: 16),
                                Text("Upload Logo", style: Theme.of(context).textTheme.bodyMedium),
                              ],
                            ),
                            SizedBox(height: 10),
                            InkWell(
                              onTap: () {
                                _pickImage(); // Open image picker when tapped
                              },
                              child: _image == null
                                  ? Container(
                                margin: EdgeInsets.symmetric(horizontal: 16),
                                padding: EdgeInsets.all(20),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Theme.of(context).scaffoldBackgroundColor,
                                    borderRadius: BorderRadius.circular(12)
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.upload),
                                    SizedBox(height: 10),
                                    Text(
                                      "Upload logo Image",
                                      style: Theme.of(context).textTheme.bodyMedium,
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
                                  height: 20, // Line height based on responsive text height
                                  decoration: BoxDecoration(
                                    color: app_Colors_Light.MainColor, // Line color
                                    borderRadius: BorderRadius.circular(10), // Rounded edges
                                  ),
                                ),
                                SizedBox(width: 16),
                                Text("Company Name", style: Theme.of(context).textTheme.bodyMedium),
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
                                focusColor: Theme.of(context).colorScheme.outline,
                                fillColor: Theme.of(context).scaffoldBackgroundColor,
                              ),
                            ),
                            SizedBox(height: 16),
                            Row(
                              children: [
                                Container(
                                  width: 4, // Fixed width for the line
                                  height: 20, // Line height based on responsive text height
                                  decoration: BoxDecoration(
                                    color: app_Colors_Light.MainColor, // Line color
                                    borderRadius: BorderRadius.circular(10), // Rounded edges
                                  ),
                                ),
                                SizedBox(width: 16),
                                Text("Phone Number", style: Theme.of(context).textTheme.bodyMedium),
                              ],
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0),
                              child: customTextField(
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
                                fillColor: Theme.of(context).scaffoldBackgroundColor,
                                obscureText: false,
                                hintTextColor: Colors.grey.shade400,
                                iconColor: app_Colors_Light.ICon_textForm_color,
                                inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                              ),
                            ),
                            SizedBox(height: 16),
                            Row(
                              children: [
                                Container(
                                  width: 4, // Fixed width for the line
                                  height: 20, // Line height based on responsive text height
                                  decoration: BoxDecoration(
                                    color: app_Colors_Light.MainColor, // Line color
                                    borderRadius: BorderRadius.circular(10), // Rounded edges
                                  ),
                                ),
                                SizedBox(width: 16),
                                Text("Company Email", style: Theme.of(context).textTheme.bodyMedium),
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
                                focusColor: Theme.of(context).colorScheme.outline,
                                fillColor: Theme.of(context).scaffoldBackgroundColor,
                              ),
                            ),
                            SizedBox(height: 16),
                            Row(
                              children: [
                                Container(
                                  width: 4, // Fixed width for the line
                                  height: 20, // Line height based on responsive text height
                                  decoration: BoxDecoration(
                                    color: app_Colors_Light.MainColor, // Line color
                                    borderRadius: BorderRadius.circular(10), // Rounded edges
                                  ),
                                ),
                                SizedBox(width: 16),
                                Text("Description", style: Theme.of(context).textTheme.bodyMedium),
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
                                focusColor: Theme.of(context).colorScheme.outline,
                                fillColor: Theme.of(context).scaffoldBackgroundColor,
                              ),
                            ),


                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      CustomButton(
                        text: "UpDate",
                        onPressed: () {
                          // Navigate to the next page

                        },
                      ),
                      SizedBox(height: 20,),

                    ],
                  ),
                ],
              ),
            ),
        ),
      ),
    );
  }
}
