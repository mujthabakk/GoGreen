import 'package:djangowithflutter/core/colors.dart';
import 'package:djangowithflutter/home/view/home_page.dart';
import 'package:flutter/material.dart';

class PotsplantetScreen extends StatelessWidget {
  const PotsplantetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    bool isMobile = screenSize.width <= 600;
    // final double cardHeight = isMobile ? 320 : 330;
    // final cardWidth =
    isMobile ? screenSize.width * 0.40 : screenSize.width * 0.30;
    return SingleChildScrollView(
      child: Column(
        children: [
          isMobile ? ImageCarousel() : const SizedBox.shrink(),
          Padding(
            padding: EdgeInsets.only(
                right: screenSize.width * 0.05,
                left: screenSize.width * 0.05,
                bottom: screenSize.width * 0.05),
            child: Column(
              children: [
                SizedBox(
                  height: screenSize.width * 0.02,
                ),
                Text(
                  "Seeds",
                  style: TextStyle(
                    fontSize: isMobile ? 24 : 34,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
                SizedBox(
                  height: screenSize.width * 0.02,
                ),
                Row(children: [
                  Text(
                    "Indoor Plants",
                    style: TextStyle(
                      fontSize: isMobile ? 16 : 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    width: screenSize.width * 0.18,
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.primary, // Set border color here
                        width: 2, // Adjust the width of the border if needed
                      ),
                      // color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.search, color: Colors.grey),
                        hintText: 'Search plants or seeds',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: 16, top: 8),
                      ),
                    ),
                  ),
                ]),
                SizedBox(
                  height: screenSize.width * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 0),
                  child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 300,
                        crossAxisSpacing: 40,
                        mainAxisSpacing: 40,
                        mainAxisExtent: isMobile ? null : 450,
                        childAspectRatio: .61),
                    itemBuilder: (context, index) {
                      return const ProductCard();
                    },
                    itemCount: 25,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
