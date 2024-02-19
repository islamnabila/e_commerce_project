import 'package:e_commerce_project/data/models/product_model.dart';
import 'package:e_commerce_project/presentation/ui/screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utility/app_colors.dart';


class ProductCardItem extends StatelessWidget {
  const ProductCardItem({
    super.key, required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.to(()=> ProductDetailsScreen(productId: product.id!,));
      },
      borderRadius: BorderRadius.circular(16),
      child: SizedBox(
        height: 190,
        width: 160,
        child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          color: AppColors.primaryColor.withOpacity(0.1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(16),
                      topLeft: Radius.circular(16)),
                  child: Image.network(
                    product.image ?? "",
                    width: 160,
                    height: 120,
                  )),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title ?? "",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54,
                      ),
                    ),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "৳${product.price ?? 0}",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primaryColor),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Icon(
                              Icons.star,
                              size: 14,
                              color: Colors.amberAccent,
                            ),
                            Text(
                              "${product.star ?? 0}", style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.black45),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            color: AppColors.primaryColor,
                            child: Padding(
                              padding: const EdgeInsets.all(2),
                              child: Icon(
                                Icons.favorite_outline,
                                size: 10,
                                color: Colors.white,
                              ),
                            ))
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
