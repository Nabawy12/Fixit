import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import 'package:yourcolor/Utils/Colors/colors.dart';
import 'dart:ui';

import '../../../providers_state_mange/settings/settings.dart';
import 'all review/all_reviews.dart';

class Singleservice_Pro extends StatefulWidget {
  static const routeName = "/Singleservice_Pro";
  const Singleservice_Pro({super.key});

  @override
  State<Singleservice_Pro> createState() => _SingleserviceProState();
}

class _SingleserviceProState extends State<Singleservice_Pro> {

  final List<String> thumbnails = [
    'assets/images/service man.jpg',
    'assets/images/Splash.png',
    'assets/images/support.png',
    'assets/images/Splash.png',
    'assets/images/support.png',
  ];


  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    selectedIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<setting_Providers>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Main image with icons stacked
            Stack(
              children: [
                // Main image container
                Container(
                  height: 250,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(20),
                    ),
                    image: DecorationImage(
                      image: AssetImage(thumbnails[selectedIndex]),
                      fit: BoxFit.cover,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: const Offset(0, 10),
                        blurRadius: 10,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                ),
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(20),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0.1), // Start of gradient
                          Colors.black.withOpacity(0.2), // Middle of gradient
                          Colors.black.withOpacity(0.8), // End of gradient
                        ],
                      ),
                    ),
                  ),
                ),

                // Back Button
                provider.currentLocale.languageCode == "en" ?
                Positioned(
                  top: 30,
                  left: 10,
                  child: InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                        padding: const EdgeInsets.all(7),
                        decoration: BoxDecoration(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            shape: BoxShape.circle),
                        child: Icon(Icons.arrow_back,
                            color:
                            Theme.of(context).textTheme.bodyMedium!.color)),
                  ),
                ):Positioned(
                  top: 30,
                  right: 10,
                  child: InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                        padding: const EdgeInsets.all(7),
                        decoration: BoxDecoration(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            shape: BoxShape.circle),
                        child: Icon(Icons.arrow_back,
                            color:
                            Theme.of(context).textTheme.bodyMedium!.color)),
                  ),
                ),

                // Edit and Delete Icons
                provider.currentLocale.languageCode == "en" ?

                Positioned(
                  top: 30,
                  right: 10,
                  child: Row(
                    children: [
                      // Edit Icon
                      InkWell(
                        onTap: () => null,
                        child: Container(
                            padding: const EdgeInsets.all(7),
                            decoration: BoxDecoration(
                                color: Theme.of(context).scaffoldBackgroundColor,
                                shape: BoxShape.circle),
                            child: Icon(Icons.edit_outlined,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .color)),
                      ),
                      const SizedBox(width: 10),

                      // Delete Icon
                      InkWell(
                        onTap: () =>null,
                        child: Container(
                            padding: const EdgeInsets.all(7),
                            decoration: BoxDecoration(
                                color: Color(0xFFffeded),
                                shape: BoxShape.circle),
                            child: Icon(Icons.delete_outline_outlined,
                                color: Colors.red.withOpacity(0.6))),
                      ),
                    ],
                  ),
                ):Positioned(
                  top: 30,
                  left: 10,
                  child: Row(
                    children: [
                      // Edit Icon
                      InkWell(
                        onTap: () => null,
                        child: Container(
                            padding: const EdgeInsets.all(7),
                            decoration: BoxDecoration(
                                color: Theme.of(context).scaffoldBackgroundColor,
                                shape: BoxShape.circle),
                            child: Icon(Icons.edit_outlined,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .color)),
                      ),
                      const SizedBox(width: 10),

                      // Delete Icon
                      InkWell(
                        onTap: () =>null,
                        child: Container(
                            padding: const EdgeInsets.all(7),
                            decoration: BoxDecoration(
                                color: Color(0xFFffeded),
                                shape: BoxShape.circle),
                            child: Icon(Icons.delete_outline_outlined,
                                color: Colors.red.withOpacity(0.6))),
                      ),
                    ],
                  ),
                ),

                // Title and Rating
                Positioned(
                  bottom: 5,
                  left: 10,
                  child: Row(
                    children: [
                      // Service Title
                      Container(
                        padding: const EdgeInsets.all(8),
                        child: const Text(
                          'AC cleaning service',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 5,
                  right: 10,
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    child: Row(
                      children:  [
                        Icon(
                          Icons.star,
                          color: app_Colors_Light.Rate_color,
                          size: 16,
                        ),
                        SizedBox(width: 4),
                        Text(
                          '3.8',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),

            const SizedBox(height: 13),

            // Thumbnails Section
            Container(
              height: 70,
              child: Stack(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                    scrollDirection: Axis.horizontal,
                    itemCount: thumbnails.length > 4 ? 4 : thumbnails.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: buildThumbnail(
                          thumbnails[index],
                          index == selectedIndex,
                        ),
                      );
                    },
                  ),
                  if (thumbnails.length > 4)
                    Positioned(
                      right:provider.currentLocale.languageCode  =="ar" ? 265 : 9,
                      top: 0,
                      bottom: 0,
                      child: GestureDetector(
                        onTap: () {
                          showFullScreenBottomSheet(context,thumbnails);
                        },
                        child: Container(
                          width: 80,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            '+${thumbnails.length - 4}',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              padding: EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Text("Amount",style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 13,color: app_Colors_Light.MainColor),),
                  Spacer(),
                  Text("\$12.00",style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: app_Colors_Light.MainColor),)
                ],
              ),
            ),
            const SizedBox(height: 15),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  // Shadow for the top
                  BoxShadow(
                    color: Theme.of(context).cardColor,
                    spreadRadius: 0,
                    blurRadius: 7,
                    offset: Offset(0, -3),
                  ),
                  BoxShadow(
                    color: Theme.of(context).cardColor,
                    spreadRadius: 0,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildInfoTile(
                            icon: Icons.access_time_outlined,
                            title: 'Duration',
                            value: '45 minute',
                          ),
                          Container(margin:EdgeInsets.symmetric(horizontal: 10),width: 1,height: 100,color: Theme.of(context).colorScheme.outline,),
                          _buildInfoTile(
                            icon: Icons.layers_outlined,
                            title: 'Category',
                            value: 'AC repairing',
                          ),
                        ],
                      ),
                      dashedDivider(context),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildInfoTile(
                            icon: Icons.percent_outlined,
                            title: 'Commission',
                            value: '30%',
                          ),
                          Container(margin:EdgeInsets.symmetric(horizontal: 10),width: 1,height: 100,color: Theme.of(context).colorScheme.outline,),
                          _buildInfoTile(
                            icon: Icons.receipt_long_outlined,
                            title: 'Tax',
                            value: '2%',
                          ),
                        ],
                      ),
                      dashedDivider(context),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Text("Description",style: Theme.of(context).textTheme.bodySmall,),
                  SizedBox(height: 10,),
                  ReadMoreText(
                    'The Flutter framework builds its layout via the composition of widgets, everything that you construct programmatically is a widget and these are compiled together to create the user interface.',
                    trimLength: 100,
                    style: GoogleFonts.alexandria(fontSize: 13,fontWeight: FontWeight.w400,color: provider.currentTheme == ThemeMode.light ? Colors.black : Colors.white,height: 2),
                    lessStyle: Theme.of(context).textTheme.bodySmall!.copyWith(color: app_Colors_Light.MainColor),
                    moreStyle: Theme.of(context).textTheme.bodySmall!.copyWith(color: app_Colors_Light.MainColor),
                    colorClickableText: app_Colors_Light.MainColor,
                    trimCollapsedText: ' Read more',
                    trimExpandedText: '  Show less',
                  ),
                  SizedBox(height: 10,)


                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Text("Reviews",style: Theme.of(context).textTheme.bodyMedium,),
                  Spacer(),
                  InkWell(
                    onTap: () => Navigator.pushNamed(context,AllReviewsScreen.routeName),
                      child: Text("View all",style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: app_Colors_Light.MainColor),))
                ],
              ),
            ),
            SizedBox(height: 10,),
            ListView.builder(
                padding: EdgeInsets.all(0),
                physics: NeverScrollableScrollPhysics(),
                itemCount: 3,
                shrinkWrap: true,
                cacheExtent: 1,
                itemBuilder:(context, index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 15,left: 16,right: 16),
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Theme.of(context).colorScheme.outline),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundImage: AssetImage("assets/images/service man.jpg"),
                            ),
                            SizedBox(width: 5,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Zeyad",style: Theme.of(context).textTheme.bodyMedium,),
                                SizedBox(height: 3,),
                                Text("12 min ago",style: Theme.of(context).textTheme.bodySmall,)
                              ],
                            ),
                            Spacer(),
                            Row(
                              children: [
                                Icon(Icons.star,color: app_Colors_Light.Rate_color,size: 18,),
                                SizedBox(width: 1,),
                                Text("4.3",style: Theme.of(context).textTheme.bodyMedium,)
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 15,),
                        Text(
                          maxLines: 3,
                            "i just love their services & the staff nature for work,i would like to hire them again it is very good and i will call them again",
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 13,fontWeight: FontWeight.w300,height: 1.6),
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  );
                },
            ),

          ],
        ),
      ),
    );
  }

  // Build a thumbnail widget
  Widget buildThumbnail(String imageUrl, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: Container(
        width: 80,
        decoration: BoxDecoration(
          boxShadow: isSelected
              ? [
          // Shadow for the top
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 0,
            blurRadius: 5,
            offset: Offset(0, -3),
          ),

          ]
              : [],
          border: Border.all(
            color: isSelected
                ? app_Colors_Light.MainColor
                : Colors.transparent,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image(
                image: AssetImage(imageUrl),
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
            isSelected ?
            Container() :  Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                  child: Container(
                    color: Colors.black.withOpacity(0),
                  ),
                ),
              ),
            ),
          ],
        )
      ),
    );
  }



  Widget _buildInfoTile({
    required IconData icon,
    required String title,
    required String value,
  }
  ) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(top: 10,bottom: 10),
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(icon, size: 20, color: Theme.of(context).textTheme.bodyMedium!.color),
                Container(margin: EdgeInsets.symmetric(horizontal: 3),height: 20,width: 1,color: Theme.of(context).colorScheme.outline,),
                SizedBox(width: 2),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.bodyMedium
                    ),
                    SizedBox(height: 4),
                    Text(
                      value,
                      style: Theme.of(context).textTheme.bodySmall
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget dashedDivider(BuildContext context, {double dashWidth = 8.0, double dashHeight = 1.0}) {
    return CustomPaint(
      size: Size(double.infinity, dashHeight),
      painter: DashedLinePainter(dashWidth: dashWidth, dashHeight: dashHeight, color: Theme.of(context).colorScheme.outline),
    );
  }


  void showFullScreenBottomSheet(BuildContext context, List<String> thumbnails) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allow custom height
      backgroundColor: Colors.transparent, // To remove background
      enableDrag: true, // Enable swipe-to-dismiss
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height, // Full screen height
          width: MediaQuery.of(context).size.width,  // Full screen width
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor, // Background color of the bottom sheet
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(15),bottomLeft: Radius.circular(15))
          ),
          child: Stack(
            children: [
              PageView.builder(
                scrollDirection: Axis.horizontal, // Horizontal scroll direction
                itemCount: thumbnails.length, // Number of items in the list
                itemBuilder: (context, index) {
                  return Container(
                    width: MediaQuery.of(context).size.width, // Take full width of the screen
                    height: MediaQuery.of(context).size.height, // Take full height of the screen
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8), // Optional: rounded corners
                      child: Image.asset(
                        thumbnails[index], // Load image from the asset
                        fit: BoxFit.cover, // Image fit type to cover the entire container
                      ),
                    ),
                  );
                },
              ),
              // Close button at the top
              Positioned(
                top: 30, // Position close button
                right: 10,
                child: IconButton(
                  icon: Icon(Icons.close, color: Theme.of(context).textTheme.bodyMedium!.color, size: 30),
                  onPressed: () {
                    Navigator.pop(context); // Close bottom sheet
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class DashedLinePainter extends CustomPainter {
  final double dashWidth;
  final double dashHeight;
  final Color color;

  DashedLinePainter({
    required this.dashWidth,
    required this.dashHeight,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = dashHeight;

    double startX = 0;
    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth * 2; // The dash gap
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
