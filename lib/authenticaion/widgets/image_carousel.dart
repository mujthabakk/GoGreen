import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageCarousel extends StatelessWidget {
  ImageCarousel({super.key});

  final List<String> imagePaths = [
    'assets/image/slider (1).png',
    'assets/image/slider (2).png',
    'assets/image/slider (3).png',
    'assets/image/slider (4).png',
    'assets/image/slider (5).png',
  ];

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    bool isMobile = screenSize.width <= 600;

    return Column(
      children: [
        SizedBox(
          height: isMobile
              ? screenSize.height * 0.0
              : screenSize.height * 0.001, // Adjust if needed
        ),
        CarouselSlider(
          options: CarouselOptions(
            height: isMobile
                ? screenSize.height * 0.3
                : screenSize.height * 0.6, // 40% of screen height
            viewportFraction: 1.0, // Full width for each image
            enlargeCenterPage: false,
            enableInfiniteScroll: true,
            autoPlay: true,
          ),
          items: imagePaths.map((imagePath) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: double.infinity, // Full screen width
                  margin: const EdgeInsets.symmetric(horizontal: 0.0),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}
