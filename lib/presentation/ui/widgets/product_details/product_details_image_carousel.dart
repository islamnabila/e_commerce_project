import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_project/presentation/ui/utility/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductDetailsImageCarousel extends StatefulWidget {
  const ProductDetailsImageCarousel({
    super.key, this.height,
  });
  final double? height;

  @override
  State<ProductDetailsImageCarousel> createState() => _ProductDetailsImageCarouselState();
}

class _ProductDetailsImageCarouselState extends State<ProductDetailsImageCarousel> {
  ValueNotifier<int> _currentIndex = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(height:widget.height ?? 220.0,
            onPageChanged: (index, reason){
              _currentIndex.value =index;
            },
            viewportFraction: 1,
            // autoPlay: true,
            // enableInfiniteScroll: false
          ),
          items: [1,2,3,4,5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                    ),
                    alignment: Alignment.center,
                    child: Text('text $i', style: TextStyle(fontSize: 16.0),)
                );
              },
            );
          }).toList(),
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: ValueListenableBuilder(
              valueListenable: _currentIndex,
              builder: (context, index, _) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for(int i = 0; i<5; i++)
                      Container(
                        height: 14,
                        width: 14,
                        margin: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            color: i == index? AppColors.primaryColor :Colors.white,
                            border: Border.all(
                              color: i == index? AppColors.primaryColor :Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(20)
                        ),

                      )
                  ],
                );
              }
          ),
        )
      ],
    );
  }
}