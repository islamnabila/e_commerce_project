import 'package:e_commerce_project/presentation/state_holders/category_controller.dart';
import 'package:e_commerce_project/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:e_commerce_project/presentation/state_holders/new_product_controller.dart';
import 'package:e_commerce_project/presentation/state_holders/popular_product_controller.dart';
import 'package:e_commerce_project/presentation/state_holders/special_product_controller.dart';
import 'package:e_commerce_project/presentation/ui/screens/cart_list_screen.dart';
import 'package:e_commerce_project/presentation/ui/screens/home_screen.dart';
import 'package:e_commerce_project/presentation/ui/screens/wishlist_screen.dart';
import 'package:e_commerce_project/presentation/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../state_holders/home_banner_controller.dart';
import 'category_screen.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNaState();
}

class _MainBottomNaState extends State<MainBottomNavScreen> {
  // int _selectIndex = 0;
  final List<Widget> _screens =const[
    HomeScreen(),
    CategoryScreen(),
    CartListScreen(),
    WishListScreen(),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<HomeBannerController>().getBannerList();
      Get.find<CategoryController>().getCategoryList();
      Get.find<PopularProductController>().getPopularProductList();
      Get.find<SpecialProductController>().getSpecialProductList();
      Get.find<NewProductController>().getNewProductList();
    });

  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainBottomNavController>(
      builder: (controller) {
        return Scaffold(
          body: _screens[controller.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.currentIndex,
            selectedItemColor: AppColors.primaryColor,
            unselectedItemColor: Colors.grey,
            showSelectedLabels: true,
            showUnselectedLabels: true,

            onTap: controller.changeIndex,

            items:const [
              BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: "Categories"),
              BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Carts"),
              BottomNavigationBarItem(icon: Icon(Icons.favorite_outlined), label: "Wishlist"),
            ],
          ),
        );
      }
    );
  }
}
