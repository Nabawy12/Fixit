import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yourcolor/Utils/Colors/colors.dart';
import 'package:yourcolor/Utils/Elevated_Button/button.dart';
import 'package:yourcolor/Views/single_services/single_services.dart';

import '../../Widgets/Home/Totla_Categories/total_categories.dart';
import '../../Widgets/Home/app_bar/appBar.dart';
import '../../Widgets/Home/coupon/coupon.dart';
import '../../Widgets/Home/page_builder/PageBuilder.dart';
import '../All_Category/all_category.dart';
import '../Providers/SingleService/singleservice.dart';

class home_screen extends StatefulWidget {
  const home_screen({super.key});

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  final PageController _pageController = PageController();
  final PageController coupon = PageController();
  int _currentIndex = 0;
  ScrollController allpage = ScrollController();

  final List<Map<String, String>> offers = [
    {
      "title": "50% OFF IN CLEANING",
      "subtitle": "#On first 50 booking",
      "buttonText": "Book now",
      "tag": "NEW OFFER",
    },
    {
      "title": "25% OFF IN PLUMBING",
      "subtitle": "#On first 100 booking",
      "buttonText": "Book now",
      "tag": "HOT OFFER",
    },
    {
      "title": "10% OFF IN ELECTRICAL",
      "subtitle": "#On all bookings this month",
      "buttonText": "Book now",
      "tag": "LIMITED OFFER",
    },
  ];
  final List<Map<String, String>> coupons = [
    {
      "bank": "Bank of America",
      "code": "#A125",
      "discount": "30% OFF",
    },
    {
      "bank": "Chase Bank",
      "code": "#B236",
      "discount": "25% OFF",
    },
    {
      "bank": "Wells Fargo",
      "code": "#C789",
      "discount": "20% OFF",
    },
  ];
  final List<Map<String, dynamic>> services = [
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10,),
              //LOCATION
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: LocationWidget(
                  iconColor: app_Colors_Light.MainColor,
                  locationText: "Current Location",
                  statusText: "Getting Location...",
                ),
              ),

              SizedBox(height: 20,),
              //PAGE VIEW BUILDER
              SizedBox(
                height: 250,
                width: double.infinity,
                child: PageView.builder(

                  controller: _pageController,
                  itemCount: offers.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return OfferCard(
                      title: offers[index]["title"]!,
                      subtitle: offers[index]["subtitle"]!,
                      buttonText: offers[index]["buttonText"]!,
                      tag: offers[index]["tag"]!,
                    );
                  },
                ),
              ),

              SizedBox(height: 10),
              // Dot indicator
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(offers.length, (index) {
                  return AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    margin: EdgeInsets.symmetric(horizontal: 4.0),
                    height: 8.0,
                    width: _currentIndex == index ? 16.0 : 8.0,
                    decoration: BoxDecoration(
                      color: _currentIndex == index ? app_Colors_Light.MainColor : Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  );
                }),
              ),

              SizedBox(height: 20),
              //COUPON TITLE
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Coupons",
                      style: Theme.of(context).textTheme.bodyLarge,
                      textAlign: TextAlign.center,
                    ),
                    Spacer(),
                    Text(
                      "View all",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: app_Colors_Light.MainColor),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10,),
              //COUPON SLIDER
              SizedBox(
                height: 65, // Height of each page in the PageView
                child: PageView.builder(
                  reverse: false,
                  controller: coupon,
                  itemCount: coupons.length,
                  itemBuilder: (context, index) {
                    return CouponCard(
                      bank: coupons[index]["bank"]!,
                      code: coupons[index]["code"]!,
                      discount: coupons[index]["discount"]!,
                    );
                  },
                ),
              ),

              SizedBox(height: 20),
              //TOP CATEGORIES TITLE
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Total Categories",
                      style: Theme.of(context).textTheme.bodyLarge,
                      textAlign: TextAlign.center,
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () => Navigator.pushNamed(context,AllCategory.routeName),
                      child: Text(
                        "View all",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: app_Colors_Light.MainColor),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 5,),
              // GRid View
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.all(16),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          childAspectRatio: 0.9,
                          //mainAxisExtent: 85,

                      ),
                      itemCount: services.length,
                      controller: allpage,
                      itemBuilder: (context, index) {
                        return ServiceTile(
                          icon: services[index]['icon'],
                          label: services[index]['label'],
                        );
                      },
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10),

              // FEATURED SERVICES

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Featured services",
                      style: Theme.of(context).textTheme.bodyLarge,
                      textAlign: TextAlign.center,
                    ),
                    Spacer(),
                    Text(
                      "View all",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: app_Colors_Light.MainColor),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

              SizedBox(height: 15,),

              // THE LIST OF FEATURED SERVICES
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: ListView.builder(
                  padding: EdgeInsets.all(0),
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    if (index == 2 ) {
                      return SizedBox(height: 20);
                    }  else {
                      return InkWell(
                        onTap: () => Navigator.pushNamed(context,Singleservice_user.routeName),
                        child: Container(
                          margin: EdgeInsets.only(bottom: 15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Theme
                                .of(context)
                                .colorScheme
                                .outline, width: 0.5),
                            color: Theme
                                .of(context)
                                .scaffoldBackgroundColor,

                          ),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 15,
                                      backgroundImage: AssetImage(
                                          "assets/images/service man.jpg"),
                                    ),
                                    SizedBox(width: 10,),
                                    Text("Zeyad Nabawy", style: Theme
                                        .of(context)
                                        .textTheme
                                        .bodyMedium,),
                                    Spacer(),
                                    Icon(FontAwesomeIcons.solidStar,
                                      color: app_Colors_Light.Rate_color,
                                      size: 10,),
                                    SizedBox(width: 3,),
                                    Text("3.3", style: Theme
                                        .of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(fontSize: 13),),
                                  ],
                                ),
                              ),
                              // IMAGE
                              Stack(
                                children: [
                                  Image(
                                    image: AssetImage(
                                        "assets/images/service man.jpg"),
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                  Positioned(
                                    top: 10,
                                    right: 20,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      decoration: BoxDecoration(
                                        color: app_Colors_Light.OFFER_Selcted,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Text("10%", style: Theme
                                          .of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(color: Colors.white),),
                                    ),
                                  )
                                ],
                              ),

                              SizedBox(height: 10,),

                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  children: [
                                    Text(
                                      "Cleaning Services",
                                      style: Theme
                                          .of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                    Spacer(),
                                    Text(
                                      "\$40.56",
                                      style: Theme
                                          .of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    ),
                                    SizedBox(width: 7,),
                                    Text(
                                      "\$30",
                                      style: Theme
                                          .of(context)
                                          .textTheme
                                          .bodyMedium,
                                    )
                                  ],
                                ),
                              ),

                              SizedBox(height: 10,),

                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  children: [
                                    Icon(Icons.access_time_outlined,
                                      color: app_Colors_Light.Success_color,),
                                    SizedBox(width: 7,),
                                    Text(
                                      "30mins",
                                      style: Theme
                                          .of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                          color: app_Colors_Light.Success_color),
                                    )
                                  ],
                                ),
                              ),

                              SizedBox(height: 10,),

                              //ABOUT

                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        "foamjet technology removes dust 2x deeper --->",
                                        style: Theme
                                            .of(context)
                                            .textTheme
                                            .bodySmall,
                                      ),
                                    ),
                                    Expanded(
                                        flex: 1, child: CustomButton(text: "ADD"))
                                  ],
                                ),
                              ),
                              SizedBox(height: 15,)


                            ],
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),

              SizedBox(height: 10,),

              // EXPERT SERVICES BY RATING

              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Expert SerVices by rating",
                            style: Theme.of(context).textTheme.bodyLarge,
                            textAlign: TextAlign.center,
                          ),
                          Spacer(),
                          Text(
                            "View all",
                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: app_Colors_Light.MainColor),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      child: ListView.builder(
                        padding: EdgeInsets.all(0),
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 2,
                        itemBuilder: (context, index) {
                          if (index == 2) {
                            return SizedBox(height: 20);
                          } else {
                            return Container(
                              margin: EdgeInsets.only(bottom: 15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: Theme.of
                                      (context).colorScheme.outline,
                                    width: 0.5),
                                color: Theme.of(context).scaffoldBackgroundColor,
                              ),
                              child: Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Theme.of(context).scaffoldBackgroundColor,
                                  border: Border.all(color: Theme.of(context).colorScheme.outline),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(width: 5),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image(
                                        image: AssetImage("assets/images/person.jpg"),
                                        width: 90,
                                        color: Theme.of(context).cardColor,
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                  "Zeyad Nabawy",
                                                style: Theme.of(context).textTheme.bodyMedium,
                                              ),
                                              Spacer(),
                                              Icon(FontAwesomeIcons.solidStar, size: 10,color: app_Colors_Light.Rate_color,),
                                              SizedBox(width: 3),
                                              Text(

                                                  "3.3",

                                                style: Theme.of(context).textTheme.bodyMedium,

                                              )
                                            ],
                                          ),
                                          SizedBox(height: 4,),
                                          Text(

                                              "Painting services",

                                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(

                                                fontSize: 12,
                                            ),

                                          ),
                                          SizedBox(height: 20,),
                                          Row(
                                            children: [
                                              Icon(Icons.location_on_outlined,color: Theme.of(context).textTheme.bodySmall!.color,size: 20,),
                                              SizedBox(width: 4,),
                                              Text(
                                                  "Egypt,Zagazig,EL Zhoor",
                                                style: Theme.of(context).textTheme.bodySmall,
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                    SizedBox(height: 10,),
                  ],
                ),
              ),

              //SizedBox(height: 10),


              ///THE END

            ],
          ),
        ),
      ),
    );
  }
}
