import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CancelPolicy extends StatelessWidget {
  static const routeName = "/CancelPolicy";
  const CancelPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 20,),
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
                            color: Theme.of(context).textTheme.bodyMedium!.color
                        ),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "CancelPolicy",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const Spacer(),
                  ],
                ),
                SizedBox(height: 30,),
                Text(
                  '''
Welcome to Fixit – your trusted platform designed to connect you with expert service providers,\n
ensuring reliable and high-quality solutions for all your needs.\n
Whether you require home repairs, business support, or personalized services,\n
Fixit brings trusted professionals directly to your doorstep.\n\n

Our Mission\n\n

At Fixit, we understand how difficult it can be to find reliable service providers.\n
Our mission is simple: to offer a platform that brings together highly skilled professionals\n
and those in need of their services. We aim to provide seamless and stress-free solutions\n
for home repairs, maintenance, and various other service needs.\n\n

Why Choose Fixit?\n\n

1. Verified Professionals\n
   All Fixit service providers are carefully vetted and verified.\n
   We conduct background checks, skill assessments, and quality reviews\n
   to ensure you’re only connected with the most qualified experts.\n\n

2. User-Friendly Interface\n
   Our intuitive app design makes it easy to navigate through categories,\n
   find specific services, and connect with providers within minutes.\n
   From booking to payment, our app simplifies each step for a smooth experience.\n\n

3. 24/7 Service Availability\n
   Emergencies don’t wait, and neither should you.\n
   With Fixit, you have access to around-the-clock services,\n
   whether it’s a plumbing issue, electrical repairs, or any urgent assistance.\n\n

4. Transparent Pricing\n
   We believe in transparency, especially when it comes to pricing.\n
   All services come with a detailed estimate, helping you make informed choices.\n
   No hidden fees, no surprises – just fair and honest pricing.\n\n

5. Comprehensive Range of Services\n
   Fixit offers a wide range of services, from home improvement to automotive repair,\n
   beauty and wellness, and beyond. If you need it, we have it!\n
   Explore services across categories and discover what Fixit can do for you.\n\n

Our Services\n\n

Home Repairs: Plumbing, electrical, HVAC, carpentry, painting, and more.\n
Fixit has specialists ready to address every aspect of your home maintenance\n
and improvement needs.\n\n

Cleaning Services: Whether it’s a one-time deep clean or regular housekeeping,\n
our trusted providers ensure your spaces are spotless.\n\n

Automotive: For on-the-go repairs, car cleaning, or detailed inspections,\n
our automotive services bring the mechanic to you.\n\n

Health & Wellness: From fitness trainers to physiotherapists,\n
Fixit connects you with certified professionals in the health and wellness sector.\n\n

Business Support: Need assistance with office setup, networking, or IT support?\n
Our business solutions team is here to support your company’s growth.\n\n

Our Core Values\n\n

- Trust: Building trust is at the heart of what we do.\n
  We’re committed to maintaining the highest standards of service.\n
- Convenience: By simplifying the service booking process,\n
  we make it easier for you to find the help you need.\n
- Quality: We work only with top-rated professionals who have a proven track record\n
  in their field.\n
- Customer Support: Our dedicated support team is here for you, 24/7.\n
  Reach out with questions or concerns anytime.\n\n

How Fixit Works\n\n

1. Download the App: Start by downloading the Fixit app from the App Store or Google Play Store.\n
2. Register and Create Your Profile: Create a user profile that lets you save preferences,\n
   schedule services, and securely make payments.\n
3. Choose Your Service: Browse through categories, select the service you need,\n
   and book it instantly. With real-time availability and easy scheduling, Fixit saves you time.\n
4. Enjoy Top-Notch Service: Once booked, our professionals will arrive on schedule\n
   and provide the service with utmost professionalism and expertise.\n
5. Leave a Review: After the service, rate your provider and leave feedback to help other\n
   users find the best options.\n\n

Our Commitment to Safety and Quality\n\n

Safety and quality are non-negotiables at Fixit.\n
We implement strict vetting processes to ensure that every provider on our platform meets\n
our standards. Each professional undergoes a background check, skill verification,\n
and quality assurance assessment before they’re allowed to operate on Fixit.\n\n

Customer Support\n\n

Our dedicated support team is here to assist you with any questions or issues you may face.\n
Whether you need help booking a service, have a question about your provider,\n
or need assistance with app navigation, we’re here 24/7.\n
We value your feedback and continually improve Fixit based on your insights.\n\n

Join the Fixit Community Today!\n\n

By joining Fixit, you’re not just hiring a service provider – you’re becoming part\n
of a community that values quality, professionalism, and trust.\n
We invite you to experience a better, simpler way to manage your services.\n
No more lengthy phone calls, no more uncertainty. Fixit is your solution for a reliable,\n
efficient, and professional experience.
  ''',
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.bodyMedium,
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
