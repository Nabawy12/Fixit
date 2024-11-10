import 'package:flutter/material.dart';
import 'package:yourcolor/Utils/Colors/colors.dart';

import '../../../generated/l10n.dart';

class Favourite_List extends StatefulWidget {
  static const routeName = "/Favourite_List";
  @override
  _Favourite_ListState createState() => _Favourite_ListState();
}

class _Favourite_ListState extends State<Favourite_List>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.arrow_back_ios_new, color: Colors.grey.shade500),
                  ),
                ),
                Spacer(),
                Text(
                  S.of(context).Favourite_List,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Spacer(),
              ],
            ),
            SizedBox(height: 10),
            // Custom TabBar
            Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: TabBar(
                labelStyle: Theme.of(context).textTheme.bodySmall,
                dividerHeight: 0,
                dividerColor: Theme.of(context).scaffoldBackgroundColor,
                controller: _tabController,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                  color: app_Colors_Light.MainColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(text: S.of(context).Provider),
                  Tab(text: S.of(context).Service),
                ],
              ),
            ),
            SizedBox(height: 16),
            // Displaying the TabBarView
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  // Provider Tab Content
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          S.of(context).Provider_list,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        SizedBox(height: 8),
                        // Search Field
                        Container(
                          height: 50,
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
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
                        SizedBox(height: 8),
                        // List of Favorite Items
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 15,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Theme.of(context).colorScheme.outline),
                                  color: Theme.of(context).scaffoldBackgroundColor,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Theme.of(context).cardColor,
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: ListTile(
                                  contentPadding: EdgeInsets.all(8),
                                  leading: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.asset("assets/images/me.jpg", width: 70, height: 120),
                                  ),
                                  title: Row(
                                    children: [
                                      Text(
                                        "Name ${index + 1}",
                                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 17),
                                      ),
                                      Spacer(),
                                      Icon(Icons.favorite, color: Colors.red),
                                    ],
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "This business was founded in 2021.",
                                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 13),
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.star, color: Colors.amber, size: 16),
                                          SizedBox(width: 4),
                                          Text("4.${index + 1}", style: Theme.of(context).textTheme.bodySmall),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  // Service Tab Content
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          S.of(context).Service_list,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        SizedBox(height: 8),
                        // Search Field
                        Container(
                          height: 50,
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
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
                        SizedBox(height: 8),
                        // Grid of Favorite Services
                        GridView.builder(
                          padding: EdgeInsets.only(top: 4),
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                            childAspectRatio: 0.7,
                          ),
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                color: Theme.of(context).scaffoldBackgroundColor,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: Theme.of(context).colorScheme.outline),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Stack(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                                          ),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(8),
                                            child: Image.asset(
                                              "assets/images/Flag_Emarat.png",
                                              fit: BoxFit.fill,
                                              width: double.infinity,
                                              height: double.infinity,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: 10,
                                          right: 10,
                                          child: Icon(Icons.favorite, color: Colors.red),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Service ${index + 1}",
                                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 15),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Text(
                                          "Category",
                                          style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 13),
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                "\$${(20 + index * 5).toStringAsFixed(2)}",
                                                style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 14),
                                              ),
                                            ),
                                            SizedBox(width: 5),
                                            Expanded(
                                              child: ElevatedButton(
                                                onPressed: () {},
                                                child: Text("+ Add"),
                                                style: ElevatedButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(8),
                                                  ),
                                                  backgroundColor: app_Colors_Light.MainColor,
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
