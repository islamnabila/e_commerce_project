import 'package:e_commerce_project/presentation/ui/widgets/product_card_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../state_holders/main_bottom_nav_controller.dart';
import '../../state_holders/wishlist_controller.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<WishlistController>().getWishlist();
    });
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        Get.find<MainBottomNavController>().backToHome();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            "Wishlist",
            style: TextStyle(
                color: Colors.black, fontSize: 23, fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black,),
            onPressed: (){
              Get.find<MainBottomNavController>().backToHome();
            },
          ),
          elevation: 0,
        ),
        body: GetBuilder<WishlistController>(
          builder: (wishlistController) {
            if(wishlistController.inProgress){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Visibility(
              visible: wishlistController.wishlistModel.wishlist?.isNotEmpty ?? false,
              replacement: const Center(
                child: Text("Wishlist  is empty"),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: GridView.builder(
                    itemCount: wishlistController.wishlistModel.wishlist?.length ?? 0,
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 0.90,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 4
                    ),
                    itemBuilder: (context, index) {
                      return FittedBox(
                          child: ProductCardItem(product: wishlistController.wishlistModel.wishlist![index].product!, addToWishList: false, ));
                    }),
              ),
            );
          }
        ),
      ),
    );
  }
}
