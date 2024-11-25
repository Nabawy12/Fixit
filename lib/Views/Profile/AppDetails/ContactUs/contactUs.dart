import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../Utils/Colors/colors.dart';
import '../../../../Utils/Elevated_Button/button.dart';
import '../../../../Utils/Text_Form_Field/text_field.dart';
import '../../../../generated/l10n.dart';

class Contactus extends StatefulWidget {
  static const routeName = "/Contactus";
  const Contactus({super.key});

  @override
  State<Contactus> createState() => _ContactusState();
}

class _ContactusState extends State<Contactus> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController repassword = TextEditingController();
  bool isChecked = false;
  bool showAgreementError = false;
  bool visblePassword = false;
  String? selectedErrorType;


  @override
  Widget build(BuildContext context) {
    final List<String> errorTypes = [S.of(context).Purchase_error, S.of(context).Technical_error, S.of(context).App_Error, S.of(context).Feedback];
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
            child: Column(
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
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
                            S.of(context).Contact_US,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          const Spacer(),
                        ],
                      ),
                      SizedBox(height: 30),

                      // Email and Password Fields
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: customTextField(
                                context: context,
                                validator:  (value) {
                                  if (value == null || value.isEmpty) {
                                    return "${S.of(context).userName_vaild}";
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.name,
                                hintText: S.of(context).User_name_text_field,
                                controller: username,
                                prefixIcon: Icons.person_2_outlined,
                                fillColor: Theme.of(context).scaffoldBackgroundColor,
                                hintTextColor: Colors.grey.shade400,
                                iconColor: app_Colors_Light.ICon_textForm_color,
                                obscureText: false,
                              ),
                            ),
                            SizedBox(height: 16),

                            // Password Field
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
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: customTextField(
                                context: context,
                                validator:  (value) {
                                  if (value == null || value.isEmpty) {
                                    return "${S.of(context).Email_vaild}";
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.emailAddress,
                                hintText: S.of(context).Login_email_text_field_hint,
                                controller: email,
                                prefixIcon: Icons.email_outlined,
                                fillColor: Theme.of(context).scaffoldBackgroundColor,
                                obscureText: false,
                                hintTextColor: Colors.grey.shade400,
                                iconColor: app_Colors_Light.ICon_textForm_color,
                              ),
                            ),
                            SizedBox(height: 16),
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
                                  "Select Error",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                )
                              ],
                            ),
                            SizedBox(height: 10),
                            Container(
                              height: 100, // Adjust height as needed
                              child: GridView.builder(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                physics: NeverScrollableScrollPhysics(), // Prevent scrolling inside GridView
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, // Number of items per row
                                  mainAxisSpacing: 8,
                                  crossAxisSpacing: 8,
                                  childAspectRatio: 3, // Width-to-height ratio
                                ),
                                itemCount: errorTypes.length,
                                itemBuilder: (context, index) {
                                  String errorType = errorTypes[index];
                                  bool isSelected = errorType == selectedErrorType;
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedErrorType = errorType;
                                      });
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                                      decoration: BoxDecoration(
                                        color: isSelected
                                            ? app_Colors_Light.MainColor.withOpacity(0.3)
                                            : Theme.of(context).scaffoldBackgroundColor,
                                        borderRadius: BorderRadius.circular(8),
                                        border: isSelected
                                            ? Border.all(color: app_Colors_Light.MainColor, width: 1.5)
                                            : Border.all(color: Theme.of(context).colorScheme.outline, width: 1),
                                      ),
                                      child: Center(
                                        child: Text(
                                          errorType,
                                          style: isSelected ? Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white) :Theme.of(context).textTheme.bodyMedium,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
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
                                  S.of(context).Message,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                )
                              ],
                            ),
                            SizedBox(height: 10),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: customTextField(
                                MaxLines: 5,
                                context: context,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "${S.of(context).phone_vaild}";
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.phone,
                                hintText: S.of(context).Write_Here,
                                controller: phone,
                                fillColor: Theme.of(context).scaffoldBackgroundColor,
                                obscureText: false,
                                hintTextColor: Colors.grey.shade400,
                                iconColor: app_Colors_Light.ICon_textForm_color,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                              ),
                            ),

                            SizedBox(height: 16),
                            // Phone Number Field


                            // Signup Button

                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: CustomButton(
                      text: S.of(context).Submit,
                      onPressed: () {
                        setState(() {
                          if (_formKey.currentState!.validate()) {

                          } else {

                          }
                        });
                      }
                  ),
                ),
                SizedBox(height: 10,),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget _buildSelectableContainer(String text) {
    bool isSelected = selectedErrorType == text;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedErrorType = text;
        });
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isSelected ? app_Colors_Light.MainColor : Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? app_Colors_Light.MainColor : Theme.of(context).colorScheme.outline
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }

}
