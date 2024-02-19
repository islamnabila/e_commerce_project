
import 'package:e_commerce_project/presentation/ui/screens/main_bottom_nav_screen.dart';
import 'package:e_commerce_project/presentation/ui/utility/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../state_holders/auth_controller.dart';

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
    await Get.find<AuthController>().initialize();
    Get.offAll(() => const MainBottomNavScreen());

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
