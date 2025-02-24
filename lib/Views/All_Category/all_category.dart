import 'package:flutter/material.dart';

import '../../Widgets/Home/Totla_Categories/total_categories.dart';
import '../../generated/l10n.dart';

class AllCategory extends StatefulWidget {
  static const routeName = "/AllCategory";
  const AllCategory({super.key});

  @override
  State<AllCategory> createState() => _AllCategoryState();
}

class _AllCategoryState extends State<AllCategory> {
  ScrollController allpage = ScrollController();
  bool isListView =
      false; // State variable to toggle between GridView and ListView
  final List<Map<String, dynamic>> services = [
    {'icon': Icons.ac_unit, 'label': 'Ac Repair'},
    {'icon': Icons.cleaning_services, 'label': 'Cleaning'},
    {'icon': Icons.construction, 'label': 'Carpenter'},
    {'icon': Icons.kitchen, 'label': 'Cooking'},
    {'icon': Icons.electrical_services, 'label': 'Electrician'},
    {'icon': Icons.format_paint, 'label': 'Painter'},
    {'icon': Icons.plumbing, 'label': 'Plumber'},
    {'icon': Icons.face, 'label': 'Salon'},
    {'icon': Icons.ac_unit, 'label': 'Ac Repair'},
    {'icon': Icons.cleaning_services, 'label': 'Cleaning'},
    {'icon': Icons.construction, 'label': 'Carpenter'},
    {'icon': Icons.kitchen, 'label': 'Cooking'},
    {'icon': Icons.electrical_services, 'label': 'Electrician'},
    {'icon': Icons.format_paint, 'label': 'Painter'},
    {'icon': Icons.plumbing, 'label': 'Plumber'},
    {'icon': Icons.face, 'label': 'Salon'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          controller: allpage,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                SizedBox(height: 20),
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
                      "All Categories",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isListView = !isListView; // Toggle the view
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          isListView ? Icons.category_outlined : Icons.list,
                          color: Theme.of(context).textTheme.bodyLarge!.color,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  height: 50,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: S.of(context).Search_here,
                      prefixIcon: Icon(Icons.search),
                      filled: true,
                      fillColor: Theme.of(context).cardColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: isListView
                      ? ListView.builder(
                          padding: EdgeInsets.all(0),
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: services.length,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.only(bottom: 15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    services[index]['icon'],
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .color,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    services[index]['label'],
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  Spacer(),
                                  Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .color,
                                  )
                                ],
                              ),
                            );
                          },
                        )
                      : GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                            childAspectRatio: 0.7,
                          ),
                          itemCount: services.length,
                          itemBuilder: (context, index) {
                            return ServiceTile(
                              icon: services[index]['icon'],
                              label: services[index]['label'],
                            );
                          },
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
