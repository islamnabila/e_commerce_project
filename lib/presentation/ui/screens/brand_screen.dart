import 'package:e_commerce_project/presentation/state_holders/brand_list_controller.dart';
import 'package:e_commerce_project/presentation/state_holders/category_controller.dart';
import 'package:e_commerce_project/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:e_commerce_project/presentation/ui/widgets/category_brand_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/category_item.dart';

class BrandScreen extends StatefulWidget {
  const BrandScreen({super.key});

  @override
  State<BrandScreen> createState() => _BrandScreenState();
}

class _BrandScreenState extends State<BrandScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.find<MainBottomNavController>().backToHome();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Brands",
            style: TextStyle(
                color: Colors.black, fontSize: 23, fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Get.find<MainBottomNavController>().backToHome();
            },
          ),
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: GetBuilder<BrandListController>(builder: (brandListController) {
            return Visibility(
              visible: brandListController.inProgress == false,
              replacement: Center(
                child: CircularProgressIndicator(),
              ),
              child: GridView.builder(
                  itemCount: brandListController
                      .brandListModel.brandList?.length ??
                      0,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      childAspectRatio: 0.95,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 8),
                  itemBuilder: (context, index) {
                    return FittedBox(
                      child: CategoryBrandItem(
                        brand: brandListController.brandListModel.brandList![index],
                      )
                    );
                  }),
            );
          }),
        ),
      ),
    );
  }
}