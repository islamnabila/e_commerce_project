import 'package:e_commerce_project/data/services/network_caller.dart';
import 'package:e_commerce_project/data/utility/urls.dart';
import 'package:get/get.dart';

class AddToCartController extends GetxController{
  bool _inProgress = false;
  bool get inProgress =>_inProgress;

  String _errorMessage = "";
  String get errorMessage =>_errorMessage;

  Future<bool> getAddToCart(int productId, String color, String size, int quantity) async{
    bool isSuccess = false;
    _inProgress = true;
    update();
    Map<String, dynamic> inputParams={
      "product_id":productId,
      "color":color,
      "size":size,
      "qty": quantity,
    };
    final response = await NetworkCaller().postRequest(Urls.addToCart, body: inputParams);
    if(response.isSuccess){
      isSuccess = true;
    }else{
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}