import 'package:e_commerce_project/presentation/state_holders/category_controller.dart';
import 'package:e_commerce_project/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/category_item.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
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
        body: RefreshIndicator(
          onRefresh: ()async{
            await Get.find<CategoryController>().getCategoryList();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: GetBuilder<CategoryController>(builder: (categoryController) {
              return Visibility(
                visible: categoryController.inProgress == false,
                replacement: Center(
                  child: CircularProgressIndicator(),
                ),
                child: GridView.builder(
                    itemCount: categoryController
                        .categoryListModel.categoryList?.length ??
                        0,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        childAspectRatio: 0.95,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 8),
                    itemBuilder: (context, index) {
                      return FittedBox(
                        child: CategoryItem(
                            categoryListItem: categoryController
                                .categoryListModel.categoryList![index]),
                      );
                    }),
              );
            }),
          ),
        ),
      ),
    );
  }
}