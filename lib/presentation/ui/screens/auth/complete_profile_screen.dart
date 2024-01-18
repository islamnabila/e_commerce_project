import 'package:e_commerce_project/presentation/ui/screens/auth/verify_otp_screen.dart';
import 'package:e_commerce_project/presentation/ui/screens/main_bottom_nav_screen.dart';
import 'package:e_commerce_project/presentation/ui/utility/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(height: 40,),
                Image.asset(
                  AssetsPath.logo,
                  width: MediaQuery.of(context).size.height * 0.1,
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Complete Profile",
                    style: Theme.of(context).textTheme.titleLarge),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Get started with us with your details",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: "First Name"),
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: "Last Name"),
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: "Mobile"),
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: "City"),
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  maxLines: 4,
                  decoration: InputDecoration(hintText: "Shopping Address"),
                ),

                SizedBox(
                  height: 24,
                ),
               SizedBox(
                 width: double.infinity,
                 child: ElevatedButton(
                     onPressed: (){
                       Get.to(MainBottomNavScreen());
                     }, child: Text("Complete")),
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
