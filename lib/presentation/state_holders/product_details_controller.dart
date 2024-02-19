import 'package:e_commerce_project/data/models/product_details_data.dart';
import 'package:e_commerce_project/data/models/product_details_model.dart';
import 'package:e_commerce_project/data/models/response_data.dart';
import 'package:e_commerce_project/data/services/network_caller.dart';
import 'package:e_commerce_project/data/utility/urls.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController{
  bool _inProgress = false;
  bool get inProgress =>_inProgress;
  
  String _errorMessage = "";
  String get errorMessage =>_errorMessage;
  
  ProductDetailsModel _productDetailsModel =ProductDetailsModel();
  ProductDetailsData get productDetailsData => _productDetailsModel.productDetailsDataList!.first;
  
  Future<bool> getProductDetails(int productId) async{
    bool isSuccess = false;
    _inProgress = true;
    update();
    final ResponseData response = await NetworkCaller().getRequest(Urls.productDetails(productId));
    _inProgress = false;
    if(response.isSuccess){
      _productDetailsModel = ProductDetailsModel.fromJson(response.responseData);
    }else{
      _errorMessage =response.errorMessage;
    }
    update();
    return isSuccess;
  }
}