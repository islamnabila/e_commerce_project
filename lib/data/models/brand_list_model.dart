import 'brand.dart';

class BrandListModel {
  String? msg;
  List<Brand>? brandList;

  BrandListModel({this.msg, this.brandList});

  BrandListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      brandList = <Brand>[];
      json['data'].forEach((v) {
        brandList!.add(Brand.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (this.brandList != null) {
      data['data'] = this.brandList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

