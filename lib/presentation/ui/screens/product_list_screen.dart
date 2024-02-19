import 'package:e_commerce_project/presentation/state_holders/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/product_card_item.dart';

class ProuctListScreen extends StatefulWidget {
  const ProuctListScreen({super.key, this.category, required this.categoryId});

  final String? category;
  final int? categoryId;

  @override
  State<ProuctListScreen> createState() => _ProuctListScreenState();
}

class _ProuctListScreenState extends State<ProuctListScreen> {
  @override
  void initState() {
    super.initState();
    if(widget.categoryId != null){
      Get.find<ProductController>().getProduct(categoryId: widget.categoryId!);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.category ?? "Products",
        ),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: GetBuilder<ProductController>(
          builder: (productController) {
            return Visibility(
              visible: productController.inProgress == false,
              replacement: const Center(
                child: CircularProgressIndicator(),
              ),
              child: Visibility(
                visible: productController.productListModel.productList?. isNotEmpty ?? false,
                replacement: Center(
                  child: Text("No Products"),
                ),
                child: GridView.builder(
                    itemCount:  productController.productListModel.productList?.length ?? 0,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 0.90,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 4,
                    ),
                    itemBuilder: (context, index) {
                      return FittedBox(
                          child: ProductCardItem(product: productController.productListModel.productList![index],)
                      );
                    }),
              ),
            );
          }
        ),
      ),
    );
  }
}
