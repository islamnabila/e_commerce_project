import 'package:e_commerce_project/data/models/product_list_model.dart';
import 'package:e_commerce_project/data/services/network_caller.dart';
import 'package:e_commerce_project/data/utility/urls.dart';
import 'package:get/get.dart';

class NewProductController extends GetxController{
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String _errorMessage = "";
  String get errorMessage => _errorMessage;

  ProductListModel _productListModel = ProductListModel();
  ProductListModel get productListModel => _productListModel;

  Future<bool> getNewProductList() async{
    bool isSuccess = false;
    _inProgress = true;
    update();

    final response = await NetworkCaller().getRequest(Urls.newProduct);
    _inProgress = false;
    if(response.isSuccess){
      _productListModel = ProductListModel.fromJson(response.responseData);
      isSuccess = true;
    }else{
      _errorMessage = response.errorMessage;
    }
    update();
    return isSuccess;
  }
}