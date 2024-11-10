import 'package:flutter/material.dart';
import 'package:yourcolor/Utils/Colors/colors.dart';

import '../../../generated/l10n.dart';

class MyReviews extends StatelessWidget {
  static const routeName = "/MyReviews";

  const MyReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
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
                    S.of(context).My_reviews,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const Spacer(),
                ],
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: 10, // Set the number of items you want to display
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Theme.of(context).colorScheme.outline
                        ),
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              // Profile picture
                              const CircleAvatar(
                                radius: 24,
                                backgroundImage: AssetImage("assets/images/Flag_united.webp"), // Replace with actual image
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        // Name and rating
                                        Text(
                                          'Kurt Bates',
                                          style: Theme.of(context).textTheme.bodyMedium,
                                        ),
                                        const SizedBox(width: 8),
                                        Icon(Icons.star, color: Colors.orange, size: 16),
                                        Text(
                                          '4.0',
                                          style: Theme.of(context).textTheme.bodyMedium,
                                        ),
                                        const Spacer(),
                                        Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                          decoration: BoxDecoration(
                                            color: app_Colors_Light.MainColor.withOpacity(0.1),
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                          child: Text(
                                            'Service',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(color: app_Colors_Light.MainColor),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      'Ac deep cleaning',
                                      style: Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          // Comment text
                          Text(
                            '“I just love their service & the staff nature for work, I’d like to hire them again”',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const SizedBox(height: 12),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Divider(color: Theme.of(context).cardColor,),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Timestamp
                              Text(
                                '12 min ago',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              Row(
                                children: [
                                  // Edit icon
                                  Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.grey.shade200,
                                    ),
                                    child: Icon(Icons.edit, color: Colors.grey),
                                  ),
                                  const SizedBox(width: 5),
                                  // Delete icon
                                  Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      color: Colors.red.withOpacity(0.2),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(Icons.delete, color: Colors.red),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
