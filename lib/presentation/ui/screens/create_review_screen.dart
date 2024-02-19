import 'package:e_commerce_project/presentation/state_holders/create_review_controller.dart';
import 'package:e_commerce_project/presentation/ui/screens/reviews_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../state_holders/review_list_controller.dart';


class CreateReviewScreen extends StatefulWidget {
  const CreateReviewScreen({super.key, required this.productId});

  final int productId;

  @override
  State<CreateReviewScreen> createState() => _CreateReviewScreenState();
}

class _CreateReviewScreenState extends State<CreateReviewScreen> {
  final TextEditingController _productIdController = TextEditingController();
  final TextEditingController _ratingController  = TextEditingController();
  final TextEditingController _reviewController = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _productIdController.text =widget.productId.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Review"),
        iconTheme: IconThemeData(
          color: Colors.black
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 75, left: 20, right: 20, bottom: 15),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                TextFormField(
                  controller: _productIdController,
                  readOnly: true,
                  decoration: InputDecoration(hintText: "product id"),
                  validator: (String? value){
                    if(value?.trim().isEmpty ?? true){
                      return "Product Id";
                    }
                    else{
                      return null;
                    }
                  }
                ),
                SizedBox(height: 15,),
                TextFormField(
                  controller: _ratingController,
                  decoration: InputDecoration(hintText: "rating"),
                    validator: (String? value){
                      if(value?.trim().isEmpty ?? true){
                        return "Please Enter rating";
                      }
                      else{
                        return null;
                      }
                    }
                ),
                SizedBox(height: 15,),
                TextFormField(
                  controller: _reviewController,
                  maxLines: 10,
                  decoration: InputDecoration(hintText: "Write Review"),
                    validator: (String? value){
                      if(value?.trim().isEmpty ?? true){
                        return "Please Enter description3.5";
                      }
                      else{
                        return null;
                      }
                    }
                ), SizedBox(height: 15,),
                SizedBox(
                  height: 45,
                    width: double.infinity,
                    child: GetBuilder<CreateReviewController>(
                      builder: (createReviewController) {
                        return Visibility(
                          visible: createReviewController.inProgress == false,
                          replacement:const Center(child: CircularProgressIndicator(),),
                          child: ElevatedButton(onPressed: ()async{
                            if(_formkey.currentState!.validate()){
                              final response = await createReviewController.createReview(
                                  widget.productId,
                                  int.parse(_ratingController.text.trim()),
                                _reviewController.text.trim(),);
                              if(response){
                                // Navigator.pop(context,);
                                Get.to(()=>ReviewsListScreen(productId: widget.productId));
                              }else{
                                Get.showSnackbar(GetSnackBar(
                                  title: "Create review failed",
                                  message: createReviewController.errorMessage,
                                  duration: Duration(seconds: 2),
                                  isDismissible: true,
                                ));
                              }
                            }
                          }, child: Text("Submit")),
                        );
                      }
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    _productIdController.dispose();
    _ratingController.dispose();
    _reviewController.dispose();
    super.dispose();
  }
}



