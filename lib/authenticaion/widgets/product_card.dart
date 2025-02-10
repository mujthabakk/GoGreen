import 'dart:developer';

import 'package:djangowithflutter/core/colors.dart';
import 'package:djangowithflutter/product_details/product_details_page.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final bool isMobile = screenSize.width <= 600; // Define mobile breakpoint

    // Card dimensions
    final double cardHeight = isMobile ? 320 : 430;
    final cardWidth =
        isMobile ? screenSize.width * 0.40 : screenSize.width * 0.30;

    return InkWell(
      onTap: () {
        log("message");
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const ProductDetailsScreen()));
      },
      child: Container(
        height: cardHeight,
        width: cardWidth,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image section
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              child: Image.asset(
                'assets/image/login_background_img.jpg',
                fit: BoxFit.cover,
                width: double.infinity,
                height:
                    isMobile ? 100 : 150, // Adjust height for mobile and web
              ),
            ),

            // Product details
            Padding(
              padding: EdgeInsets.all(isMobile ? 16 : screenSize.width * 0.01),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product title
                  Text(
                    'ZZ plant',
                    style: TextStyle(
                      fontSize: isMobile ? 16 : 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  // Pricing
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'In Stock',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: isMobile ? 14 : 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            '₹98',
                            style: TextStyle(
                              fontSize: isMobile ? 14 : 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '₹98',
                            style: TextStyle(
                              fontSize: isMobile ? 12 : 14,
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: screenSize.width * 0.02),

                  // Description
                  Text(
                    'A low-maintenance indoor plant with glossy green leaves, thriving in low light with minimal watering—perfect for homes and offices.',
                    style: TextStyle(
                      fontSize: isMobile ? 12 : 14,
                      color: Colors.grey[700],
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  isMobile
                      ? SizedBox(height: screenSize.height * 0.01)
                      : SizedBox(height: screenSize.width * 0.004),
                  Row(
                    children: List.generate(
                      5,
                      (index) => Icon(Icons.star,
                          color: Colors.yellow,
                          size: isMobile
                              ? screenSize.width * 0.045
                              : screenSize.width * 0.023),
                    ),
                  ),

                  isMobile
                      ? SizedBox(height: screenSize.height * 0.02)
                      : SizedBox(height: screenSize.width * 0.01),

                  // Add to Cart button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        padding: EdgeInsets.symmetric(
                          vertical: isMobile ? 12 : 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'ADD TO CART',
                        style: TextStyle(
                          fontSize: isMobile ? 14 : 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
