import 'package:djangowithflutter/home/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart'; // For kIsWeb
import 'package:djangowithflutter/core/colors.dart';
import 'package:djangowithflutter/admin/add_product/bloc/add_product_bloc.dart';

class AddProductPage extends StatelessWidget {
  AddProductPage({super.key});

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _aboutProductController = TextEditingController();
  final TextEditingController _careTipsController = TextEditingController();
  final TextEditingController _sellerNameController = TextEditingController();
  final TextEditingController _sellerContactController =
      TextEditingController();
  final TextEditingController _offerController =
      TextEditingController(text: "0");

  String _selectedCategory = "Plants";
  final List<String> _categories = [
    "Plants",
    "Seeds",
    "Pots & Planters",
    "Fertilizers",
    "Tools",
  ];

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    bool isMobile = screenSize.width <= 600;

    return BlocProvider(
      create: (context) => AddProductBloc(),
      child: Scaffold(
        appBar: AppBar(
          title:
              const Text("Add Product", style: TextStyle(color: Colors.white)),
          backgroundColor: AppColors.primary,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                constraints: const BoxConstraints(maxWidth: double.infinity),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: BlocConsumer<AddProductBloc, AddProductState>(
                      listener: (context, state) {
                        if (state.successMessage.isNotEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(state.successMessage),
                              backgroundColor: Colors.green,
                              behavior: SnackBarBehavior.floating,
                              margin: const EdgeInsets.only(
                                  top: 20, right: 20, left: 20),
                            ),
                          );
                        }
                        if (state.errorMessage.isNotEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(state.errorMessage),
                              backgroundColor: Colors.red,
                              behavior: SnackBarBehavior.floating,
                              margin: const EdgeInsets.only(
                                  top: 20, right: 20, left: 20),
                            ),
                          );
                        }
                      },
                      builder: (context, state) {
                        final bloc = context.read<AddProductBloc>();

                        return Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                  "assets/image/logo2_mobile_singup.png",
                                  height: 80),
                              const SizedBox(height: 10),
                              const Text(
                                "Welcome to GoGreen",
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primary),
                              ),
                              const SizedBox(height: 5),
                              Text("Start your seller journey with us!",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey[700])),
                              const SizedBox(height: 20),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: GestureDetector(
                                      onTap: () => bloc.add(
                                          const AddProductEvent.selectImage()),
                                      child: Container(
                                        height: 200,
                                        decoration: BoxDecoration(
                                          color: Colors.grey.shade200,
                                          border: Border.all(
                                              color: AppColors.primary),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: state.selectedImage != null
                                            ? ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                child: kIsWeb
                                                    ? Image.network(
                                                        state.selectedImage!
                                                            .path,
                                                        width: double.infinity,
                                                        height: 200,
                                                        fit: BoxFit.cover)
                                                    : Image.file(
                                                        state.selectedImage!,
                                                        width: double.infinity,
                                                        height: 200,
                                                        fit: BoxFit.cover),
                                              )
                                            : const Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(Icons.add_a_photo,
                                                      color: AppColors.primary,
                                                      size: 40),
                                                  SizedBox(height: 10),
                                                  Text("Tap to Select Image",
                                                      style: TextStyle(
                                                          color: AppColors
                                                              .primary)),
                                                ],
                                              ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  Expanded(
                                    flex: 3,
                                    child: Column(
                                      children: [
                                        _buildTextField(
                                            _nameController,
                                            "Product Name",
                                            "Enter product name"),
                                        _buildTextField(_priceController,
                                            "Price", "Enter price",
                                            keyboardType: TextInputType.number),
                                        _buildTextField(_quantityController,
                                            "Quantity", "Enter quantity",
                                            keyboardType: TextInputType.number),
                                        DropdownButtonFormField(
                                          value: _selectedCategory,
                                          items: _categories.map((category) {
                                            return DropdownMenuItem(
                                                value: category,
                                                child: Text(category));
                                          }).toList(),
                                          onChanged: (value) {
                                            _selectedCategory = value as String;
                                          },
                                          decoration: _inputDecoration(
                                              "Select Category"),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              _buildTextField(
                                  _descriptionController,
                                  "Short Description",
                                  "Enter short description",
                                  maxLines: 2),
                              _buildTextField(_aboutProductController,
                                  "About Product", "Enter product details",
                                  maxLines: 3),
                              _buildTextField(_careTipsController, "Care Tips",
                                  "Enter care instructions",
                                  maxLines: 3),
                              const SizedBox(height: 20),
                              InkWell(
                                onTap: () {
                                  if (state.selectedImage == null) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text("Please select an image"),
                                        backgroundColor: Colors.red,
                                        behavior: SnackBarBehavior.floating,
                                        margin: EdgeInsets.only(
                                            top: 20, right: 20, left: 20),
                                      ),
                                    );
                                    return;
                                  }

                                  if (_formKey.currentState!.validate()) {
                                    bloc.add(AddProductEvent.submitProduct(
                                      name: _nameController.text,
                                      price: _priceController.text,
                                      quantity: _quantityController.text,
                                      category: _selectedCategory,
                                      description: _descriptionController.text,
                                      about: _aboutProductController.text,
                                      careTips: _careTipsController.text,
                                      sellerName: _sellerNameController.text,
                                      sellerContact:
                                          _sellerContactController.text,
                                      offer: _offerController.text,
                                      image: state.selectedImage!,
                                    ));
                                  }
                                },
                                child: Container(
                                  width: screenSize.width * 0.9,
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 14),
                                  decoration: BoxDecoration(
                                    color: AppColors.primary,
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.black26,
                                        blurRadius: 6,
                                        offset: Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: const Center(
                                    child: Text(
                                      "Add Product",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// **Reusable Text Field Widget**
  Widget _buildTextField(
      TextEditingController controller, String label, String hint,
      {int maxLines = 1, TextInputType keyboardType = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        maxLines: maxLines,
        decoration: _inputDecoration(label, hint),
        validator: (value) => value!.isEmpty ? "$label is required" : null,
      ),
    );
  }

  /// **Reusable Input Decoration**
  InputDecoration _inputDecoration(String label, [String? hint]) {
    return InputDecoration(
      labelText: label,
      hintText: hint,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      filled: true,
      fillColor: Colors.grey.shade100,
    );
  }
}
