import 'package:e_commerce_project/data/models/category_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/brand.dart';
import '../screens/product_list_screen.dart';
import '../utility/app_colors.dart';

class CategoryBrandItem extends StatelessWidget {
  const CategoryBrandItem({
    super.key,
    this.categoryListItem,
    this.brand,
  });

  final CategoryListItem? categoryListItem;
  final Brand? brand;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(ProuctListScreen(
          category: categoryListItem?.categoryName ?? brand?.brandName ?? '',
          categoryId:categoryListItem?.id ?? brand?.id,
        ));
      },
      child: Column(
        children: [
          Card(
            elevation: 0,
            color: AppColors.primaryColor.withOpacity(0.1),
            child: Padding(
                padding: const EdgeInsets.all(8),
                child: Image.network(
                  categoryListItem?.categoryImg ?? brand?.brandImg ?? '',
                  width: 50,
                  height: 50,
                )),
          ),
          Text(
            categoryListItem?.categoryName ?? brand?.brandName ?? '',
            style: const TextStyle(
              fontSize: 16,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}