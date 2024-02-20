import 'dart:developer';
import 'package:get/get.dart';
import '../../data/models/wishlist_model.dart';
import '../../data/services/network_caller.dart';
import '../../data/utility/urls.dart';
import 'auth_controller.dart';

class WishlistController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  String _errorMessage = '';

  String get errorMessage => _errorMessage;

  WishlistModel _wishlistModel = WishlistModel();

  WishlistModel get wishlistModel => _wishlistModel;

  Future<bool> getWishlist() async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final response = await NetworkCaller().getRequest(Urls.wishlist);
    log(AuthController.token.toString());
    _inProgress = false;
    if (response.isSuccess) {
      _wishlistModel = WishlistModel.fromJson(response.responseData);
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    update();
    return isSuccess;
  }
}
