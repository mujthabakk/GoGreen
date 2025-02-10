import 'package:djangowithflutter/admin/add_product/add_product.dart';
import 'package:djangowithflutter/admin/product_details/admin_product_details_page.dart';
import 'package:djangowithflutter/home/view/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:djangowithflutter/core/colors.dart'; // Assuming this is where AppColors are defined

import 'package:flutter_bloc/flutter_bloc.dart';

class CommenAppbar extends StatelessWidget implements PreferredSizeWidget {
  final Function(int index)? onMenuItemTap;
  const CommenAppbar({super.key, this.onMenuItemTap});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
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
                    _buildMenuItem(context, "HOME", 0),
                    const SizedBox(width: 20),
                    _buildMenuItem(context, "PLANT", 1),
                    const SizedBox(width: 20),
                    _buildMenuItem(context, "SEED", 2),
                    const SizedBox(width: 20),
                    _buildMenuItem(context, "POTS & PLANTERS", 3),
                    const SizedBox(width: 20),
                    _buildMenuItem(context, "OFFERS", 4),
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AdminProductPage(),
                            ));
                      },
                    ),
                  ],
                ),
              ],
            ),
    );
  }

  // Helper function to build menu items
  Widget _buildMenuItem(BuildContext context, String title, int index) {
    return InkWell(
      onTap: () {
        context.read<HomeBloc>().add(HomeEvent.selectScreen(index));
        if (onMenuItemTap != null) {
          onMenuItemTap!(index);
        }
      },
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          int selectedIndex = 0;
          state.when(
            initial: () {},
            screenSelected: (index) {
              selectedIndex = index;
            },
          );

          return Text(
            title,
            style: TextStyle(
              color: selectedIndex == index ? Colors.black : Colors.white,
              fontWeight: FontWeight.normal,
              fontSize: 16,
            ),
          );
        },
      ),
    );
  }
}
