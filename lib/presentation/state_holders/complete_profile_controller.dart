import 'package:e_commerce_project/data/models/create_profile_params.dart';
import 'package:e_commerce_project/data/models/profile.dart';
import 'package:e_commerce_project/data/services/network_caller.dart';
import 'package:e_commerce_project/presentation/state_holders/auth_controller.dart';
import 'package:get/get.dart';
import '../../data/models/product_review_data.dart';
import '../../data/utility/urls.dart';

class CompleteProfileController extends GetxController{
  bool _inProgress = false;
  bool get inProgress =>_inProgress;

  String _errorMessage =  "";
  String get errorMessage => _errorMessage;

  Profile _profile = Profile();
  Profile get profile => _profile;

  Future<bool> createProfileData(String token, CreateProfileParams params) async{
    _inProgress =true;
    update();
    final response = await NetworkCaller().postRequest(Urls.createProfile, token: token, body: params.toJson());
    _inProgress = false;
    if(response.isSuccess){
      // await Future.delayed(const Duration(seconds: 3));
      _profile =Profile.fromJson(response.responseData["data"]);
      await Get.find<AuthController>().saveUserDetails(token, _profile);
      update();
      return true;
    }else{
      _errorMessage = response.errorMessage;
      update();
      return false;
    }
  }
}