import 'package:e_commerce_project/data/models/product_review_data.dart';

class ReviewListModel {
  String? msg;
  List<ProductReviewData>? reviewDataList;

  ReviewListModel({this.msg, this.reviewDataList});

  ReviewListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      reviewDataList = <ProductReviewData>[];
      json['data'].forEach((v) {
        reviewDataList!.add(ProductReviewData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (reviewDataList != null) {
      data['data'] = reviewDataList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


