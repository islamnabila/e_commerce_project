import 'package:e_commerce_project/presentation/ui/screens/auth/verify_otp_screen.dart';
import 'package:e_commerce_project/presentation/ui/utility/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class VeifyEmailScreen extends StatefulWidget {
  const VeifyEmailScreen({super.key});

  @override
  State<VeifyEmailScreen> createState() => _VeifyEmailScreenState();
}

class _VeifyEmailScreenState extends State<VeifyEmailScreen> {
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
                Text("Welcome Back",
                    style: Theme.of(context).textTheme.titleLarge),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Please Enter Your Email Address",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: "Email Address"),
                ),
                SizedBox(
                  height: 15,
                ),
               SizedBox(
                 width: double.infinity,
                 child: ElevatedButton(
                     onPressed: (){
                       Get.to(VeifyOtpScreen());
                     }, child: Text("Next")),
               ),
                SizedBox(height: 40,)

              ],
            ),
          ),
        ),
      ),
    );
  }
}
