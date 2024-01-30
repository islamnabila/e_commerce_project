
import 'package:e_commerce_project/presentation/ui/screens/main_bottom_nav_screen.dart';
import 'package:e_commerce_project/presentation/ui/utility/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    moveToNextScreen();
  }

  void moveToNextScreen() async {
    await Future.delayed(const Duration(seconds: 3));
    // final bool isLoggedIn =await Get.find<AuthController>().isLogggedIn();
    // if(isLoggedIn){
      Get.offAll(() => const MainBottomNavScreen());
    // }else{
    //   Get.offAll(()=> const VerifyEmailScreen());
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            Image.asset(
              AssetsPath.logo,
              width: MediaQuery.of(context).size.height * 0.2,
            ),
            const Spacer(),
            const CircularProgressIndicator(),
            const SizedBox(
              height: 10,
            ),
            const Text("Version 1.0"),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
