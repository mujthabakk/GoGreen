import 'package:djangowithflutter/core/colors.dart';
import 'package:flutter/material.dart';

class ResponsiveFooter extends StatelessWidget {
  const ResponsiveFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 600;

        return Container(
          color: AppColors.primary, // Green background color
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              isMobile
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildAboutUs(),
                        const SizedBox(height: 24),
                        buildLocation(),
                        const SizedBox(height: 24),
                        buildContactUs(),
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: buildAboutUs(),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: buildLocation(),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: buildContactUs(),
                          ),
                        ),
                      ],
                    ),
              const SizedBox(height: 24),
              const Center(
                child: Text(
                  "© 2025, Go Green. All rights reserved.",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildAboutUs() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "About Us",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        SizedBox(height: 8),
        Text(
          "Welcome to Go Green, an online marketplace based in Kerala, India, connecting farmers with buyers across the nation. Our platform empowers farmers to sell a wide variety of plants and seeds, helping them reach a broader audience. Buyers can explore an extensive selection of eco-friendly products to bring nature closer to their lives. At Go Green, we strive to make gardening accessible and support sustainable farming practices for a greener future.",
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
      ],
    );
  }

  Widget buildLocation() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Location",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        SizedBox(height: 8),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.location_on, color: Colors.white),
            SizedBox(width: 8),
            Expanded(
              child: Text(
                "Vadakara, Kozhikode, Kerala, India, PIN 673102.",
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildContactUs() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Contact Us",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.email, color: Colors.white),
            SizedBox(width: 16),
            Icon(Icons.phone, color: Colors.white),
            SizedBox(width: 16),
            Icon(Icons.camera_alt, color: Colors.white),
          ],
        ),
      ],
    );
  }
}
