import 'package:e_commerce_project/presentation/ui/screens/auth/verify_email_screen.dart';
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
    // TODO: implement initState
    super.initState();
    moveToNextScreen();
  }

  void moveToNextScreen() async {
    await Future.delayed(Duration(seconds: 3));
    Get.offAll(const VeifyEmailScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Spacer(),
            Image.asset(
              AssetsPath.logo,
              width: MediaQuery.of(context).size.height * 0.2,
            ),
            Spacer(),
            CircularProgressIndicator(),
            SizedBox(
              height: 10,
            ),
            Text("Version 1.0"),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
