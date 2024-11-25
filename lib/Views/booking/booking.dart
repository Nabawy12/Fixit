import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:yourcolor/Utils/Colors/colors.dart';

import '../../Widgets/Home/bookings/Details_booking/details_booking.dart';
import '../../Widgets/Home/bookings/bookings.dart';
import '../../generated/l10n.dart';

class booking_screen extends StatefulWidget {
  const booking_screen({super.key});

  @override
  State<booking_screen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<booking_screen> with TickerProviderStateMixin {
  late TabController _tabController;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  String selectedStatus = "All booking";

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
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
      "serviceImage": "assets/images/service man.jpg",
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
      "serviceImage": "assets/images/service man.jpg",
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
      "serviceImage": "assets/images/service man.jpg",
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
      "serviceImage": "assets/images/service man.jpg",
      "statusColor": Colors.red,
    },

  ];


  List<Map<String, dynamic>> get filteredBookings {
    if (selectedStatus == "All booking") {
      return bookings;
    }
    return bookings.where((booking) => booking["status"] == selectedStatus).toList();
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
                        controller: _tabController,
                        children: [
                          ListView(
                            shrinkWrap: true,
                            children: [
                              ...["All booking", "Pending", "Completed", "Cancelled"]
                                  .map((status) {
                                return RadioListTile<String>(
                                  fillColor: WidgetStatePropertyAll(app_Colors_Light.MainColor),
                                  title: Text(status, style: Theme.of(context).textTheme.bodyMedium),
                                  value: status,
                                  groupValue: selectedStatus,
                                  onChanged: (value) {
                                    Navigator.pop(context, value);
                                  },
                                );
                              }).toList(),
                            ],
                          ),
                          TableCalendar(
                            rangeSelectionMode: RangeSelectionMode.toggledOn,
                            firstDay: DateTime.utc(2024, 10, 1),
                            lastDay: DateTime.utc(2100, 12, 31),
                            focusedDay: _rangeStart ?? DateTime.now(),
                            selectedDayPredicate: (day) {
                              return day == _rangeStart ||
                                  day == _rangeEnd ||
                                  (day.isAfter(_rangeStart ?? DateTime.now()) &&
                                      day.isBefore(_rangeEnd ?? DateTime.now()));
                            },
                            rangeStartDay: _rangeStart,
                            rangeEndDay: _rangeEnd,
                            onDaySelected: (selectedDay, focusedDay) {
                              setState(() {
                                if (_rangeStart == null || _rangeEnd != null) {
                                  _rangeStart = selectedDay;
                                  _rangeEnd = null;
                                } else if (selectedDay.isBefore(_rangeStart!)) {
                                  _rangeStart = selectedDay;
                                } else {
                                  _rangeEnd = selectedDay;
                                }
                              });
                            },
                          ),
                          ListView(
                            shrinkWrap: true,
                            physics: const AlwaysScrollableScrollPhysics(),
                            children: List.generate(6, (index) {
                              return ListTile(
                                leading: Icon(Icons.category, color: Colors.grey),
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
                    Text("Bookings", style: Theme.of(context).textTheme.bodyMedium),
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
                Container(
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
                Text(selectedStatus, style: Theme.of(context).textTheme.bodyMedium),
                SizedBox(height: screenHeight * 0.02),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: filteredBookings.length + 1, // زيادة العدد بمقدار واحد لإضافة SizedBox في النهاية
                  padding: EdgeInsets.all(0),
                  itemBuilder: (context, index) {
                    if (index == filteredBookings.length) {
                      return SizedBox(height: 10);
                    } else {
                      final booking = filteredBookings[index];
                      return serviceRequestCard(
                        onTap: () => Navigator.pushNamed(context, DetailsBooking.routeName),
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
