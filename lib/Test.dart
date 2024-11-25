import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yourcolor/Utils/Colors/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:yourcolor/Utils/Elevated_Button/button.dart';

import '../../../Widgets/Home/bookings/Details_booking/details_booking.dart';
import '../../../providers_state_mange/settings/settings.dart';

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

  @override
  Widget build(BuildContext context) {
    final settingProvider = Provider.of<setting_Providers>(context);

    // Screen size variables
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isSmallScreen = screenWidth < 360;

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.02),
              Container(
                margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Theme.of(context).cardColor,
                      backgroundImage: AssetImage("assets/images/service man.jpg"),
                      radius: isSmallScreen ? 18 : 24,
                    ),
                    SizedBox(width: screenWidth * 0.02),
                    Text(
                      "Hello, Zeyad Nabawy!!",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: isSmallScreen ? 14 : 16,
                      ),
                    ),
                    Spacer(),
                    Container(
                      padding: EdgeInsets.all(screenWidth * 0.02),
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.message_outlined,
                        size: isSmallScreen ? 18 : 20,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              // WALLET
              Container(
                margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                padding: EdgeInsets.all(screenWidth * 0.04),
                decoration: BoxDecoration(
                  color: app_Colors_Light.MainColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(screenWidth * 0.015),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.wallet_outlined,
                        color: app_Colors_Light.MainColor,
                        size: isSmallScreen ? 18 : 24,
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.04),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Wallet bal :",
                          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontSize: isSmallScreen ? 12 : 14,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.005),
                        Text(
                          "\$2,562.23",
                          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Colors.white,
                            fontSize: isSmallScreen ? 16 : 18,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        "Withdraw",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: isSmallScreen ? 12 : 14,
                          color: app_Colors_Light.MainColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              // CHARTS
              Container(
                padding: EdgeInsets.all(screenWidth * 0.04),
                color: Theme.of(context).cardColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Details",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: isSmallScreen ? 14 : 16,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    SizedBox(
                      height: screenHeight * 0.25,
                      width: double.infinity,
                      child: BarChart(
                        BarChartData(
                          barTouchData: BarTouchData(
                            enabled: true,
                            touchTooltipData: BarTouchTooltipData(
                              getTooltipColor: (group) =>
                              app_Colors_Light.MainColor,
                              tooltipPadding: EdgeInsets.all(screenWidth * 0.02),
                              tooltipMargin: 8,
                              getTooltipItem: (group, groupIndex, rod, rodIndex) {
                                return BarTooltipItem(
                                  '${rod.toY.toInt()}k\nRevenue',
                                  TextStyle(color: Colors.white),
                                );
                              },
                            ),
                            touchCallback: (FlTouchEvent event, response) {
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
                                        .copyWith(fontSize: isSmallScreen ? 8 : 10),
                                  );
                                },
                              ),
                            ),
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                getTitlesWidget: (value, meta) {
                                  const days = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
                                  return Text(
                                    days[value.toInt()],
                                    style: Theme.of(context).textTheme.bodySmall,
                                  );
                                },
                              ),
                            ),
                          ),
                          borderData: FlBorderData(show: false),
                          barGroups: List.generate(
                            chartData[selectedTimeFrame]!.length,
                                (index) {
                              final isSelected = index == selectedDayIndex;
                              return BarChartGroupData(
                                x: index,
                                barRods: [
                                  BarChartRodData(
                                    toY: chartData[selectedTimeFrame]![index],
                                    color: isSelected
                                        ? app_Colors_Light.MainColor
                                        : Colors.grey[300],
                                    width: screenWidth * 0.05,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ],
                              );
                            },
                          ),
                          gridData: FlGridData(show: false),
                        ),
                      ),
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
