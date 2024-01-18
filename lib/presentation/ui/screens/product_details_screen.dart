import 'package:e_commerce_project/presentation/ui/widgets/product_details/product_details_image_carousel.dart';
import 'package:flutter/material.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

import '../utility/app_colors.dart';
import '../widgets/product_details/color_selector.dart';
import '../widgets/product_details/size_selector.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final ValueNotifier<int> numOfNotifier = ValueNotifier(1);
  List<Color> colors = [
    Colors.blue,
    Colors.green,
    Colors.grey,
    Colors.amber,
    Colors.pink
  ];

  List<String> sizes = ["S", "M", "L", "XL", "XXL", "XXXL"];

  Color _selectedColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product_details"),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [ProductDetailsImageCarousel(), productDetailsBody],
              ),
            ),
          ),
          priceandAddtoCartSection
        ],
      ),
    );
  }

  Padding get productDetailsBody {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                  child: Text(
                "Nike Sports Shoe 2023 Edition ED23R - Save 30%",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              )),
              ValueListenableBuilder(
                  valueListenable: numOfNotifier,
                  builder: (context, value, _) {
                    return ItemCount(
                      initialValue: value,
                      minValue: 1,
                      maxValue: 10,
                      decimalPlaces: 0,
                      step: 1,
                      color: AppColors.primaryColor,
                      onChanged: (v) {
                        numOfNotifier.value = v.toInt();
                      },
                    );
                  }),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          RatingAndReview,
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
              colors: colors,
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
          SizeSelector(sizes: sizes, onChange: (s) {}),
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
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
            style: TextStyle(fontSize: 12, color: Colors.grey),
          )
        ],
      ),
    );
  }

  Row get RatingAndReview {
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
                  "4.4",
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
            Text(
              "Reviews",
              style: TextStyle(
                  fontSize: 16,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              width: 8,
            ),
            Card(
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
                ))
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
            child: ElevatedButton(
              onPressed: () {},
              child: Text("Add To Cart"),
            ),
          )
        ],
      ),
    );
  }
}
