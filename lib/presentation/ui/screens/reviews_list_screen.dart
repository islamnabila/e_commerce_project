

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../state_holders/auth_controller.dart';
import '../../state_holders/review_list_controller.dart';
import '../utility/app_colors.dart';
import '../widgets/reviews_card.dart';
import 'create_review_screen.dart';


class ReviewsListScreen extends StatefulWidget {
  const ReviewsListScreen({super.key, required this.productId});

  final int productId;

  @override
  State<ReviewsListScreen> createState() => _ReviewsListScreenState();
}

class _ReviewsListScreenState extends State<ReviewsListScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<ReviewListController>().getReviewList(widget.productId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reviews'),
        iconTheme:const IconThemeData(
          color: Colors.black
        ),
      ),
      body: GetBuilder<ReviewListController>(
          builder: (reviewListController) {
        if (reviewListController.inProgress) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 4, right: 4, top: 4),
                child: Visibility(
                  visible: reviewListController.reviewListModel.reviewDataList?.isNotEmpty ?? false,
                  replacement: const Center(
                    child: Text('Reviews not available'),
                  ),
                  child: ListView.builder(
                    itemCount:reviewListController.reviewListModel.reviewDataList?. length ?? 0,
                    itemBuilder: (context, index) {
                      return ReviewsCard(
                        productReviewData: reviewListController.reviewListModel.reviewDataList![index],
                      );
                    },
                  ),
                ),
              ),
            ),
            totalAndCreateReviewsSection(
                reviewListController.reviewListModel.reviewDataList?.length ?? 0),
          ],
        );
      }),
    );
  }

  Container totalAndCreateReviewsSection(int totalReviews) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.15),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Reviews (${totalReviews.toString()})',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade700,
            ),
          ),
          SizedBox(
            width: 50,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
              ),
              onPressed: () {
                if (Get.find<AuthController>().isTokenNotNull == false) {
                  AuthController.goToLogin();
                  return;
                }
                Get.to(() => CreateReviewScreen(
                  productId: widget.productId,
                ));
              },
              child: const Icon(
                Icons.add,
              ),
            ),
          ),
        ],
      ),
    );
  }
}