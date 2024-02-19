import 'package:e_commerce_project/presentation/state_holders/category_controller.dart';
import 'package:e_commerce_project/presentation/state_holders/home_banner_controller.dart';
import 'package:e_commerce_project/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:e_commerce_project/presentation/state_holders/new_product_controller.dart';
import 'package:e_commerce_project/presentation/state_holders/popular_product_controller.dart';
import 'package:e_commerce_project/presentation/state_holders/special_product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/models/product_model.dart';
import '../utility/home/style.dart';
import '../widgets/category_item.dart';
import '../widgets/home/image_carousel.dart';
import '../widgets/home/section_title.dart';
import '../widgets/product_card_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  SizedBox(
                    height: 16,
                  ),
                  textFormField,
                  SizedBox(
                    height: 14,
                  ),
                  SizedBox(
                      height: 210,
                      child: GetBuilder<HomeBannerController>(
                          builder: (homeBannerController) {
                        return Visibility(
                          visible: homeBannerController.inProgress == false,
                          replacement: const Center(
                            child: CircularProgressIndicator(),
                          ),
                          child: ImageCarouselWidget(
                            bannerList: homeBannerController
                                    .bannerListModel.bannerList ??
                                [],
                          ),
                        );
                      })),
                  SizedBox(
                    height: 10,
                  ),
                  SectionTitle(
                    title: 'All Categories',
                    onTap: () {
                      Get.find<MainBottomNavController>().changeIndex(1);
                    },
                  ),

                  categoryList,
                  SectionTitle(
                    title: 'Brands',
                    onTap: () {
                      Get.find<MainBottomNavController>().changeIndex(1);
                    },
                  ),
                  brandList,
                  SectionTitle(
                    title: 'Popular',
                    onTap: () {
                      // Get.to(() => const ProuctListScreen());
                    },
                  ),
                  GetBuilder<PopularProductController>(
                    builder: (popularProductController) {
                      return Visibility(
                        visible: popularProductController.inProgress == false,
                          replacement: const Center(
                            child: CircularProgressIndicator(),
                          ),
                          child: productList(popularProductController.productListModel.productList ?? []));
                    }
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  SectionTitle(
                    title: 'Special',
                    onTap: () {},
                  ),
                  GetBuilder<SpecialProductController>(
                    builder: (specialProductController) {
                      return Visibility(
                        visible: specialProductController.inProgress == false,
                          replacement:const Center(
                            child: CircularProgressIndicator(),
                          ),
                          child: productList(specialProductController.productListModel.productList ?? []),
                      );
                    }
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SectionTitle(
                    title: 'New',
                    onTap: () {},
                  ),
                  GetBuilder<NewProductController>(
                    builder: (newProductController) {
                      return Visibility(
                        visible: newProductController.inProgress == false,
                          replacement:const Center(
                            child: CircularProgressIndicator(),
                          ),
                          child: productList(newProductController.productListModel.productList ?? []));
                    }
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  SizedBox get categoryList {
    return SizedBox(
      height: 120,
      child: GetBuilder<CategoryController>(builder: (categoryController) {
        return Visibility(
          visible: categoryController.inProgress == false,
          replacement: Center(
            child: CircularProgressIndicator(),
          ),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount:
                categoryController.categoryListModel.categoryList?.length ?? 0,
            primary: false,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return CategoryItem(
                categoryListItem:
                    categoryController.categoryListModel.categoryList![index],
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                width: 10,
              );
            },
          ),
        );
      }),
    );
  }

  SizedBox get brandList {
    return SizedBox(
      height: 120,
      child: GetBuilder<CategoryController>(builder: (categoryController) {
        return Visibility(
          visible: categoryController.inProgress == false,
          replacement: Center(
            child: CircularProgressIndicator(),
          ),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount:
            categoryController.categoryListModel.categoryList?.length ?? 0,
            primary: false,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return CategoryItem(
                categoryListItem:
                categoryController.categoryListModel.categoryList![index],
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                width: 10,
              );
            },
          ),
        );
      }),
    );
  }

  SizedBox productList(List<ProductModel> productList) {
    return SizedBox(
      height: 200,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount:productList.length,
        primary: false,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return ProductCardItem(product: productList[index],);
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: 10,
          );
        },
      ),
    );
  }
  // SizedBox get popularProductList {
  //   return SizedBox(
  //     height: 200,
  //     child: GetBuilder<PopularProductController>(
  //       builder: (popularProductController) {
  //         return Visibility(
  //           visible: popularProductController.inProgress == false,
  //           replacement:const Center(
  //             child: CircularProgressIndicator(),
  //           ),
  //           child: ListView.separated(
  //             scrollDirection: Axis.horizontal,
  //             itemCount: popularProductController.productListModel.productList?.length ?? 0,
  //             primary: false,
  //             shrinkWrap: true,
  //             itemBuilder: (context, index) {
  //               return ProductCardItem(product: popularProductController.productListModel.productList![index]);
  //             },
  //             separatorBuilder: (BuildContext context, int index) {
  //               return SizedBox(
  //                 width: 10,
  //               );
  //             },
  //           ),
  //         );
  //       }
  //     ),
  //   );
  // }
}
