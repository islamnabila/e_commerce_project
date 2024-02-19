import 'package:e_commerce_project/data/models/product_details_data.dart';
import 'package:e_commerce_project/presentation/state_holders/add_to_cart_controller.dart';
import 'package:e_commerce_project/presentation/state_holders/auth_controller.dart';
import 'package:e_commerce_project/presentation/state_holders/product_details_controller.dart';
import 'package:e_commerce_project/presentation/ui/screens/auth/verify_email_screen.dart';
import 'package:e_commerce_project/presentation/ui/screens/create_review_screen.dart';
import 'package:e_commerce_project/presentation/ui/screens/wishlist_screen.dart';
import 'package:e_commerce_project/presentation/ui/widgets/product_details/product_details_image_carousel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:item_count_number_button/item_count_number_button.dart';
import '../utility/app_colors.dart';
import '../widgets/product_details/color_selector.dart';
import '../widgets/product_details/size_selector.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productId});

  final int productId;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
   final ValueNotifier<int> numOfItems = ValueNotifier(1);
  List<Color> colors = [
    Colors.blue,
    Colors.green,
    Colors.grey,
    Colors.amber,
    Colors.pink
  ];

  List<String> sizes = ["S", "M", "L", "XL", "XXL", "XXXL"];

  Color? _selectedColor;
  String? _selectedSize;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(AuthController.token);
    Get.find<ProductDetailsController>().getProductDetails(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product_details"),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: GetBuilder<ProductDetailsController>(
        builder: (productDetailsController) {
          if(productDetailsController.inProgress){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [ProductDetailsImageCarousel(
                        urls: [
                          productDetailsController.productDetailsData.img1 ?? "",
                          productDetailsController.productDetailsData.img2 ?? "",
                          productDetailsController.productDetailsData.img3 ?? "",
                          productDetailsController.productDetailsData.img4 ?? "",
                        ],),
                        productDetailsBody(productDetailsController.productDetailsData)
                      ],
                    ),
                  ),
                ),
                priceandAddtoCartSection
              ],

          );
        }
      ),
    );
  }

  Padding  productDetailsBody(ProductDetailsData productDetailsData) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                  child: Text(
                productDetailsData.product?.title ?? "",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              )),
              ValueListenableBuilder(
                  valueListenable: numOfItems,
                  builder: (context, value, _) {
                    return ItemCount(
                      initialValue: value,
                      minValue: 1,
                      maxValue: 20,
                      decimalPlaces: 0,
                      step: 1,
                      color: AppColors.primaryColor,
                      onChanged: (v) {
                        numOfItems.value = v.toInt();
                      },
                    );
                  }),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          RatingAndReview(productDetailsData.product?.star ?? 0),
          const SizedBox(
            height: 16,
          ),
          Text(
            "Color",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 8,
          ),
          ColorsSelector(
              colors: productDetailsData.color?.split(",").map((e) => getColorFromString(e)).toList() ?? [],
              onChange: (selectedColor) {
                _selectedColor = selectedColor;
              }),
          const SizedBox(
            height: 16,
          ),
          Text(
            "Size",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 12,
          ),
          SizeSelector(sizes: productDetailsData.size?.split(",") ?? [], onChange: (s) {
            _selectedSize = s;
          }),
          const SizedBox(
            height: 8,
          ),
          Text(
            "Description",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            productDetailsData.des ?? "",
            style: TextStyle(fontSize: 12, color: Colors.grey),
          )
        ],
      ),
    );
  }

  Row RatingAndReview(int rating) {
    return Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Icon(
                  Icons.star,
                  size: 16,
                  color: Colors.amberAccent,
                ),
                Text(
                  rating.toStringAsPrecision(2),
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black45),
                ),
              ],
            ),
            const SizedBox(
              width: 8,
            ),
            GestureDetector(
              onTap: (){
                Get.to(()=>CreateReviewScreen(productId: widget.productId,));
              },
              child: Text(
                "Reviews",
                style: TextStyle(
                    fontSize: 16,
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            GestureDetector(
              onTap: (){
                Get.to(()=>WishListScreen());
              },
              child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  color: AppColors.primaryColor,
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Icon(
                      Icons.favorite_outline,
                      size: 18,
                      color: Colors.white,
                    ),
                  )),
            )
          ],
        );
  }

  Container get priceandAddtoCartSection {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: AppColors.primaryColor.withOpacity(0.2),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Price",
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
            child: GetBuilder<AddToCartController>(
              builder: (addCartToController) {
                return Visibility(
                  visible: addCartToController.inProgress == false,
                  replacement:const Center(
                    child: CircularProgressIndicator(),
                  ),
                  child: ElevatedButton(
                    onPressed: () async{
                      if(_selectedColor != null && _selectedSize != null){
                        if(Get.find<AuthController>().isTokenNotNull){
                          final stringColor = colorsToString(_selectedColor!);
                        final response = await addCartToController.getAddToCart(widget.productId , stringColor, _selectedSize!, numOfItems.value);
                        print(AuthController.token);
                        if(response){
                          Get.showSnackbar(GetSnackBar(
                            title: "Success",
                            message: "This product has been added to cart",
                            duration: Duration(seconds: 2),
                          ));
                        }
                        else{
                          Get.showSnackbar(GetSnackBar(
                            title: " Add to cart failed",
                            message: addCartToController.errorMessage,
                            duration: Duration(seconds: 2),
                          ));
                        }
                        }else{
                          Get.to(()=> VerifyEmailScreen());
                        }

                      }else{
                        Get.showSnackbar(GetSnackBar(
                          title: "Add to cart failed!",
                          message: "Plese select color and size",
                          duration: Duration(seconds: 2),
                          isDismissible: true,
                        ));
                      }
                    },
                    child: Text("Add To Cart"),
                  ),
                );
              }
            ),
          )
        ],
      ),
    );
  }
  // Color getColorFromString(String colorCode){
  //   String code = colorCode.replaceAll("#", "");
  //   String hexCode = "FF$code";
  //   return Color(int.parse("0x$hexCode"));
  // }
  // String colorToHashColor(String colorCode){
  //   return _selectedColor.toString().replaceAll("0xff", "#").replaceAll("Color(", "").replaceAll(")", "");
  // }

   Color getColorFromString(String color){
    color = color.toLowerCase();
    if(color == "red"){
      return Colors.red;
    }else if(color == "white"){
      return Colors.white;
    }else if(color == "green"){
      return Colors.green;
    }
    return Colors.grey;
   }
   String colorsToString(Color color){
     if(color == Colors.red){
       return "Red";
     }else if(color == Colors.white){
       return "White";
     }else if(color == Colors.green){
       return "Green" ;
     }
     return "Grey";
   }
}
