import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Utils/Colors/colors.dart';
import '../../../Utils/Elevated_Button/button.dart';
import '../../../Views/Providers/SingleService/singleservice.dart';
import '../../../providers_state_mange/settings/settings.dart';

Widget serviceRequestCard({

  required BuildContext context,
  required String requestId,
  required String serviceName,
  required String price,
  required String status,
  required String dateTime,
  required String location,
  required String paymentStatus,
  required String customerName,
  required String customerImage,
  required String serviceImage,
  required Color statusColor,
  void Function()? onTap,
}) {
  // Get the device width and height
  double screenWidth = MediaQuery.of(context).size.width;
  var provider = Provider.of<setting_Providers>(context);

  return InkWell(
    onTap: onTap,
    child: Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Theme.of(context).colorScheme.outline),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    requestId,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: app_Colors_Light.MainColor),
                  ),
                  SizedBox(height: 5),
                  Text(serviceName, style: Theme.of(context).textTheme.bodyMedium),
                  SizedBox(height: 5),
                  Text("\$$price", style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),
              Spacer(),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image(
                  image: AssetImage(serviceImage),
                  width: screenWidth > 600 ? 120 : 90, // Adjust image size based on screen width
                  height: screenWidth > 600 ? 120 : 90, // Adjust image size based on screen width
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          dashedDivider(context),
          SizedBox(height: 15),
          Row(
            children: [
              Text("Status", style: Theme.of(context).textTheme.bodySmall),
              Spacer(),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: statusColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  status,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Theme.of(context).scaffoldBackgroundColor),
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          Row(
            children: [
              Text("Date & Time", style: Theme.of(context).textTheme.bodySmall),
              Spacer(),
              Text(dateTime, style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
          SizedBox(height: 15),
          Row(
            children: [
              Text("Location", style: Theme.of(context).textTheme.bodySmall),
              Spacer(),
              Text(location, style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
          SizedBox(height: 15),
          Row(
            children: [
              Text("Payment", style: Theme.of(context).textTheme.bodySmall),
              Spacer(),
              Text(
                paymentStatus,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: paymentStatus == "Paid" ? Colors.green : Colors.red,
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).cardColor,
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 15,
                  backgroundImage: AssetImage(customerImage),
                ),
                SizedBox(width: 7),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    provider.user == "provider" ?
                    Text("Customer", style: Theme.of(context).textTheme.bodySmall):
                    Text("Provider", style: Theme.of(context).textTheme.bodySmall),
                    SizedBox(height: 5),
                    Text(customerName, style: Theme.of(context).textTheme.bodyMedium),

                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          provider.user == "provider" ?
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
              SizedBox(width: 15),
              Expanded(
                child: CustomButton(text: "Accept"),
              ),
            ],
          ) : Container(),
        ],
      ),
    ),
  );
}

Widget dashedDivider(BuildContext context, {double dashWidth = 8.0, double dashHeight = 1.0}) {
  return CustomPaint(
    size: Size(double.infinity, dashHeight),
    painter: DashedLinePainter(
      dashWidth: dashWidth,
      dashHeight: dashHeight,
      color: Theme.of(context).colorScheme.outline,
    ),
  );
}
