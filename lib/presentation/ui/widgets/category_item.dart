import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/product_list_screen.dart';
import '../utility/app_colors.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(()=> ProuctListScreen(category: 'Electronics',));
      },
      child: Column(
        children: [
          Card(
            elevation: 0,
            color: AppColors.primaryColor.withOpacity(0.2),
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Icon(
                Icons.tv,
                size: 36,
                color: AppColors.primaryColor,
              ),
            ),
          ),
          Text(
            "Electronics",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.primaryColor),
          )
        ],
      ),
    );
  }
}