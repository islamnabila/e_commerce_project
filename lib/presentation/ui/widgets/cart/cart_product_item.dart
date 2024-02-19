import 'package:e_commerce_project/data/models/cart_item.dart';
import 'package:e_commerce_project/presentation/state_holders/cart_list_controller.dart';
import 'package:e_commerce_project/presentation/state_holders/delete-controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:item_count_number_button/item_count_number_button.dart';
import '../../utility/app_colors.dart';


class CardProductItem extends StatefulWidget {
  CardProductItem({
    super.key, required this.cartItem,
  });
  final CartItem cartItem;

  @override
  State<CardProductItem> createState() => _CardProductItemState();
}

class _CardProductItemState extends State<CardProductItem> {
   late ValueNotifier<int> numOfItem = ValueNotifier(widget.cartItem.quantity);

   @override
  void initState() {
    print(widget.cartItem.quantity);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.network(widget.cartItem.product?.image ?? "", width: 100,),
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
                            Text(widget.cartItem.product?.title ?? "", maxLines: 1, style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black54,
                                overflow: TextOverflow.ellipsis
                            ),),
                            SizedBox(height: 5,),
                            Row(
                              children: [
                                Text("Color : ${widget.cartItem.color ?? ""}"),
                                SizedBox(width: 8,),
                                Text("Size : ${widget.cartItem.size ?? ""}")
                              ],
                            ),

                          ],
                        ),
                      ),

                      IconButton(onPressed: ()async{
                        showDialog(
                            context: context,
                            builder: (BuildContext context){
                              return deleteCart;
                            });
                      },
                          icon: Icon(Icons.delete_forever_outlined, color: Colors.grey,))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("৳${widget.cartItem.product?.price ?? 0}",style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryColor
                      ),),
                      ValueListenableBuilder(
                          valueListenable: numOfItem,
                          builder: (context, value, _) {
                            return ItemCount(
                              initialValue: value,
                              minValue: 1,
                              maxValue: 10,
                              decimalPlaces: 0,
                              step: 1,
                              color: AppColors.primaryColor,
                              onChanged: (v) {
                                numOfItem.value = v.toInt();
                                Get.find<CartListController>().updateQuantity(widget.cartItem.id!, numOfItem.value);
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
  AlertDialog get deleteCart{
     return AlertDialog(
       title: const Text('Delete'),
       content: const Text('Do you want to delete this item?'),
       actions: [
         TextButton(
             onPressed: () {
               Get.back();
             },
             child: const Text('No')),
         TextButton(
             onPressed: () async {
               Get.find<DeleteCartListController>()
                   .deleteCartList(widget.cartItem.productId!);
               Get.find<CartListController>()
                   .cartListModel
                   .cartItemList!
                   .clear();
               Get.find<CartListController>().getCartList();
               Get.back();
             },
             child: const Text('Yes')),
       ],
     );
  }
}