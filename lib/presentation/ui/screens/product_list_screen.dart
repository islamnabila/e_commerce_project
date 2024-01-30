import 'package:e_commerce_project/presentation/ui/widgets/product_card_item.dart';
import 'package:flutter/material.dart';


class ProuctListScreen extends StatefulWidget {
  const ProuctListScreen({super.key,  this.category});
  final String? category;

  @override
  State<ProuctListScreen> createState() => _ProuctListScreenState();
}

class _ProuctListScreenState extends State<ProuctListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category ??
          "Products",
        ),
        iconTheme: IconThemeData(color: Colors.black),


      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: GridView.builder(
            itemCount: 20,
            gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.90,
                mainAxisSpacing: 8,
                crossAxisSpacing: 4,
            ),
            itemBuilder: (context, index) {
              return FittedBox(
                  child: ProductCardItem());
            }),
      ),
    );
  }
}

