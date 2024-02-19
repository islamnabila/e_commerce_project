import 'package:e_commerce_project/data/services/network_caller.dart';
import 'package:get/get.dart';

import '../../data/utility/urls.dart';

class DeleteCartListController extends GetxController{
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  Future<bool> deleteCartList(int productId)async{
    _inProgress = true;
    update();
    final response =await NetworkCaller().getRequest(Urls.deleteCartList(productId));
    _inProgress = false;
    if(response.isSuccess){
      update();
      return true;
    }else{
      return false;
    }
  }
}




