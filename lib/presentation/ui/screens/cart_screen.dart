import 'package:e_commerce_project/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:e_commerce_project/presentation/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/cart/car_product_item.dart';


class CartsScreen extends StatefulWidget {
  const CartsScreen({super.key});

  @override
  State<CartsScreen> createState() => _CartsScreenState();
}

class _CartsScreenState extends State<CartsScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.find<MainBottomNavController>().backToHome();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Carts"),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Get.find<MainBottomNavController>().backToHome();
            },
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: 4,
                  itemBuilder: (context, index){
                    return CardProductItem();
                  },
                  separatorBuilder: (_, __) => SizedBox(
                    height: 8,
                  ) ,)
            ),
            totalPriceandCheckoutSection
          ],
        ),
      ),
    );
  }

  Container get totalPriceandCheckoutSection {
    return Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: AppColors.primaryColor.withOpacity(0.2),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Total Price",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black45),
                    ),
                    Text(
                      "12056334",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryColor),
                    ),
                  ],
                ),
                SizedBox(
                  width: 100,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("Check Out"),
                  ),
                )
              ],
            ),
          );
  }
}


