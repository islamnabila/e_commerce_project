import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../state_holders/main_bottom_nav_controller.dart';
import '../widgets/category_item.dart';

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
                crossAxisCount: 4,
                childAspectRatio: 0.95,
                mainAxisSpacing: 12,
                crossAxisSpacing: 8
            ),
            itemBuilder: (context, index) {
              return FittedBox(
                  child: CategoryItem());
            }),
      ),
    );
  }
}

