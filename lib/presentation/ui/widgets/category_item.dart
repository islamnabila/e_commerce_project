import 'package:e_commerce_project/data/models/category_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/product_list_screen.dart';
import '../utility/app_colors.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.categoryListItem,
  });

  final CategoryListItem categoryListItem;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          () => ProuctListScreen(
            category: categoryListItem.categoryName ?? "",
            categoryId: categoryListItem.id,
          ),
        );
      },
      child: Column(
        children: [
          Card(
            elevation: 0,
            color: AppColors.primaryColor.withOpacity(0.2),
            child: Padding(
                padding: const EdgeInsets.all(18),
                child: Image.network(
                  categoryListItem.categoryImg ?? "",
                  height: 38,
                  width: 38,
                )),
          ),
          Text(
            categoryListItem.categoryName ?? "",
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.primaryColor),
          )
        ],
      ),
    );
  }
}
