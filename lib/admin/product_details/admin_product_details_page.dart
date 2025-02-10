import 'dart:developer';

import 'package:flutter/material.dart';
import 'dart:io';

import 'package:flutter/foundation.dart'; // For kIsWeb
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AdminProductPage extends StatefulWidget {
  const AdminProductPage({super.key});

  @override
  _AdminProductPageState createState() => _AdminProductPageState();
}

class _AdminProductPageState extends State<AdminProductPage> {
  List<Map<String, String>> products = [
    {
      "name": "Aloe Vera",
      "price": "10",
      "quantity": "5",
      "category": "Plants",
      "description": "Aloe Vera plant",
      "about": "Great for skin care",
      "careTips": "Water once a week",
      "sellerName": "GreenWorld",
      "sellerContact": "1234567890",
      "offer": "5%",
      "image": "assets/image/login_background_img.jpg",
    },
    {
      "name": "Rose Plant",
      "price": "15",
      "quantity": "3",
      "category": "Plants",
      "description": "Beautiful red rose plant",
      "about": "Best for gifting",
      "careTips": "Water daily",
      "sellerName": "FloraHub",
      "sellerContact": "9876543210",
      "offer": "10%",
      "image": "assets/image/login_background_img.jpg",
    }
  ];

  void _editProduct(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditProductPage(
          product: products[index],
          onSave: (updatedProduct) {
            setState(() {
              log("updatedProduct: $updatedProduct");
              products[index] = updatedProduct;
            });
          },
        ),
      ),
    );
  }

  void _deleteProduct(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Delete Product"),
          content: const Text("Are you sure you want to delete this product?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  products.removeAt(index);
                });
                Navigator.pop(context);
              },
              child: const Text("Delete", style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    bool isMobile = screenSize.width <= 600;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin Product List"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: Colors.white),
            onPressed: () {
              // Navigate to Add Product Page
            },
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // int crossAxisCount = constraints.maxWidth < 600
          // ? 1 // Mobile - Single column
          // : constraints.maxWidth < 900
          // ? 2 // Tablet - Two columns
          // : 3; // Web/Desktop - Three columns

          return GridView.builder(
            padding: const EdgeInsets.all(10),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isMobile ? 1 : 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                // childAspectRatio: 80,
                childAspectRatio: isMobile ? 1.5 : 1.5),
            itemCount: products.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(12)),
                      child: Image.asset(
                        products[index]["image"]!,
                        height: screenSize.height * 0.2,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(products[index]["name"]!,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          Text("Price: \$${products[index]["price"]}"),
                          Text("Quantity: ${products[index]["quantity"]}"),
                          Text("Category: ${products[index]["category"]}"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                icon:
                                    const Icon(Icons.edit, color: Colors.blue),
                                onPressed: () => _editProduct(index),
                              ),
                              IconButton(
                                icon:
                                    const Icon(Icons.delete, color: Colors.red),
                                onPressed: () => _deleteProduct(index),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class EditProductPage extends StatefulWidget {
  final Map<String, String> product;
  final Function(Map<String, String>) onSave;

  const EditProductPage(
      {super.key, required this.product, required this.onSave});

  @override
  _EditProductPageState createState() => _EditProductPageState();
}

class _EditProductPageState extends State<EditProductPage> {
  late TextEditingController nameController;
  late TextEditingController priceController;
  late TextEditingController quantityController;
  late TextEditingController categoryController;
  late TextEditingController descriptionController;
  late TextEditingController aboutController;
  late TextEditingController careTipsController;
  late TextEditingController sellerNameController;
  late TextEditingController sellerContactController;
  late TextEditingController offerController;
  String? imagePath;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.product["name"]);
    priceController = TextEditingController(text: widget.product["price"]);
    quantityController =
        TextEditingController(text: widget.product["quantity"]);
    categoryController =
        TextEditingController(text: widget.product["category"]);
    descriptionController =
        TextEditingController(text: widget.product["description"]);
    aboutController = TextEditingController(text: widget.product["about"]);
    careTipsController =
        TextEditingController(text: widget.product["careTips"]);
    sellerNameController =
        TextEditingController(text: widget.product["sellerName"]);
    sellerContactController =
        TextEditingController(text: widget.product["sellerContact"]);
    offerController = TextEditingController(text: widget.product["offer"]);
    imagePath = widget.product["image"];
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        imagePath = pickedFile.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    bool isMobile = screenSize.width <= 600;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Product"),
        backgroundColor: Colors.green[700],
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: isMobile ? _buildMobileUI() : _buildWebUI(),
      ),
    );
  }

  Widget _buildMobileUI() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: _pickImage,
            child: _buildImageContainer(),
          ),
          const SizedBox(height: 10),
          _buildTextField(nameController, "Product Name"),
          _buildTextField(priceController, "Price"),
          _buildTextField(quantityController, "Quantity"),
          _buildTextField(categoryController, "Category"),
          _buildTextField(descriptionController, "Description", maxLines: 3),
          _buildTextField(aboutController, "About Product", maxLines: 3),
          _buildTextField(careTipsController, "Care Tips", maxLines: 3),
          _buildTextField(sellerNameController, "Seller Name"),
          _buildTextField(sellerContactController, "Seller Contact"),
          _buildTextField(offerController, "Offer"),
          const SizedBox(height: 20),
          _buildSaveButton(),
        ],
      ),
    );
  }

  Widget _buildWebUI() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  flex: 2,
                  child: GestureDetector(
                      onTap: _pickImage, child: _buildImageContainer())),
              const SizedBox(width: 20),
              Expanded(
                flex: 3,
                child: GridView(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 3,
                  ),
                  children: [
                    _buildTextField(nameController, "Product Name"),
                    _buildTextField(priceController, "Price"),
                    _buildTextField(quantityController, "Quantity"),
                    _buildTextField(categoryController, "Category"),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          _buildTextField(descriptionController, "Description", maxLines: 3),
          _buildTextField(aboutController, "About Product", maxLines: 3),
          _buildTextField(careTipsController, "Care Tips", maxLines: 3),
          _buildTextField(sellerNameController, "Seller Name"),
          _buildTextField(sellerContactController, "Seller Contact"),
          _buildTextField(offerController, "Offer"),
          const SizedBox(height: 20),
          _buildSaveButton(),
        ],
      ),
    );
  }

  Widget _buildImageContainer() {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.green[700]!),
      ),
      child: imagePath != null
          ? ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: kIsWeb
                  ? Image.network(imagePath!, fit: BoxFit.cover)
                  : Image.file(File(imagePath!), fit: BoxFit.cover),
            )
          : const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add_a_photo, size: 50, color: Colors.green),
                  SizedBox(height: 10),
                  Text("Tap to select image",
                      style: TextStyle(color: Colors.green)),
                ],
              ),
            ),
    );
  }

  Widget _buildSaveButton() {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          widget.onSave({
            "name": nameController.text,
            "price": priceController.text,
            "quantity": quantityController.text,
            "category": categoryController.text,
            "description": descriptionController.text,
            "about": aboutController.text,
            "careTips": careTipsController.text,
            "sellerName": sellerNameController.text,
            "sellerContact": sellerContactController.text,
            "offer": offerController.text,
            "image": imagePath ?? ""
          });
          Navigator.pop(context);
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green[700],
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12))),
        child: const Text("Save",
            style: TextStyle(fontSize: 18, color: Colors.white)),
      ),
    );
  }
}

Widget _buildTextField(TextEditingController controller, String label,
    {int maxLines = 1}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 20),
    child: TextField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        filled: true,
        fillColor: Colors.grey.shade100,
      ),
    ),
  );
}
