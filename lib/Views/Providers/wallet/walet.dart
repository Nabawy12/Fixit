import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../Utils/Colors/colors.dart';

class Walet extends StatelessWidget {
  const Walet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // app bar
                Row(
                  children: [
                    Text("Wallet",
                        style: Theme.of(context).textTheme.bodyLarge),
                    Spacer(),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).cardColor,
                      ),
                      child: Icon(
                        Icons.add,
                        size: 20,
                        color: Theme.of(context).textTheme.bodyMedium!.color,
                      ),
                    ),
                  ],
                ),

                SizedBox(
                    height: MediaQuery.of(context).size.height *
                        0.02), // 3% of screen height
                // MONEY IN WITHDRAW
                Container(
                  alignment: Alignment.center,
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
                        decoration: BoxDecoration(
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
                                    fontSize: MediaQuery.of(context)
                                            .size
                                            .width *
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
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.045, // Larger font size
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(), // 4% of screen width
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
                                    fontSize:
                                        MediaQuery.of(context).size.width *
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
                        0.03), // 3% of screen height
                // TiTLE OF TEXT UP OF LIST VIEW
                Text(
                  "Payment histroy",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                SizedBox(
                    height: MediaQuery.of(context).size.height *
                        0.02), // 3% of screen height
                //DATA
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.all(0),
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            color: Theme.of(context).colorScheme.outline),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Title OF CARD
                          Row(
                            children: [
                              Text(
                                "Chimney sweeping",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              Spacer(),
                              Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: app_Colors_Light.BG_Selcted,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Text(
                                  "#032",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                          color: app_Colors_Light.MainColor),
                                ),
                              )
                            ],
                          ),

                          SizedBox(
                              height: MediaQuery.of(context).size.height *
                                  0.02), // 3% of screen height

                          // AMOUNT
                          Text(
                            "\$21.78",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),

                          SizedBox(
                              height: MediaQuery.of(context).size.height *
                                  0.02), // 3% of screen height

                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: Theme.of(context).colorScheme.outline),
                              color: Theme.of(context).cardColor,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "payment ID",
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                    Spacer(),
                                    Text(
                                      "#1536",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    )
                                  ],
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.02), // 3% of screen height
                                Row(
                                  children: [
                                    Text(
                                      "Method type",
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                    Spacer(),
                                    Text(
                                      "Cash",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    )
                                  ],
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.02), // 3% of screen height
                                Row(
                                  children: [
                                    Text(
                                      "Status",
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                    Spacer(),
                                    Text(
                                      "paid",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    )
                                  ],
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.02), // 3% of screen height
                              ],
                            ),
                          ),

                          SizedBox(
                              height: MediaQuery.of(context).size.height *
                                  0.04), // 3% of screen height

                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              border: Border.all(
                                  color: Theme.of(context).colorScheme.outline,
                                  width: 1),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  spreadRadius: 0,
                                  blurRadius: 1,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 20,
                                  backgroundImage: AssetImage(
                                      "assets/images/serviceman.jpg"),
                                ),
                                SizedBox(
                                    width: MediaQuery.of(context).size.height *
                                        0.01), // 3% of screen height
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Customer",
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                    Text(
                                      "Zeyad Nabawy",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Icon(
                                  FontAwesomeIcons.arrowRightLong,
                                  size: 17,
                                  color: app_Colors_Light.MainColor,
                                )
                              ],
                            ),
                          ),

                          SizedBox(
                              height: MediaQuery.of(context).size.height *
                                  0.01), // 3% of screen height
                        ],
                      ),
                    );
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
