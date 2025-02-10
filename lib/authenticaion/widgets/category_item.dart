import 'package:carousel_slider/carousel_slider.dart';
import 'package:djangowithflutter/core/colors.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final String imagePath;

  const CategoryItem({
    super.key,
    required this.title,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    bool isMobile = screenSize.width <= 600;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: screenSize.width * 0.05), // Adjust padding if needed
      child: Column(
        children: [
          ClipOval(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: MediaQuery.of(context).size.width *
                    0.09, // Minimum width (15% of screen width)
                minHeight: MediaQuery.of(context).size.width *
                    0.09, // Minimum height (15% of screen width)
                maxWidth: MediaQuery.of(context).size.width *
                    0.3, // Maximum width (30% of screen width)
                maxHeight: MediaQuery.of(context).size.width *
                    0.3, // Maximum height (30% of screen width)
              ),
              child: Image.asset(
                imagePath,
                width: isMobile
                    ? screenSize.width * 0.20
                    : MediaQuery.of(context).size.width *
                        0.03, // Width (25% of screen width)
                height: isMobile
                    ? screenSize.width * 0.20
                    : MediaQuery.of(context).size.width *
                        0.03, //// Height (25% of screen width)
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}

class PlantCategories extends StatefulWidget {
  const PlantCategories({super.key});

  @override
  PlantCategoriesState createState() => PlantCategoriesState();
}

class PlantCategoriesState extends State<PlantCategories> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    bool isMobile = screenSize.width <= 600;
    return Center(
      child: ListView(
        padding: const EdgeInsets.all(16),
        scrollDirection: Axis.horizontal,
        children: const [
          // SizedBox(
          //   width: isMobile ? 0 : screenSize.width * 0.06,
          // ),
          CategoryItem(
            title: 'Indoor Plants',
            imagePath: 'assets/image/Group 26.png',
          ),
          CategoryItem(
            title: 'Outdoor Plants',
            imagePath: 'assets/image/Group 27.png',
          ),
          CategoryItem(
            title: 'Flowering Plants',
            imagePath: 'assets/image/Group 28.png',
          ),
          CategoryItem(
            title: 'Air Purifying Plants',
            imagePath: 'assets/image/Group 29.png',
          ),
          CategoryItem(
            title: 'Fruits & Vegetables',
            imagePath: 'assets/image/Group 30.png',
          ),
        ],
      ),
    );
  }
}
