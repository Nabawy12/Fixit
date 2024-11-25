import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yourcolor/Utils/Text_Form_Field/text_field.dart';

import '../../../Utils/Colors/colors.dart';

class AddNewServices extends StatefulWidget {
  static const routeName = "/AddNewServices";
  const AddNewServices({super.key});

  @override
  State<AddNewServices> createState() => _AddNewServicesState();
}

class _AddNewServicesState extends State<AddNewServices> {
  TextEditingController serviename = TextEditingController();
  TextEditingController time = TextEditingController();
  TextEditingController description = TextEditingController();
  List<File?> _images = [];  // List to store multiple images

  // Explicitly choose the gallery
  Future<void> _pickImage() async {
    final picker = ImagePicker();

    // Open the gallery and allow the user to pick an image
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _images.add(File(pickedFile.path)); // Add the selected image to the list
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          color: Theme.of(context).textTheme.bodyMedium!.color,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "Add Services Details",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const Spacer(),
                  ],
                ),
                const SizedBox(height: 30,),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(width: 16),
                      Row(
                        children: [
                          Container(
                            width: 4,
                            height: 20,
                            decoration: BoxDecoration(
                              color: app_Colors_Light.MainColor, // Replace with your color
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Row(
                            children: [
                              Text("Services Image", style: Theme.of(context).textTheme.bodyMedium),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      InkWell(
                        onTap: () => _pickImage(),
                        child: _images.isEmpty
                            ? Container(
                          margin: const EdgeInsets.symmetric(horizontal: 16.0),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Theme.of(context).colorScheme.outline),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.grey),
                                ),
                                child: const Icon(Icons.add_outlined, color: Colors.grey),
                              ),
                              const SizedBox(height: 5),
                              Text("Add Image", style: Theme.of(context).textTheme.bodySmall),
                            ],
                          ),
                        )
                            : Container(
                          height: 120, // Height for horizontal scroll view
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: _images.map((image) {
                              return Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                width: 100, // Width of each image
                                height: 100, // Height of each image
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image(image: FileImage(image!), fit: BoxFit.cover),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16,),
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
                          const SizedBox(width: 16),
                          Row(
                            children: [
                              Text("Thumbnail image", style: Theme.of(context).textTheme.bodyMedium),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10,),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16.0),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Theme.of(context).colorScheme.outline),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.grey,)
                              ),
                              child: const Icon(Icons.add_outlined,color: Colors.grey,),
                            ),
                            const SizedBox(height: 5,),
                            Text("Add Image",style: Theme.of(context).textTheme.bodySmall,),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16,),
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
                          const SizedBox(width: 16),
                          Row(
                            children: [
                              Text("Service Name", style: Theme.of(context).textTheme.bodyMedium),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: customTextField(
                            fillColor:Theme.of(context).scaffoldBackgroundColor ,
                            focusColor: Theme.of(context).colorScheme.outline,
                            prefixIcon: FontAwesomeIcons.android,
                            context: context,
                            hintText: "Service Name",
                            controller: serviename
                        ),
                      ),
                      const SizedBox(height: 16,),
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
                          const SizedBox(width: 16),
                          Row(
                            children: [
                              Text("Sub category", style: Theme.of(context).textTheme.bodyMedium),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10,),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          border: Border.all(color: Theme.of(context).colorScheme.outline)
                        ),
                        child: Row(
                          children: [
                            const Icon(FontAwesomeIcons.firstOrder),
                            const SizedBox(width: 10,),
                            Text(
                                "Select",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            const Spacer(),
                            Icon(Icons.arrow_drop_down_outlined,color: Theme.of(context).textTheme.bodySmall!.color,)
                          ],
                        ),
                      ),
                      const SizedBox(height: 16,),
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
                          const SizedBox(width: 16),
                          Row(
                            children: [
                              Text("Duration", style: Theme.of(context).textTheme.bodyMedium),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: customTextField(
                            fillColor: Theme.of(context).scaffoldBackgroundColor,
                            focusColor: Theme.of(context).colorScheme.outline,
                            context: context,
                            hintText: "Add Service Time",
                            controller: time
                        ),
                      ),
                      const SizedBox(height: 16,),
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
                          const SizedBox(width: 16),
                          Row(
                            children: [
                              Text("Description", style: Theme.of(context).textTheme.bodyMedium),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: customTextField(
                            MaxLines: 5,
                            focusColor: Theme.of(context).colorScheme.outline,
                            fillColor: Theme.of(context).scaffoldBackgroundColor,
                            context: context,
                            hintText: "Enter Description",
                            controller: description
                        ),
                      ),
                      const SizedBox(height: 16,),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Text("Status"),
                                const Spacer(),
                                Switch(value: false, onChanged: (value) {setState(() {
                                  value = true ;
                                });},)
                              ],
                            ),
                            const SizedBox(height: 5,),
                            Text("This service can be turned on and off based on your needs",style: Theme.of(context).textTheme.bodySmall,)
                          ],
                        )
                      ),



                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
