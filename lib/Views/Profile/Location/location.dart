import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yourcolor/Utils/Colors/colors.dart';

import '../../../generated/l10n.dart';

class Location extends StatelessWidget {
  static const routeName = "/Location";
  const Location({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              SizedBox(height: 20,),
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
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ),
                  Spacer(),
                  Text(
                    "Location",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Spacer(),
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration:BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        shape: BoxShape.circle
                    ),
                    child: Icon(Icons.add_outlined, color: Theme.of(context).textTheme.bodyLarge!.color),
                  )

                ],
              ),
              SizedBox(height: 30,),
              Expanded(
                child: ListView.builder(
                  itemCount: 2, // Set the number of items you want to display
                  itemBuilder: (context, index) {
                    return  Container(
                      margin: EdgeInsets.only(bottom: 16),
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.grey[200],
                                child: index == 0 ? Icon(Icons.home_outlined, color: Theme.of(context).textTheme.bodyLarge!.color): Icon(Icons.work_history_outlined, color: Theme.of(context).textTheme.bodyLarge!.color),
                              ),
                              SizedBox(width: 12),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Kristin Watson ${index+1}',
                                    style:Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 15,fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    '(406) 555-0120',
                                    style:Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 13)
                                  ),
                                ],
                              ),
                              Spacer(),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: app_Colors_Light.MainColor.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: index == 0 ?Text(
                                  'Home',
                                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: app_Colors_Light.MainColor)
                                ):Text(
                                    'Work',
                                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: app_Colors_Light.MainColor)
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            height: 20,
                            thickness: 1,
                            color: Colors.grey[300],
                          ),
                          Text(
                            'Address :',
                            style:Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 13,)
                          ),
                          SizedBox(height: 4),
                          Text(
                            '3891 Ranchview Dr. Richardson, California - 62639, USA.',
                            style:Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 15)
                          ),
                          SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '• Set as a primary location',
                                style: TextStyle(
                                  color: Colors.grey[500],
                                  fontSize: 13,
                                ),
                              ),
                              Row(
                                children: [
                                 Container(
                                   padding:EdgeInsets.all(5),
                                   decoration:BoxDecoration(
                                     color: Colors.grey.withOpacity(0.2),
                                     shape: BoxShape.circle
                                   ),
                                   child: Icon(Icons.edit_outlined, color: Theme.of(context).textTheme.bodyLarge!.color),
                                 ),
                                  SizedBox(width: 9,),
                                  Container(
                                    padding: EdgeInsets.all(5),
                                    decoration:BoxDecoration(
                                        color: Colors.red.withOpacity(0.2),
                                        shape: BoxShape.circle
                                    ),
                                    child: Icon(Icons.delete_outline_outlined, color: Colors.red[300]),
                                  )
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
