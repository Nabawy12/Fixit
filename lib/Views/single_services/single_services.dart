import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import 'package:yourcolor/Utils/Colors/colors.dart';
import 'package:yourcolor/Utils/Elevated_Button/button.dart';
import 'dart:ui';

import '../../../providers_state_mange/settings/settings.dart';
import '../Providers/SingleService/all review/all_reviews.dart';

class Singleservice_user extends StatefulWidget {
  static const routeName = "/Singleservice_user";
  const Singleservice_user({super.key});

  @override
  State<Singleservice_user> createState() => _Singleservice_userState();
}

class _Singleservice_userState extends State<Singleservice_user> {
  bool like = false;

  final List<String> thumbnails = [
    'assets/images/serviceman.jpg',
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
      body: Stack(
        children: [
          SingleChildScrollView(
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
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0, 6),
                            blurRadius: 10,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                    ),
                    Positioned.fill(
                      child: GestureDetector(
                        onTap: () {
                          showFullScreenBottomSheet(
                              context, thumbnails, selectedIndex);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.vertical(
                              bottom: Radius.circular(20),
                            ),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.black.withValues(
                                    alpha: 0.1), // Start of gradient
                                Colors.black.withValues(
                                    alpha: 0.2), // Middle of gradient
                                Colors.black
                                    .withValues(alpha: 0.8), // End of gradient
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                    // Back Button
                    provider.currentLocale.languageCode == "en"
                        ? Positioned(
                            top: 40,
                            left: 10,
                            child: InkWell(
                              onTap: () => Navigator.pop(context),
                              child: Container(
                                  padding: const EdgeInsets.all(7),
                                  decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                      shape: BoxShape.circle),
                                  child: Icon(Icons.arrow_back,
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .color)),
                            ),
                          )
                        : Positioned(
                            top: 40,
                            right: 10,
                            child: InkWell(
                              onTap: () => Navigator.pop(context),
                              child: Container(
                                  padding: const EdgeInsets.all(7),
                                  decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                      shape: BoxShape.circle),
                                  child: Icon(Icons.arrow_back,
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .color)),
                            ),
                          ),

                    // Edit and Delete Icons
                    provider.currentLocale.languageCode == "en"
                        ? Positioned(
                            top: 40,
                            right: 10,
                            child: Row(
                              children: [
                                // Edit Icon
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      like = !like; // Toggle the state
                                    });
                                  },
                                  child: AnimatedContainer(
                                    duration: const Duration(
                                        milliseconds:
                                            300), // Animation duration
                                    curve: Curves
                                        .easeInOut, // Smooth animation curve
                                    padding: const EdgeInsets.all(7),
                                    decoration: BoxDecoration(
                                      color: like
                                          ? app_Colors_Light.OFFER_Selcted
                                          : Theme.of(context)
                                              .scaffoldBackgroundColor,
                                      shape: BoxShape.circle,
                                    ),
                                    child: AnimatedSwitcher(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      transitionBuilder: (Widget child,
                                          Animation<double> animation) {
                                        return FadeTransition(
                                            opacity: animation, child: child);
                                      },
                                      child: like
                                          ? Icon(
                                              Icons.favorite,
                                              key: ValueKey<bool>(
                                                  like), // Unique key to differentiate icons
                                              color: Colors.white,
                                            )
                                          : Icon(
                                              Icons.favorite_border_outlined,
                                              key: ValueKey<bool>(like),
                                              color: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                                  .color,
                                            ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                              ],
                            ),
                          )
                        : Positioned(
                            top: 40,
                            left: 10,
                            child: Row(
                              children: [
                                // Edit Icon
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                      padding: const EdgeInsets.all(7),
                                      decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .scaffoldBackgroundColor,
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
                                  onTap: () {},
                                  child: Container(
                                      padding: const EdgeInsets.all(7),
                                      decoration: const BoxDecoration(
                                          color: Color(0xFFffeded),
                                          shape: BoxShape.circle),
                                      child: Icon(Icons.delete_outline_outlined,
                                          color: Colors.red
                                              .withValues(alpha: 0.6))),
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
                          children: [
                            Icon(
                              Icons.star,
                              color: app_Colors_Light.Rate_color,
                              size: 16,
                            ),
                            const SizedBox(width: 4),
                            const Text(
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
                SizedBox(
                  height: 70,
                  child: Stack(
                    children: [
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(0),
                        cacheExtent: 300,
                        scrollDirection: Axis.horizontal,
                        itemCount:
                            thumbnails.length > 4 ? 4 : thumbnails.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(
                              left: provider.currentLocale.languageCode == "en"
                                  ? (index == 0 && index == 3 ? 12.0 : 0.0)
                                  : 0.0,
                              right: provider.currentLocale.languageCode != "en"
                                  ? (index == 0 && index == 3 ? 12.0 : 0.0)
                                  : 0.0,
                            ),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                              child: buildThumbnail(
                                thumbnails[index],
                                index == selectedIndex,
                              ),
                            ),
                          );
                        },
                      ),
                      if (thumbnails.length > 4)
                        Positioned(
                          right: provider.currentLocale.languageCode == "ar"
                              ? 261
                              : 4,
                          top: 0,
                          bottom: 0,
                          child: GestureDetector(
                            onTap: () {
                              showFullScreenBottomSheet(
                                  context, thumbnails, thumbnails.length - 2);
                            },
                            child: Container(
                              width: 80,
                              decoration: BoxDecoration(
                                color: Colors.black.withValues(alpha: 0.5),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                '+${thumbnails.length - 4}',
                                style: const TextStyle(
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
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Text(
                        "Amount",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 13, color: app_Colors_Light.MainColor),
                      ),
                      const Spacer(),
                      Text(
                        "\$12.00",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: app_Colors_Light.MainColor),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      // Shadow for the top
                      BoxShadow(
                        color: Theme.of(context).cardColor,
                        spreadRadius: 0,
                        blurRadius: 7,
                        offset: const Offset(0, -3),
                      ),
                      BoxShadow(
                        color: Theme.of(context).cardColor,
                        spreadRadius: 0,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
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
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                width: 1,
                                height: 100,
                                color: Theme.of(context).colorScheme.outline,
                              ),
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
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                width: 1,
                                height: 100,
                                color: Theme.of(context).colorScheme.outline,
                              ),
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
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Description",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ReadMoreText(
                        'The Flutter framework builds its layout via the composition of widgets, everything that you construct programmatically is a widget and these are compiled together to create the user interface.',
                        trimLength: 100,
                        style: GoogleFonts.alexandria(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: provider.currentTheme == ThemeMode.light
                                ? Colors.black
                                : Colors.white,
                            height: 2),
                        lessStyle: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: app_Colors_Light.MainColor),
                        moreStyle: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: app_Colors_Light.MainColor),
                        colorClickableText: app_Colors_Light.MainColor,
                        trimCollapsedText: ' Read more',
                        trimExpandedText: '  Show less',
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.symmetric(vertical: 15),
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "provider",
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                const Spacer(),
                                Text(
                                  "View More",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                          color: app_Colors_Light.MainColor),
                                )
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Divider(
                                color: Theme.of(context).colorScheme.outline,
                              ),
                            ),
                            Row(
                              children: [
                                const CircleAvatar(
                                  radius: 17,
                                  backgroundImage: AssetImage(
                                      "assets/images/serviceman.jpg"),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Zeayd Nabawy",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                const Spacer(),
                                Icon(
                                  FontAwesomeIcons.solidStar,
                                  color: app_Colors_Light.Rate_color,
                                  size: 10,
                                ),
                                const SizedBox(
                                  width: 3,
                                ),
                                Icon(
                                  FontAwesomeIcons.solidStar,
                                  color: app_Colors_Light.Rate_color,
                                  size: 10,
                                ),
                                const SizedBox(
                                  width: 3,
                                ),
                                Icon(
                                  FontAwesomeIcons.solidStar,
                                  color: app_Colors_Light.Rate_color,
                                  size: 10,
                                ),
                                const SizedBox(
                                  width: 3,
                                ),
                                Text(
                                  "3.0",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(fontSize: 13),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Services Delivered :",
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                const Spacer(),
                                Text("250 ",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          color: app_Colors_Light.MainColor,
                                        )),
                                Text(
                                  "services",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                          color: app_Colors_Light.MainColor),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),

                // review
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Text(
                        "Reviews",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const Spacer(),
                      InkWell(
                          onTap: () => Navigator.pushNamed(
                              context, AllReviewsScreen.routeName),
                          child: Text(
                            "View all",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: app_Colors_Light.MainColor),
                          ))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ListView.builder(
                  padding: const EdgeInsets.all(0),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  shrinkWrap: true,
                  cacheExtent: 1,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(
                          bottom: 15, left: 16, right: 16),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: Theme.of(context).colorScheme.outline),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const CircleAvatar(
                                radius: 20,
                                backgroundImage:
                                    AssetImage("assets/images/serviceman.jpg"),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Zeyad",
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    "12 min ago",
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  )
                                ],
                              ),
                              const Spacer(),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: app_Colors_Light.Rate_color,
                                    size: 18,
                                  ),
                                  const SizedBox(
                                    width: 1,
                                  ),
                                  Text(
                                    "4.3",
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  )
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            maxLines: 3,
                            "i just love their services & the staff nature for work,i would like to hire them again it is very good and i will call them again",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w300,
                                    height: 1.6),
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                    );
                  },
                ),

                // SUGGEST FOR MORE PROVIDER

                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Text(
                        "Also provided below services",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const Spacer(),
                      InkWell(
                          onTap: () => Navigator.pushNamed(
                              context, AllReviewsScreen.routeName),
                          child: Text(
                            "View all",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: app_Colors_Light.MainColor),
                          ))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),

                SizedBox(
                  height: 233, // Set a fixed height
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 260, // Set a width for each item
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: Theme.of(context).colorScheme.outline),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: const Image(
                                image:
                                    AssetImage("assets/images/serviceman.jpg"),
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "Ac Water drop solution zeyad ",
                                    overflow: TextOverflow.ellipsis,
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Icon(
                                  FontAwesomeIcons.solidStar,
                                  size: 14,
                                  color: app_Colors_Light.Rate_color,
                                ),
                                const SizedBox(width: 3),
                                Text(
                                  "4.3",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ],
                            ),
                            const SizedBox(height: 7),
                            Row(
                              children: [
                                Container(
                                  height: 3,
                                  width: 3,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .color,
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  "AC Repair",
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ],
                            ),
                            const SizedBox(height: 7),
                            Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    "\$30.56",
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ),
                                const Expanded(
                                  flex: 1,
                                  child: CustomButton(text: "Add"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 70,
                ),
              ],
            ),
          ),
          const Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: CustomButton(text: "BOOK NOW"),
            ),
          ),
        ],
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
                    const BoxShadow(
                      color: Colors.grey,
                      blurStyle: BlurStyle.normal,
                      spreadRadius: -1,
                      blurRadius: 4,
                      offset: Offset(0, -10),
                    )
                  ]
                : [],
            border: Border.all(
              color:
                  isSelected ? app_Colors_Light.MainColor : Colors.transparent,
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
              isSelected
                  ? Container()
                  : Positioned.fill(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                          child: Container(
                            color: Colors.black.withValues(alpha: 0),
                          ),
                        ),
                      ),
                    ),
            ],
          )),
    );
  }

  Widget _buildInfoTile({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(top: 10, bottom: 10),
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(icon,
                    size: 20,
                    color: Theme.of(context).textTheme.bodyMedium!.color),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  height: 20,
                  width: 1,
                  color: Theme.of(context).colorScheme.outline,
                ),
                const SizedBox(width: 2),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: Theme.of(context).textTheme.bodyMedium),
                    const SizedBox(height: 4),
                    Text(value, style: Theme.of(context).textTheme.bodySmall),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget dashedDivider(BuildContext context,
      {double dashWidth = 8.0, double dashHeight = 1.0}) {
    return CustomPaint(
      size: Size(double.infinity, dashHeight),
      painter: DashedLinePainter(
          dashWidth: dashWidth,
          dashHeight: dashHeight,
          color: Theme.of(context).colorScheme.outline),
    );
  }

  void showFullScreenBottomSheet(
      BuildContext context, List<String> thumbnails, int initialIndex) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allow custom height
      backgroundColor: Colors.transparent, // To remove background
      enableDrag: true, // Enable swipe-to-dismiss
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height, // Full screen height
          width: MediaQuery.of(context).size.width, // Full screen width
          decoration: BoxDecoration(
              color: Theme.of(context)
                  .scaffoldBackgroundColor, // Background color of the bottom sheet
              borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15))),
          child: Stack(
            children: [
              PageView.builder(
                scrollDirection: Axis.horizontal, // Horizontal scroll direction
                itemCount: thumbnails.length, // Number of items in the list
                controller: PageController(
                    initialPage: initialIndex), // Set initial page index
                itemBuilder: (context, index) {
                  return SizedBox(
                    width:
                        MediaQuery.of(context).size.width, // Full screen width
                    height: MediaQuery.of(context)
                        .size
                        .height, // Full screen height
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(8), // Optional: rounded corners
                      child: Image.asset(
                        thumbnails[index], // Load image from the asset
                        fit: BoxFit
                            .cover, // Image fit type to cover the entire container
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
                  icon: Icon(Icons.close,
                      color: Theme.of(context).textTheme.bodyMedium!.color,
                      size: 30),
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
