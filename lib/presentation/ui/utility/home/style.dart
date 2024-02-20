import 'package:e_commerce_project/presentation/state_holders/auth_controller.dart';
import 'package:e_commerce_project/presentation/ui/screens/auth/verify_email_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/home/circle_icon_button.dart';
import '../assets_path.dart';

PreferredSize get appBar {
  return PreferredSize(
    preferredSize: const Size.fromHeight(29),
    child: AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Image.asset(AssetsPath.logoNav),
      actions: [
        CircleIconButton(
          onTap: () async{
           await AuthController.clearAuthData();
           Get.offAll(() => const VerifyEmailScreen());
          },
          iconData: Icons.person,
        ),
        const SizedBox(
          width: 8,
        ),
        CircleIconButton(
          onTap: () {},
          iconData: Icons.phone,
        ),
        const SizedBox(
          width: 8,
        ),
        CircleIconButton(
          onTap: () {},
          iconData: Icons.notifications_active,
        )
      ],
    ),
  );
}

TextFormField get textFormField {
  return TextFormField(
    decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search),
        hintText: "Search",
        filled: true,
        fillColor: Colors.grey.shade300,
        border: InputBorder.none,
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10)),
        disabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10))),
  );
}
