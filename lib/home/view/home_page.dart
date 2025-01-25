import 'package:flutter/material.dart';
import 'package:djangowithflutter/core/colors.dart'; // Assuming this is where AppColors are defined
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    bool isMobile = screenSize.width <= 600;
    final double cardHeight = isMobile ? 320 : 330;
    // final cardWidth =
    //     isMobile ? screenSize.width * 0.40 : screenSize.width * 0.30;
    return SingleChildScrollView(
      child: Column(
        children: [
          isMobile ? ImageCarousel() : const SizedBox.shrink(),
          SizedBox(
            height: screenSize.width * 0.01,
          ),
          SizedBox(
            height: isMobile ? screenSize.width * 0.35 : 220,
            child: const PlantCategories(),
          ),
          // Padding(
          //   padding: EdgeInsets.only(
          //       left: screenSize.width * 0.05,
          //       right: screenSize.width * 0.05,
          //       bottom: screenSize.width * 0.05),
          //   child: GridView.builder(
          //     shrinkWrap: true,
          //     gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          //         maxCrossAxisExtent: 300,
          //         crossAxisSpacing: 40,
          //         mainAxisSpacing: 40,
          //         mainAxisExtent: isMobile ? null : 450,
          //         childAspectRatio: .61),
          //     itemBuilder: (context, index) {
          //       return const ProductCardHome();
          //     },
          //     itemCount: 50,
          //   ),
          // ),
          Padding(
            padding: EdgeInsets.only(
                left: screenSize.width * 0.03,
                right: screenSize.width * 0.03,
                top: screenSize.width * 0.03,
                bottom: screenSize.width * 0.03),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: screenSize.width * 0.03,
                      right: screenSize.width * 0.03),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Top Offers",
                            style: TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                              fontSize: isMobile ? 16 : 32,
                            )),
                        Text("View all...",
                            style: TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                              fontSize: isMobile ? 13 : 27,
                            )),
                      ]),
                ),
                SizedBox(
                  height: cardHeight, // Set a specific height
                  width: double.infinity,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          SizedBox(
                            width: isMobile
                                ? screenSize.width * 0.03
                                : screenSize.width * 0.03,
                          ),
                          const ProductCardHome(),
                        ],
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: screenSize.width * 0.03,
                      right: screenSize.width * 0.03),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Easy to Care",
                            style: TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                              fontSize: isMobile ? 16 : 32,
                            )),
                        Text("View all...",
                            style: TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                              fontSize: isMobile ? 13 : 27,
                            )),
                      ]),
                ),
                SizedBox(
                  height: cardHeight, // Set a specific height
                  width: double.infinity,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          SizedBox(
                            width: isMobile
                                ? screenSize.width * 0.03
                                : screenSize.width * 0.03,
                          ),
                          const ProductCardHome(),
                        ],
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: screenSize.width * 0.03,
                      right: screenSize.width * 0.03),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Bonsai Plants",
                            style: TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                              fontSize: isMobile ? 16 : 32,
                            )),
                        Text("View all...",
                            style: TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                              fontSize: isMobile ? 13 : 27,
                            )),
                      ]),
                ),
                SizedBox(
                  height: cardHeight, // Set a specific height
                  width: double.infinity,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          SizedBox(
                            width: isMobile
                                ? screenSize.width * 0.03
                                : screenSize.width * 0.03,
                          ),
                          const ProductCardHome(),
                        ],
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CommenAppbar extends StatefulWidget implements PreferredSizeWidget {
  final Function(int index)? onMenuItemTap;
  const CommenAppbar({super.key, this.onMenuItemTap});

  @override
  State<CommenAppbar> createState() => _CommenAppbarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CommenAppbarState extends State<CommenAppbar> {
  int selectedIndex = 0; // Track the selected menu index

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    // Mobile and Web conditional design
    bool isMobile = screenSize.width <= 600;

    return AppBar(
      centerTitle: isMobile,
      backgroundColor: isMobile ? AppColors.white : AppColors.primary,
      elevation: 4,
      shadowColor: Colors.black.withOpacity(0.3),
      actions: isMobile
          ? [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primary,
                  ),
                  child: Center(
                    child: IconButton(
                      icon: const Icon(
                        Icons.person,
                        size: 16,
                        color: AppColors.white,
                      ),
                      onPressed: () {
                        // Add person icon functionality here
                      },
                    ),
                  ),
                ),
              ),
            ]
          : null,
      leading: isMobile
          ? IconButton(
              icon: const Icon(
                Icons.menu,
                color: AppColors.primary,
                size: 35,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            )
          : null,
      title: isMobile
          ? Image.asset(
              "assets/image/logo2_mobile_singup.png",
              width: 50,
              height: 50,
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Logo with spacing
                Padding(
                  padding: const EdgeInsets.only(right: 32),
                  child: Image.asset(
                    "assets/image/logo_moblie_singup.png",
                    width: 50,
                    height: 50,
                  ),
                ),
                // Menu items aligned to the right
                Row(
                  children: [
                    _buildMenuItem("HOME", 0),
                    const SizedBox(width: 20),
                    _buildMenuItem("PLANT", 1),
                    const SizedBox(width: 20),
                    _buildMenuItem("SEED", 2),
                    const SizedBox(width: 20),
                    _buildMenuItem("POTS & PLANTERS", 3),
                    const SizedBox(width: 20),
                    _buildMenuItem("OFFERS", 4),
                    const SizedBox(width: 20),
                    // Search bar with icons
                    Container(
                      width: screenSize.width * 0.2,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
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
                    const SizedBox(width: 15),
                    // Cart and Profile icons next to the search bar
                    IconButton(
                      icon: const Icon(
                        Icons.shopping_cart,
                        color: AppColors.white,
                        size: 25,
                      ),
                      onPressed: () {
                        // Cart action
                      },
                    ),
                    const SizedBox(width: 10),
                    IconButton(
                      icon: const Icon(
                        Icons.person,
                        color: AppColors.white,
                        size: 25,
                      ),
                      onPressed: () {
                        // Profile action
                      },
                    ),
                  ],
                ),
              ],
            ),
    );
  }

  // Helper function to build menu items
  Widget _buildMenuItem(String title, int index) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedIndex = index; // Update selected index
        });
        if (widget.onMenuItemTap != null) {
          widget.onMenuItemTap!(index);
        }
      },
      child: Text(
        title,
        style: TextStyle(
          color: selectedIndex == index ? Colors.black : Colors.white,
          fontWeight: FontWeight.normal,
          fontSize: 16,
        ),
      ),
    );
  }
}

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

    return Container(
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
              height: isMobile ? 100 : 150, // Adjust height for mobile and web
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
    );
  }
}

class ProductCardHome extends StatelessWidget {
  const ProductCardHome({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final bool isMobile = screenSize.width <= 600; // Define mobile breakpoint

    final double cardHeight = isMobile ? 250 : 300;
    final cardWidth =
        isMobile ? screenSize.width * 0.427 : screenSize.width * 0.15;

    return Container(
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
              height: isMobile ? 100 : 150, // Adjust height for mobile and web
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
                // SizedBox(height: screenSize.width * 0.02),

                // Description
                // Text(
                //   'A low-maintenance indoor plant with glossy green leaves, thriving in low light with minimal watering—perfect for homes and offices.',
                //   style: TextStyle(
                //     fontSize: isMobile ? 12 : 14,
                //     color: Colors.grey[700],
                //   ),
                //   maxLines: 3,
                //   overflow: TextOverflow.ellipsis,
                // ),
                // isMobile
                //     ? SizedBox(height: screenSize.height * 0.01)
                //     : SizedBox(height: screenSize.width * 0.004),
                // Row(
                //   children: List.generate(
                //     5,
                //     (index) => Icon(Icons.star,
                //         color: Colors.yellow,
                //         size: isMobile
                //             ? screenSize.width * 0.045
                //             : screenSize.width * 0.023),
                //   ),
                // ),

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
    );
  }
}

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
