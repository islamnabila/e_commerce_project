import 'package:e_commerce_project/data/models/wishlist.dart';

class WishlistModel {
  String? msg;
  List<Wishlist>? wishlist;

  WishlistModel({this.msg, this.wishlist});

  WishlistModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      wishlist = <Wishlist>[];
      json['data'].forEach((v) {
        wishlist!.add(Wishlist.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (wishlist != null) {
      data['data'] = wishlist!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}




