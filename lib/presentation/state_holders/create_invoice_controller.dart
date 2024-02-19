import 'package:e_commerce_project/data/models/payment_model_list_model.dart';
import 'package:e_commerce_project/data/services/network_caller.dart';
import 'package:e_commerce_project/data/utility/urls.dart';
import 'package:get/get.dart';

class CreateInvoiceController extends GetxController{
  bool _inProgress = false;
  bool get inProgress =>_inProgress;

  String _errorMessage = "";
  String get errorMessage =>_errorMessage;

  PaymentMethodListModel _paymentMethodListModel =PaymentMethodListModel();
  PaymentMethodListModel get paymentMethodListModel => _paymentMethodListModel;

  Future<bool> createInvoice()async{
    bool isSuccess = false;
    _inProgress = true;
    update();

    final response =await NetworkCaller().getRequest(Urls.createInvoice);
    if(response.isSuccess){
      _paymentMethodListModel = PaymentMethodListModel.fromJson(response.responseData);
      isSuccess = true;
    }else{
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}