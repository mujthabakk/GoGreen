import 'package:djangowithflutter/core/colors.dart';
import 'package:djangowithflutter/home/view/home_page.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int quantity = 1;

  // 📌 Hardcoded API response (simulating backend response)
  final Map<String, dynamic> productData = {
    "id": "101",
    "name": "Anthurium Red",
    "imageUrl": "assets/image/login_background_img.jpg",
    "price": 1000, // Base price per unit
    "description":
        "Anthurium Red, commonly known as the Flamingo Plant, is a low-maintenance indoor plant with vibrant, heart-shaped, red waxy blooms.",
    "rating": 5,
    "sellerName": "Green House Plants",
    "sellerContact": "+91 9876543210"
  };

  /// 🔄 Calculate the total price based on quantity
  int get totalPrice => productData["price"] * quantity;

  void _incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void _decrementQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    bool isMobile = screenSize.width <= 600;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Details"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.0),
          child: isMobile ? _mobileLayout() : _webLayout(),
        ),
      ),
    );
  }

  // 📱 Mobile Layout
  Widget _mobileLayout() {
    Size screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(screenSize.width * 0.05),
      child: Column(
        children: [
          _productImage(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: _productDetails(),
          ),
        ],
      ),
    );
  }

  // 💻 Web Layout
  Widget _webLayout() {
    Size screenSize = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(screenSize.width * 0.05),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 2, child: _productImage()),
                    const SizedBox(width: 30),
                    Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: _productDetails(),
                        )),
                  ],
                ),
              ],
            ),
          ),
          const ResponsiveFooter()
        ],
      ),
    );
  }

  // 🌿 Product Image
  Widget _productImage() {
    return Container(
      height: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: AssetImage(productData["imageUrl"]),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  // 📦 Product Details List
  List<Widget> _productDetails() {
    return [
      // 🏷️ Product Name and Rating
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            productData["name"],
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Row(
            children: List.generate(productData["rating"], (index) {
              return const Icon(Icons.star, color: Colors.amber, size: 20);
            }),
          ),
        ],
      ),
      const SizedBox(height: 10),

      // 💰 Price & Quantity Selector
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Price: ₹$totalPrice", // 👈 Dynamic price update
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              IconButton(
                onPressed: _decrementQuantity,
                icon: const Icon(Icons.remove_circle, color: AppColors.primary),
              ),
              Text("$quantity", style: const TextStyle(fontSize: 18)),
              IconButton(
                onPressed: _incrementQuantity,
                icon: const Icon(Icons.add_circle, color: AppColors.primary),
              ),
            ],
          ),
        ],
      ),
      const SizedBox(height: 20),

      // 🛒 Add to Cart & Buy Now Buttons
      Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {},
              style:
                  ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
              child: const Text("Add to Cart"),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: const Text(
                "Buy Now",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      const SizedBox(height: 30),

      // 📜 About the Product
      const Text(
        "About the Product",
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 10),
      Text(
        productData["description"],
        style: const TextStyle(fontSize: 16),
      ),
      const SizedBox(height: 20),

      // 🌱 Care Tips
      const Text(
        "Care Tips:",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 10),
      _buildBulletPoint("Thrive in bright, indirect light."),
      _buildBulletPoint("Water moderately, keeping soil slightly moist."),
      _buildBulletPoint("Prefers humid environments."),
      _buildBulletPoint("Best grown in temperatures of 18-25°C."),
      const SizedBox(height: 20),

      // 🏪 Seller Details
      const Text(
        "Seller Details",
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 10),
      Text("Name: ${productData["sellerName"]}"),
      Text("Contact: ${productData["sellerContact"]}"),
      const SizedBox(height: 20),
    ];
  }

  // ✅ Bullet Point Widget
  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, bottom: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("• ", style: TextStyle(fontSize: 18)),
          Expanded(child: Text(text, style: const TextStyle(fontSize: 16))),
        ],
      ),
    );
  }
}
