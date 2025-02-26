import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yourcolor/Utils/Colors/colors.dart';

import '../../../../Utils/Elevated_Button/button.dart';
import '../../../../Utils/Truncation/Text.dart';
import '../../../../providers_state_mange/settings/settings.dart';

class DetailsBooking extends StatelessWidget {
  static const routeName = "/DetailsBooking";
  const DetailsBooking({super.key});

  @override
  Widget build(BuildContext context) {
    const String mapUrl =
        "https://www.google.com/maps?q=30.044420,31.235712"; // Replace with your desired location

    Future<void> _openMap() async {
      Uri url = Uri.parse(mapUrl);

      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.externalApplication);
      } else {
        throw 'Could not launch $mapUrl';
      }
    }

    var provider = Provider.of<setting_Providers>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
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
                    const Spacer(),
                    Text(
                      "pending booking",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const Spacer(),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: Theme.of(context).colorScheme.outline),
                    boxShadow: const [
                      // Shadow for the top
                      BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 0,
                        blurRadius: 7,
                        offset: Offset(0, -3),
                      ),
                      BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 0,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: const Image(
                              image:
                                  AssetImage("assets/images/serviceman.jpg"))),
                      const SizedBox(
                        height: 10,
                      ),
                      // Title of Details
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "#58961",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: app_Colors_Light.MainColor),
                          ),
                          const Spacer(),
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: Theme.of(context).cardColor),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "View status",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          color: app_Colors_Light.MainColor,
                                          fontWeight: FontWeight.w200),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  FontAwesomeIcons.arrowRightLong,
                                  color: app_Colors_Light.MainColor,
                                  size: 17,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      //Name of Services
                      Text(
                        "Cleaning Services",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // Details of services
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: Theme.of(context).colorScheme.outline)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Row(
                                      children: [
                                        Icon(Icons.calendar_today_outlined,
                                            size: 20, color: Colors.grey[700]),
                                        const SizedBox(width: 8),
                                        Container(
                                          width: 1,
                                          height: 20,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .outline,
                                        ),
                                        const SizedBox(width: 8),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('6 Sep, 2023',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium),
                                            Text(
                                              'Date',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 1,
                                  height: 100,
                                  color: Theme.of(context).colorScheme.outline,
                                ),
                                Expanded(
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Row(
                                      children: [
                                        Icon(Icons.access_time_outlined,
                                            size: 20,
                                            color: Theme.of(context)
                                                .textTheme
                                                .bodySmall!
                                                .color),
                                        const SizedBox(width: 8),
                                        Container(
                                          width: 1,
                                          height: 20,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .outline,
                                        ),
                                        const SizedBox(width: 8),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('6:00 PM',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium),
                                            Text(
                                              'Time',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              color: Theme.of(context).colorScheme.outline,
                              width: double.infinity,
                              height: 1,
                            ),
                            Container(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                children: [
                                  Icon(Icons.location_on_outlined,
                                      size: 20, color: Colors.grey[700]),
                                  const SizedBox(width: 8),
                                  Container(
                                    width: 1,
                                    height: 20,
                                    color:
                                        Theme.of(context).colorScheme.outline,
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                        '2118 Thornridge Cir. Syracuse, Connecticut - 35624, USA.',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(fontSize: 13)),
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () => _openMap(),
                              child: Container(
                                margin: const EdgeInsets.only(top: 10),
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Theme.of(context).cardColor,
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      "VIEW LOCATION ON MAP",
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                    const Spacer(),
                                    Icon(
                                      FontAwesomeIcons.arrowRightLong,
                                      color: app_Colors_Light.MainColor,
                                      size: 17,
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      //Description
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Description",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          const SizedBox(
                            height: 4,
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
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // Customer Details
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Customer details",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Divider(
                              color: Theme.of(context).colorScheme.outline,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                const CircleAvatar(
                                  backgroundImage:
                                      AssetImage("assets/images/me.jpg"),
                                ),
                                const SizedBox(
                                  width: 6,
                                ),
                                TruncatedText(
                                    text: "Zeyad Nabawy Mostafa Fayed"),
                                const Spacer(),
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(7),
                                      decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .scaffoldBackgroundColor,
                                          border: Border.all(
                                              color:
                                                  app_Colors_Light.MainColor),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Icon(
                                        Icons.message_outlined,
                                        color: app_Colors_Light.MainColor,
                                        size: 17,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(7),
                                      decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .scaffoldBackgroundColor,
                                          border: Border.all(
                                              color:
                                                  app_Colors_Light.MainColor),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Icon(
                                        Icons.call_outlined,
                                        color: app_Colors_Light.MainColor,
                                        size: 17,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Bill summary",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).cardColor,
                      border: Border.all(
                          color: Theme.of(context).colorScheme.outline)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Amount",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          const Spacer(),
                          Text("\$12.00",
                              style: Theme.of(context).textTheme.bodyMedium),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            "Tax",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          const Spacer(),
                          Text("\$10.00",
                              style: Theme.of(context).textTheme.bodyMedium),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            "Coupon discount (24% off)",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          const Spacer(),
                          Text(
                            "-\$1.00",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.red),
                          ),
                        ],
                      ),
                      Divider(
                        color: Theme.of(context).colorScheme.outline,
                      ),
                      Row(
                        children: [
                          Text(
                            "Total Amount",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const Spacer(),
                          Text(
                            "\$21.00",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: app_Colors_Light.MainColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: app_Colors_Light.MainColor),
                        ),
                        child: Text(
                          "Reject",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: app_Colors_Light.MainColor),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    const Expanded(
                      child: CustomButton(text: "Accept"),
                    ),
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
