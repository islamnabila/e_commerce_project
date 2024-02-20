import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_project/presentation/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../data/models/banner.dart';

class ImageCarouselWidget extends StatefulWidget {

  const ImageCarouselWidget({
    super.key, this.height, required this.bannerList,
  });

  final double? height;
  final List<BannerItem> bannerList;

  @override
  State<ImageCarouselWidget> createState() => _ImageCarouselWidgetState();
}

class _ImageCarouselWidgetState extends State<ImageCarouselWidget> {
  final ValueNotifier<int> _currentIndex = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(height:widget.height ?? 180.0,
            onPageChanged: (index, reason){
            _currentIndex.value =index;
            },
            viewportFraction: 1,
            // autoPlay: true,
            // enableInfiniteScroll: false
          ),
          items: widget.bannerList.map((banner) {
            return Builder(
              builder: (BuildContext context) {
                return Stack(
                  children: [
                    Container(
                        // width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 2.0),
                        decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(8),
                        ),
                        alignment: Alignment.center,
                      child: Row(
                        children: [
                          Image.network(banner.image ?? "",height: 200, width: 200,),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment :MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 130,
                                  child: Text(banner.title ?? "", style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white),),
                                ),
                                const SizedBox(height: 8,),
                                SizedBox(
                                  width:130,
                                  child: Text(banner.shortDes ?? "", style: const TextStyle(fontSize: 12, fontWeight:FontWeight.w500, color: Colors.white ),),
                                )
                              ],
                            ),
                          )
                        ],
                      ),

                    ),
                  ],
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 6,),
        ValueListenableBuilder(
          valueListenable: _currentIndex,
          builder: (context, index, _) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for(int i = 0; i<widget.bannerList.length; i++)
                  Container(
                    height: 14,
                    width: 14,
                    margin: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        color: i == index? AppColors.primaryColor :Colors.white,
                      border: Border.all(
                        color: i == index? AppColors.primaryColor :Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(20)
                    ),

                  )
              ],
            );
          }
        )
      ],
    );
  }
}