import 'dart:convert';
import 'package:e_commerce_project/data/models/response_data.dart';
import 'package:e_commerce_project/presentation/state_holders/auth_controller.dart';
import 'dart:developer';
import 'package:http/http.dart';

class NetworkCaller {
  //Get Request
  Future<ResponseData> getRequest(String url, {String? token}) async {
    log(url);
    log(token.toString());
    final Response response = await get(
      Uri.parse(url),
      headers: {
        "token": (token ?? AuthController.token).toString(),
        "Content-type": "application/json"
      },
    );
    log(response.headers.toString());
    log(response.statusCode.toString());
    log(response.body.toString());
    if (response.statusCode == 200) {
      final decodeResponse = jsonDecode(response.body);
      if (decodeResponse["msg"] == "success") {
        return ResponseData(
            isSuccess: true,
            statusCode: response.statusCode,
            responseData: decodeResponse);
      } else {
        return ResponseData(
            isSuccess: false,
            statusCode: response.statusCode,
            errorMessage: decodeResponse["data"] ?? "Something went wrong!",
            responseData: decodeResponse);
      }
    } else if(response.statusCode == 401){
      await AuthController.clearAuthData();
      AuthController.goToLogin();
      return ResponseData(
        isSuccess: false,
        statusCode: response.statusCode,
        responseData: "",
      );
    }
    else {
      return ResponseData(
          isSuccess: false,
          statusCode: response.statusCode,
          responseData: "");
    }
  }

  //Post Request
  Future<ResponseData> postRequest(String url,
      {Map<String, dynamic>? body, String? token}) async {
    log(url);
    log(body.toString());
    log(token.toString());
    final Response response = await post(
      Uri.parse(url),
      body: jsonEncode(body),
      headers: {
        "token": AuthController.token.toString(),
        "Content-type": "application/json"
      },
    );
    log(response.headers.toString());
    log(response.statusCode.toString());
    log(response.body.toString());
    if (response.statusCode == 200) {
      final decodeResponse = jsonDecode(response.body);
      if (decodeResponse["msg"] == "success") {
        return ResponseData(
            isSuccess: true,
            statusCode: response.statusCode,
            responseData: decodeResponse);
      } else {
        return ResponseData(
            isSuccess: false,
            statusCode: response.statusCode,
            errorMessage: decodeResponse["data"] ?? "Something went wrong!",
            responseData: decodeResponse,
        );
      }
    } else if(response.statusCode == 401){
      await AuthController.clearAuthData();
      AuthController.goToLogin();
      return ResponseData(
        isSuccess: false,
        statusCode: response.statusCode,
        responseData: "",
      );
    }
    else {
      return ResponseData(
          isSuccess: false,
          statusCode: response.statusCode,
          responseData: "",
      );
    }
  }
}
