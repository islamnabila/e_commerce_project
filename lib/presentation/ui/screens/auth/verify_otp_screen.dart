import 'package:e_commerce_project/presentation/ui/utility/app_colors.dart';
import 'package:e_commerce_project/presentation/ui/utility/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'complete_profile_screen.dart';

class VeifyOtpScreen extends StatefulWidget {
  const VeifyOtpScreen({super.key});

  @override
  State<VeifyOtpScreen> createState() => _VeifyOtpScreenState();
}

class _VeifyOtpScreenState extends State<VeifyOtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(height: 120,),
                Image.asset(
                  AssetsPath.logo,
                  width: MediaQuery.of(context).size.height * 0.1,
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Enter OTP Code",
                    style: Theme.of(context).textTheme.titleLarge),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "A 4 digit OTP code has been sent",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                SizedBox(
                  height: 20,
                ),
                PinCodeTextField(
                  appContext: context,
                  length: 4,
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
                  animationDuration: Duration(milliseconds: 300),
                  backgroundColor: Colors.transparent,
                  enableActiveFill: true,
                  onCompleted: (v) {
                    print("Completed");
                  },
                ),
                SizedBox(
                  height: 24,
                ),
               SizedBox(
                 width: double.infinity,
                 child: ElevatedButton(
                     onPressed: (){
                       Get.to(CompleteProfileScreen());
                     }, child: Text("Next")),
               ),
                SizedBox(height: 24,),
                RichText(text: TextSpan(
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
                TextButton(onPressed: (){}, child: Text("Reset Code",style: TextStyle(color: Colors.grey),))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
