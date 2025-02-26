import 'package:flutter/material.dart';
import 'package:scrollable_clean_calendar/controllers/clean_calendar_controller.dart';
import 'package:scrollable_clean_calendar/scrollable_clean_calendar.dart';
import 'package:scrollable_clean_calendar/utils/enums.dart';
import 'package:yourcolor/Utils/Colors/colors.dart';
import '../../Widgets/Home/bookings/Details_booking/details_booking.dart';
import '../../Widgets/Home/bookings/bookings.dart';
import '../../generated/l10n.dart';

class booking_screen extends StatefulWidget {
  const booking_screen({super.key});

  @override
  State<booking_screen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<booking_screen>
    with TickerProviderStateMixin {
  final calendarController = CleanCalendarController(
    minDate: DateTime(2024, 1, 1),
    maxDate: DateTime.now().add(const Duration(days: 365)),
    onRangeSelected: (firstDate, secondDate) {},
    onDayTapped: (date) {},
    onPreviousMinDateTapped: (date) {},
    onAfterMaxDateTapped: (date) {},
    weekdayStart: DateTime.monday,
  );
  late TabController tabController;
  DateTime? rangeStart;
  DateTime? rangeEnd;

  String selectedStatus = "All booking";

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  // List of bookings
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
    {
      "requestId": "#15265",
      "serviceName": "Window Washing",
      "price": "15.75",
      "status": "Pending",
      "dateTime": "8 Sep, 2024 - 10:00am",
      "location": "Texas-USA",
      "paymentStatus": "Not paid yet",
      "customerName": "Sara Mohamed",
      "customerImage": "assets/images/me.jpg",
      "serviceImage": "assets/images/serviceman.jpg",
      "statusColor": app_Colors_Light.Rate_color,
    },
    {
      "requestId": "#15266",
      "serviceName": "General Cleaning",
      "price": "30.00",
      "status": "Cancelled",
      "dateTime": "9 Sep, 2024 - 2:00pm",
      "location": "Florida-USA",
      "paymentStatus": "Refunded",
      "customerName": "Mona Sameh",
      "customerImage": "assets/images/me.jpg",
      "serviceImage": "assets/images/serviceman.jpg",
      "statusColor": Colors.red,
    },
  ];

  List<Map<String, dynamic>> get filteredBookings {
    if (selectedStatus == "All booking") {
      return bookings;
    }
    return bookings
        .where((booking) => booking["status"] == selectedStatus)
        .toList();
  }

  void showFilterSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, setState) {
            return DefaultTabController(
              length: 3,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TabBar(
                        labelStyle: Theme.of(context).textTheme.bodySmall,
                        dividerHeight: 0,
                        dividerColor: Theme.of(context).scaffoldBackgroundColor,
                        controller: tabController,
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicator: BoxDecoration(
                          color: app_Colors_Light.MainColor,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        labelColor: Colors.white,
                        unselectedLabelColor: Colors.grey,
                        tabs: const [
                          Tab(text: "Status"),
                          Tab(text: "Date"),
                          Tab(text: "Category"),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: TabBarView(
                        controller: tabController,
                        children: [
                          ListView(
                            shrinkWrap: true,
                            children: [
                              ...[
                                "All booking",
                                "Pending",
                                "Completed",
                                "Cancelled"
                              ].map((status) {
                                return RadioListTile<String>(
                                  fillColor: WidgetStatePropertyAll(
                                      app_Colors_Light.MainColor),
                                  title: Text(status,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium),
                                  value: status,
                                  groupValue: selectedStatus,
                                  onChanged: (value) {
                                    Navigator.pop(context, value);
                                  },
                                );
                              }),
                            ],
                          ),
                          ScrollableCleanCalendar(
                            showWeekdays: true,
                            dayBackgroundColor: Theme.of(context).cardColor,
                            daySelectedBackgroundColorBetween:
                                app_Colors_Light.MainColor,
                            calendarController: calendarController,
                            daySelectedBackgroundColor:
                                app_Colors_Light.MainColor,
                            dayDisableColor: Colors.black,
                            dayDisableBackgroundColor:
                                Theme.of(context).cardColor,
                            layout: Layout.DEFAULT,
                            calendarCrossAxisSpacing: 10,
                            calendarMainAxisSpacing: 10,
                          ),
                          ListView(
                            shrinkWrap: true,
                            physics: const AlwaysScrollableScrollPhysics(),
                            children: List.generate(6, (index) {
                              return ListTile(
                                leading: const Icon(Icons.category,
                                    color: Colors.grey),
                                title: Text("Category ${index + 1}"),
                                trailing: Checkbox(
                                  value: false,
                                  onChanged: (bool? value) {},
                                ),
                              );
                            }),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    ).then((value) {
      if (value != null) {
        setState(() {
          selectedStatus = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text("Bookings",
                        style: Theme.of(context).textTheme.bodyMedium),
                    const Spacer(),
                    GestureDetector(
                      onTap: () => showFilterSheet(),
                      child: Container(
                        padding: EdgeInsets.all(screenWidth * 0.01),
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.filter_alt_outlined),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.02),
                SizedBox(
                  height: screenHeight * 0.06,
                  child: TextField(
                    style: Theme.of(context).textTheme.bodySmall,
                    decoration: InputDecoration(
                      hintStyle: Theme.of(context).textTheme.bodySmall,
                      hintText: S.of(context).Search_here,
                      prefixIcon: Icon(
                        Icons.search,
                        color: Theme.of(context).textTheme.bodySmall!.color,
                      ),
                      filled: true,
                      fillColor: Theme.of(context).cardColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(screenWidth * 0.05),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Text(selectedStatus,
                    style: Theme.of(context).textTheme.bodyMedium),
                SizedBox(height: screenHeight * 0.02),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: filteredBookings.length +
                      1, // زيادة العدد بمقدار واحد لإضافة SizedBox في النهاية
                  padding: const EdgeInsets.all(0),
                  itemBuilder: (context, index) {
                    if (index == filteredBookings.length) {
                      return const SizedBox(height: 10);
                    } else {
                      final booking = filteredBookings[index];
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
        ),
      ),
    );
  }
}
