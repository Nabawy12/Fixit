import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yourcolor/Utils/Colors/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../../Utils/Truncation/Text.dart';
import '../../../Widgets/Home/bookings/Details_booking/details_booking.dart';
import '../../../Widgets/Home/bookings/bookings.dart';
import '../../../providers_state_mange/settings/settings.dart';
import '../SingleService/singleservice.dart';

class home_provider extends StatefulWidget {
  const home_provider({super.key});

  @override
  State<home_provider> createState() => _home_providerState();
}

class _home_providerState extends State<home_provider> {
  String selectedTimeFrame = 'W';
  int selectedDayIndex = 2;
  Map<String, List<double>> chartData = {
    'W': [5, 10, 6, 15, 8, 10, 12],
    'M': [12, 7, 14, 18, 10, 9, 16],
    'Y': [15, 10, 20, 13, 11, 17, 50],
  };
  final List<Map<String, dynamic>> bookings = [
    {
      "requestId": "#15263",
      "serviceName": "Cleaning of bathroom",
      "price": "12.15",
      "status": "Pending",
      "dateTime": "6 Sep, 2024 - 6:00pm",
      "location": "California-USA",
      "paymentStatus": "Not paid yet",
      "customerName": "Zeyad Nabawy Mostafa Fayed",
      "customerImage": "assets/images/me.jpg",
      "serviceImage": "assets/images/serviceman.jpg",
      "statusColor": app_Colors_Light.Rate_color,
    },
    {
      "requestId": "#15264",
      "serviceName": "Carpet Cleaning",
      "price": "20.50",
      "status": "Completed",
      "dateTime": "7 Sep, 2024 - 4:00pm",
      "location": "New York-USA",
      "paymentStatus": "Paid",
      "customerName": "Ahmed Ali",
      "customerImage": "assets/images/me.jpg",
      "serviceImage": "assets/images/serviceman.jpg",
      "statusColor": Colors.green,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final settingProvider = Provider.of<setting_Providers>(context);
    // Screen size variables
    // final screenWidth = MediaQuery.of(context).size.width;
    // final screenHeight = MediaQuery.of(context).size.height;
    // final isSmallScreen = screenWidth < 360;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                  height: MediaQuery.of(context).size.height *
                      0.02), // Dynamic height

              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width *
                      0.04, // 4% of screen width
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: MediaQuery.of(context).size.width *
                          0.05, // CircleAvatar size relative to screen width
                      backgroundColor: Theme.of(context).cardColor,
                      backgroundImage:
                          const AssetImage("assets/images/serviceman.jpg"),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width *
                          0.02, // 2% of screen width
                    ),
                    Flexible(
                      child: TruncatedText(
                        text: "Zeyad Nabawy Mostafa",
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: EdgeInsets.all(
                        MediaQuery.of(context).size.width *
                            0.025, // Padding relative to screen width
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.message_outlined,
                        size: MediaQuery.of(context).size.width *
                            0.05, // Icon size relative to screen width
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                  height: MediaQuery.of(context).size.height *
                      0.02), // 3% of screen height

              // WALLET

              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width *
                      0.04, // 4% of screen width
                ),
                padding: EdgeInsets.all(
                  MediaQuery.of(context).size.width *
                      0.03, // 3% of screen width
                ),
                decoration: BoxDecoration(
                  color: app_Colors_Light.MainColor,
                  borderRadius: BorderRadius.circular(
                    MediaQuery.of(context).size.width *
                        0.10, // 6% of screen width
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(
                        MediaQuery.of(context).size.width *
                            0.02, // 2% of screen width
                      ),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.wallet_outlined,
                        color: app_Colors_Light.MainColor,
                        size: MediaQuery.of(context).size.width *
                            0.07, // Icon size based on width
                      ),
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width *
                            0.04), // 4% of screen width
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Wallet bal :",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                  fontSize: MediaQuery.of(context).size.width *
                                      0.035, // Font size relative to width
                                  color: Colors.white,
                                ),
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height *
                                  0.005), // Small height gap
                          Text(
                            "\$2,562.23",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                  color: Colors.white,
                                  fontSize: MediaQuery.of(context).size.width *
                                      0.045, // Larger font size
                                ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(), // 4% of screen width
                    Flexible(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width *
                                0.03, // Horizontal padding
                            vertical: MediaQuery.of(context).size.height *
                                0.01, // Vertical padding
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              MediaQuery.of(context).size.width *
                                  0.02, // Border radius
                            ),
                          ),
                        ),
                        onPressed: () {},
                        child: FittedBox(
                          child: Text(
                            "Withdraw",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: app_Colors_Light.MainColor,
                                  fontSize: MediaQuery.of(context).size.width *
                                      0.035, // Font size
                                ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width *
                            0.01), // 4% of screen width
                  ],
                ),
              ),

              SizedBox(
                  height: MediaQuery.of(context).size.height *
                      0.02), // 2% of screen height

              // REFERENCE

              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width *
                      0.04, // 4% of screen width
                ),
                child: Column(
                  children: [
                    // FIRST ROW
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.all(
                              MediaQuery.of(context).size.width *
                                  0.035, // 3.5% of screen width
                            ),
                            decoration: BoxDecoration(
                              color: Theme.of(context).cardColor,
                              borderRadius: BorderRadius.circular(
                                MediaQuery.of(context).size.width *
                                    0.03, // 3% of screen width
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(Icons.monetization_on_outlined,
                                    color: app_Colors_Light.MainColor),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.03), // 3% of screen height
                                Text(
                                  "Total Earning",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(fontSize: 15),
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01), // 1% of screen height
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "\$3,263.03",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              color:
                                                  app_Colors_Light.MainColor),
                                    ),
                                    Icon(Icons.arrow_forward,
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .color),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width *
                                0.025), // 2.5% of screen width
                        Expanded(
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.all(
                              MediaQuery.of(context).size.width * 0.035,
                            ),
                            decoration: BoxDecoration(
                              color: Theme.of(context).cardColor,
                              borderRadius: BorderRadius.circular(
                                MediaQuery.of(context).size.width * 0.03,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(Icons.bookmark_outline,
                                    color: app_Colors_Light.MainColor),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.03),
                                Text(
                                  "Total Booking",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(fontSize: 15),
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "635",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              color:
                                                  app_Colors_Light.MainColor),
                                    ),
                                    Icon(Icons.arrow_forward,
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .color),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height *
                            0.02), // 2% of screen height
                    // SECOND ROW
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.all(
                              MediaQuery.of(context).size.width * 0.035,
                            ),
                            decoration: BoxDecoration(
                              color: Theme.of(context).cardColor,
                              borderRadius: BorderRadius.circular(
                                MediaQuery.of(context).size.width * 0.03,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(Icons.monetization_on_outlined,
                                    color: app_Colors_Light.MainColor),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.03),
                                Text(
                                  "Total Services",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(fontSize: 15),
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "35",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              color:
                                                  app_Colors_Light.MainColor),
                                    ),
                                    Icon(Icons.arrow_forward,
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .color),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.025),
                        Expanded(
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.all(
                              MediaQuery.of(context).size.width * 0.035,
                            ),
                            decoration: BoxDecoration(
                              color: Theme.of(context).cardColor,
                              borderRadius: BorderRadius.circular(
                                MediaQuery.of(context).size.width * 0.03,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(Icons.monetization_on_outlined,
                                    color: app_Colors_Light.MainColor),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.03),
                                Text(
                                  "Total Categories",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(fontSize: 15),
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "60",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              color:
                                                  app_Colors_Light.MainColor),
                                    ),
                                    Icon(Icons.arrow_forward,
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .color),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(
                  height: MediaQuery.of(context).size.height *
                      0.02), // Dynamic height

              //CHARTS

              Container(
                padding: EdgeInsets.all(
                  MediaQuery.of(context).size.width *
                      0.04, // 4% of screen width
                ),
                color: Theme.of(context).cardColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Details",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height *
                          0.01, // 1% of screen height
                    ),
                    Container(
                      padding: EdgeInsets.all(
                        MediaQuery.of(context).size.width *
                            0.03, // 3% of screen width
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: BorderRadius.circular(
                          MediaQuery.of(context).size.width *
                              0.03, // 3% of screen width
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height *
                                0.01, // 1% of screen height
                          ),
                          Row(
                            children: [
                              Text(
                                'Weekly average :',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              Text(
                                ' 250k',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        color: app_Colors_Light.MainColor),
                              ),
                              const Spacer(),
                              Row(
                                children: ['W', 'M', 'Y'].map((timeFrame) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedTimeFrame = timeFrame;
                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.symmetric(
                                        horizontal:
                                            MediaQuery.of(context).size.width *
                                                0.01,
                                      ),
                                      padding: EdgeInsets.symmetric(
                                        horizontal:
                                            MediaQuery.of(context).size.width *
                                                0.02,
                                        vertical:
                                            MediaQuery.of(context).size.height *
                                                0.01,
                                      ),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: selectedTimeFrame == timeFrame
                                            ? app_Colors_Light.MainColor
                                            : Theme.of(context).cardColor,
                                      ),
                                      child: Text(
                                        timeFrame,
                                        style: TextStyle(
                                          color: selectedTimeFrame == timeFrame
                                              ? Colors.white
                                              : app_Colors_Light.MainColor,
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height *
                                0.02, // 2% of screen height
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height *
                                0.3, // 30% of screen height
                            width: double.infinity,
                            child: BarChart(
                              BarChartData(
                                barTouchData: BarTouchData(
                                  enabled: true,
                                  touchTooltipData: BarTouchTooltipData(
                                    getTooltipColor: (group) =>
                                        app_Colors_Light.MainColor,
                                    tooltipPadding: EdgeInsets.all(
                                      MediaQuery.of(context).size.width * 0.02,
                                    ),
                                    tooltipMargin:
                                        MediaQuery.of(context).size.width *
                                            0.02,
                                    getTooltipItem:
                                        (group, groupIndex, rod, rodIndex) {
                                      return BarTooltipItem(
                                        '${rod.toY.toInt()}k\nRevenue',
                                        const TextStyle(color: Colors.white),
                                      );
                                    },
                                  ),
                                  touchCallback:
                                      (FlTouchEvent event, response) {
                                    if (!event.isInterestedForInteractions ||
                                        response == null ||
                                        response.spot == null) {
                                      return;
                                    }
                                    setState(() {
                                      selectedDayIndex =
                                          response.spot!.touchedBarGroupIndex;
                                    });
                                  },
                                ),
                                titlesData: FlTitlesData(
                                  leftTitles: AxisTitles(
                                    sideTitles: SideTitles(
                                      showTitles: true,
                                      interval: 5,
                                      getTitlesWidget: (value, meta) {
                                        return Text(
                                          '${value.toInt()}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .copyWith(fontSize: 10),
                                        );
                                      },
                                    ),
                                  ),
                                  rightTitles: const AxisTitles(
                                    sideTitles: SideTitles(showTitles: false),
                                  ),
                                  topTitles: const AxisTitles(
                                    sideTitles: SideTitles(showTitles: false),
                                  ),
                                  bottomTitles: AxisTitles(
                                    sideTitles: SideTitles(
                                      showTitles: true,
                                      getTitlesWidget: (value, meta) {
                                        const days = [
                                          'M',
                                          'T',
                                          'W',
                                          'T',
                                          'F',
                                          'S',
                                          'S'
                                        ];
                                        return Text(
                                          days[value.toInt()],
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                borderData: FlBorderData(show: false),
                                barGroups: List.generate(
                                  chartData[selectedTimeFrame]!.length,
                                  (index) {
                                    final isSelected =
                                        index == selectedDayIndex;
                                    return BarChartGroupData(
                                      x: index,
                                      barRods: [
                                        BarChartRodData(
                                          toY: chartData[selectedTimeFrame]![
                                              index],
                                          color: isSelected
                                              ? app_Colors_Light.MainColor
                                              : Colors.grey[300],
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.04,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                                gridData: const FlGridData(show: false),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                  height: MediaQuery.of(context).size.height *
                      0.02), // Dynamic height

              // RECENT BOOKING

              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width *
                        0.04), // Adjust margin
                child: Column(
                  children: [
                    // TITLE OF CARD
                    Row(
                      children: [
                        Text(
                          "Recent bookings",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const Spacer(),
                        Text(
                          "View all",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: app_Colors_Light.MainColor),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height *
                          0.03, // Adjust spacing
                    ),
                    // THE LIST
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: bookings.length,
                      padding: const EdgeInsets.all(0),
                      itemBuilder: (context, index) {
                        if (index == bookings.length) {
                          return const SizedBox(height: 10);
                        } else {
                          final booking = bookings[index];
                          return serviceRequestCard(
                            onTap: () => Navigator.pushNamed(
                                context, DetailsBooking.routeName),
                            context: context,
                            requestId: booking["requestId"],
                            serviceName: booking["serviceName"],
                            price: booking["price"],
                            status: booking["status"],
                            dateTime: booking["dateTime"],
                            location: booking["location"],
                            paymentStatus: booking["paymentStatus"],
                            customerName: booking["customerName"],
                            customerImage: booking["customerImage"],
                            serviceImage: booking["serviceImage"],
                            statusColor: booking["statusColor"],
                          );
                        }
                      },
                    )
                  ],
                ),
              ),

              SizedBox(
                  height: MediaQuery.of(context).size.height *
                      0.03), // 3% of screen height

              //POPULAR SERVICE

              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width *
                        0.04), // Dynamic padding
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                ),
                child: Column(
                  children: [
                    // TITLE OF CARD
                    SizedBox(
                        height: MediaQuery.of(context).size.height *
                            0.02), // Dynamic spacing
                    Row(
                      children: [
                        Text(
                          "Popular Services",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const Spacer(),
                        Text(
                          "View all",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: app_Colors_Light.MainColor),
                        ),
                      ],
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height *
                            0.03), // Dynamic spacing
                    // THE LIST
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () => Navigator.pushNamed(
                              context, Singleservice_Pro.routeName),
                          child: Container(
                            margin: EdgeInsets.only(
                                bottom: MediaQuery.of(context).size.height *
                                    0.03), // Dynamic margin
                            padding: EdgeInsets.all(
                                MediaQuery.of(context).size.width *
                                    0.03), // Dynamic padding
                            decoration: BoxDecoration(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // PHOTO OF SERVICES
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    "assets/images/serviceman.jpg",
                                    width: MediaQuery.of(context).size.width *
                                        0.9, // Dynamic width
                                    height: MediaQuery.of(context).size.height *
                                        0.2, // Dynamic height
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                // DETAILS ABOUT USER
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.02), // Dynamic spacing
                                Row(
                                  children: [
                                    Text(
                                      "Ac water drop solution",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                    const Spacer(),
                                    Text(
                                      "\$12.00",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01), // Dynamic spacing
                                Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(
                                          MediaQuery.of(context).size.width *
                                              0.005), // Dynamic padding
                                      decoration: BoxDecoration(
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .color,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.01), // Dynamic spacing
                                    Text(
                                      "Ac Repair",
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.015), // Dynamic spacing
                                    Icon(
                                      Icons.bookmark_outline,
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .color,
                                      size: MediaQuery.of(context).size.width *
                                          0.04, // Dynamic icon size
                                    ),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.005), // Dynamic spacing
                                    Text(
                                      "255 booked",
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ],
                                ),
                                // NAME OF USER AND RATE
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.02), // Dynamic spacing
                                Container(
                                  padding: EdgeInsets.all(
                                      MediaQuery.of(context).size.width *
                                          0.03), // Dynamic padding
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).cardColor,
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .outline),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Active Status",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                      const Spacer(),
                                      Switch(
                                        inactiveTrackColor:
                                            app_Colors_Light.BG_Card_color,
                                        inactiveThumbColor: Colors.grey,
                                        trackOutlineColor:
                                            WidgetStatePropertyAll(
                                                app_Colors_Light.BG_Card_color),
                                        activeColor: app_Colors_Light.MainColor,
                                        value: settingProvider.currentTheme ==
                                            ThemeMode.dark,
                                        onChanged: (value) {
                                          settingProvider.changeCurrentTheme(
                                            value
                                                ? ThemeMode.dark
                                                : ThemeMode.light,
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01), // Dynamic spacing
                              ],
                            ),
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
      ),
    );
  }
}
