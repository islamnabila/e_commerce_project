import 'package:e_commerce_project/data/services/network_caller.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../data/utility/urls.dart';

class CreateReviewController extends GetxController{
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String _errorMessage = "";
  String get errorMessage => _errorMessage;

  Future<bool> createReview( int productId, int rating,String description,)async{
    bool isSuccess = false;
    _inProgress = true;
    update();
    Map<String, dynamic> inputParams ={
      "product_id": productId,
      "rating": rating,
      "description": description,
    };
    final response =await NetworkCaller().postRequest(Urls.createReview, body: inputParams);
    if(response.isSuccess){
      isSuccess = true;
    }else{
      _errorMessage = response.errorMessage;
    }
    _inProgress= false;
    update();
    return isSuccess;
  }
}