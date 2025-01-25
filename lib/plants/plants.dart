import 'package:djangowithflutter/home/view/home_page.dart';
import 'package:flutter/material.dart';

class PalantsScreen extends StatelessWidget {
  const PalantsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    bool isMobile = screenSize.width <= 600;
    // final double cardHeight = isMobile ? 320 : 330;
    // final cardWidth =
    //     isMobile ? screenSize.width * 0.40 : screenSize.width * 0.30;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: screenSize.width * 0.01,
          ),
          Padding(
            padding: EdgeInsets.only(
                left: screenSize.width * 0.05,
                right: screenSize.width * 0.05,
                bottom: screenSize.width * 0.05),
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
              itemCount: 50,
            ),
          ),
        ],
      ),
    );
  }
}
