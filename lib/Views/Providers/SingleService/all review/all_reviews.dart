import 'package:flutter/material.dart';
import 'package:yourcolor/Utils/Colors/colors.dart';

class AllReviewsScreen extends StatefulWidget {
  static const routeName = "/AllReviewsScreen";

  const AllReviewsScreen({super.key});

  @override
  State<AllReviewsScreen> createState() => _AllReviewsScreenState();
}

class _AllReviewsScreenState extends State<AllReviewsScreen> {
  String _selectedValue = 'Lowest rate';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Row(
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
                      color: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .color!
                          .withOpacity(0.8),
                    ),
                  ),
                ),
                const Spacer(),
                Text(
                  "All Reviews",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const Spacer(),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: app_Colors_Light.MainColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: app_Colors_Light.MainColor)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.star, color: app_Colors_Light.MainColor),
                  Icon(Icons.star, color: app_Colors_Light.MainColor),
                  Icon(Icons.star, color: app_Colors_Light.MainColor),
                  Icon(Icons.star, color: app_Colors_Light.MainColor),
                  Icon(Icons.star_border, color: app_Colors_Light.MainColor),
                  const SizedBox(
                    width: 5,
                  ),
                  Text('Average rate : 4.5/5',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: app_Colors_Light.MainColor)),
                ],
              ),
            ),
            _buildReviewSummary(context),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Reviews',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      // Toggle between "Lowest rate" and "Highest rate"
                      _selectedValue = _selectedValue == 'Lowest rate'
                          ? 'Highest rate'
                          : 'Lowest rate';
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      children: [
                        Text(
                          _selectedValue,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.arrow_drop_down,
                          color: Theme.of(context).textTheme.bodySmall!.color,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            _buildReviewCard(
              name: 'Devon Lane',
              time: '12 min ago',
              rating: 4.0,
              review: 'This is amazing service I have ever get',
              serviceName: 'Chimney sweeping',
              BuildContext: context,
            ),
            const SizedBox(height: 16),
            _buildReviewCard(
              name: 'Guy Hawkins',
              time: '12 min ago',
              rating: 4.0,
              review:
                  'I just love their service & the staff nature for work, I’d like to hire them again',
              serviceName: 'House cleaning',
              BuildContext: context,
            ),
            const SizedBox(height: 16),
            _buildReviewCard(
              name: 'Jane Cooper',
              time: '12 min ago',
              rating: 4.0,
              review: 'I love their work with ease, Thank you!',
              serviceName: 'Kitchen cleaning',
              BuildContext: context,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReviewSummary(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              // Shadow for the top
              BoxShadow(
                color: Theme.of(context).cardColor,
                spreadRadius: 0,
                blurRadius: 7,
                offset: const Offset(0, -3), // Negative Y offset for top shadow
              ),
              // Shadow for the bottom
              BoxShadow(
                color: Theme.of(context).cardColor,
                spreadRadius: 0,
                blurRadius: 7,
                offset:
                    const Offset(0, 3), // Positive Y offset for bottom shadow
              ),
            ],
          ),
          child: Column(
            children: [
              _buildRatingBar('5 star', 0, Colors.amber),
              const SizedBox(height: 8),
              _buildRatingBar('4 star', 0, Colors.amber),
              const SizedBox(height: 8),
              _buildRatingBar('3 star', 0, Colors.amber),
              const SizedBox(height: 8),
              _buildRatingBar('2 star', 0, Colors.amber),
              const SizedBox(height: 8),
              _buildRatingBar('1 star', 100, Colors.amber),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRatingBar(String label, int percentage, Color color) {
    return Row(
      children: [
        Text(label, style: Theme.of(context).textTheme.bodyMedium),
        const SizedBox(width: 8),
        Expanded(
          child: Stack(
            children: [
              Container(
                height: 10,
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              FractionallySizedBox(
                widthFactor: percentage / 100,
                child: Container(
                  height: 10,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
        Text('$percentage%', style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }

  Widget _buildReviewCard({
    required String name,
    required String time,
    required BuildContext,
    required double rating,
    required String review,
    required String serviceName,
  }) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.outline),
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          // Shadow for the top
          BoxShadow(
            color: Theme.of(BuildContext).cardColor,
            spreadRadius: 0,
            blurRadius: 7,
            offset: const Offset(0, -3), // Negative Y offset for top shadow
          ),
          // Shadow for the bottom
          BoxShadow(
            color: Theme.of(BuildContext).cardColor,
            spreadRadius: 0,
            blurRadius: 7,
            offset: const Offset(0, 3), // Positive Y offset for bottom shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/images/serviceman.jpg'),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: Theme.of(BuildContext).textTheme.bodyMedium,
                    ),
                    Text(
                      time,
                      style: Theme.of(BuildContext).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Icon(Icons.star,
                      color: app_Colors_Light.Rate_color, size: 16),
                  const SizedBox(width: 4),
                  Text(rating.toString(),
                      style: Theme.of(BuildContext)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontWeight: FontWeight.w400, fontSize: 13)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            review,
            style: Theme.of(BuildContext).textTheme.bodyMedium,
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Service name : ',
                  style: Theme.of(BuildContext).textTheme.bodySmall,
                ),
                Text(
                  '$serviceName',
                  style: Theme.of(BuildContext)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 12),
                ),
                Icon(Icons.arrow_forward_ios,
                    size: 16,
                    color: Theme.of(BuildContext).textTheme.bodySmall!.color),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
