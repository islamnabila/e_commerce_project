import 'package:e_commerce_project/data/models/banner_list_model.dart';
import 'package:e_commerce_project/data/services/network_caller.dart';
import 'package:get/get.dart';

import '../../data/utility/urls.dart';

class HomeBannerController extends GetxController{
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String _errorMessage ="";
  String get errorMessage => _errorMessage;

  BannerListModel _bannerListModel = BannerListModel();
  BannerListModel get bannerListModel =>_bannerListModel;

  Future<bool> getBannerList()async{
    bool _isSuccess = false;
    _inProgress = true;
    update();
    final response = await NetworkCaller().getRequest(Urls.homeBanner);
    _inProgress= false;
    if(response.isSuccess){
      _bannerListModel = BannerListModel.fromJson(response.responseData);
      _isSuccess =true;
    }else{
      _errorMessage =response.errorMessage;
    }
    update();
    return _isSuccess;

  }
}