import 'package:e_commerce_project/presentation/state_holders/verify_otp_controller.dart';
import 'package:e_commerce_project/presentation/ui/screens/main_bottom_nav_screen.dart';
import 'package:e_commerce_project/presentation/ui/utility/app_colors.dart';
import 'package:e_commerce_project/presentation/ui/utility/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'complete_profile_screen.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key, required this.email});
  final String email;

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final TextEditingController _otpController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 120,),
                    Image.asset(
                      AssetsPath.logo,
                      width: MediaQuery.of(context).size.height * 0.1,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text("Enter OTP Code",
                        style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "A 4 digit OTP code has been sent",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    PinCodeTextField(
                      controller: _otpController,
                      appContext: context,
                      length: 6,
                      obscureText: false,
                      animationType: AnimationType.fade,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      keyboardType: TextInputType.number,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(5),
                        fieldHeight: 50,
                        fieldWidth: 40,
                        activeFillColor: Colors.transparent,
                        inactiveFillColor: Colors.transparent,
                        inactiveColor: AppColors.primaryColor,
                        selectedFillColor: Colors.transparent,
                        selectedColor: Colors.purple
                      ),
                      animationDuration: const Duration(milliseconds: 300),
                      backgroundColor: Colors.transparent,
                      enableActiveFill: true,
                      onCompleted: (v) {

                      },
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                   SizedBox(
                     width: double.infinity,
                     child: GetBuilder<VerifyOtpController>(
                       builder: (verifyOtpController) {
                         return Visibility(
                           visible: verifyOtpController.inProgress == false,
                           replacement: const Center(
                             child: CircularProgressIndicator(),
                           ),
                           child: ElevatedButton(
                               onPressed: ()async{
                                 if(_formKey.currentState!.validate()){
                                   final bool response =await verifyOtpController.verifyOTP(widget.email, _otpController.text);
                                   if(response){
                                     if(verifyOtpController.shouldNavigateCompleteProfile){
                                       Get.to(() => const CompleteProfileScreen());
                                     }else{
                                       Get.offAll(() => const MainBottomNavScreen());
                                     }

                                   }else{
                                     Get.showSnackbar(GetSnackBar(
                                       title: "OTP verification failed!",
                                       message: verifyOtpController.errorMessage,
                                       duration: const Duration(seconds: 2),
                                       isDismissible: true,
                                     ));
                                   }
                                 }
                               }, child: const Text("Next")),
                         );
                       }
                     ),
                   ),
                    const SizedBox(height: 24,),
                    RichText(text: const TextSpan(
                      style: TextStyle(color: Colors.green),
                      children: [
                        TextSpan(
                          text: "This code will expire "
                        ),
                        TextSpan(
                          text: "120s",
                          style: TextStyle(color: AppColors.primaryColor, fontWeight: FontWeight.w600)
                        )
                      ]
                    )),
                    TextButton(onPressed: (){}, child: const Text("Reset Code",style: TextStyle(color: Colors.grey),))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


