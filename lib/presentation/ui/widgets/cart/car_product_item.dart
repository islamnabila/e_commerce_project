import 'package:flutter/material.dart';
import 'package:item_count_number_button/item_count_number_button.dart';
import '../../utility/app_colors.dart';
import '../../utility/assets_path.dart';

class CardProductItem extends StatefulWidget {
  CardProductItem({
    super.key,
  });

  @override
  State<CardProductItem> createState() => _CardProductItemState();
}

class _CardProductItemState extends State<CardProductItem> {
  final ValueNotifier<int> numOfNotifier = ValueNotifier(1);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.asset(AssetsPath.dummyShow, width: 100,),
            SizedBox(width: 10,),
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Nike shoe 12ksm 2024 Edition", maxLines: 1, style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black54,
                                overflow: TextOverflow.ellipsis
                            ),),
                            SizedBox(height: 5,),
                            Row(
                              children: [
                                Text("Color : Red"),
                                SizedBox(width: 8,),
                                Text("Size : XL")
                              ],
                            ),

                          ],
                        ),
                      ),

                      IconButton(onPressed: (){},
                          icon: Icon(Icons.delete_forever_outlined, color: Colors.grey,))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("\$100",style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryColor
                      ),),
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
                          }
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}