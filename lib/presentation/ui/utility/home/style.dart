import 'package:e_commerce_project/presentation/ui/utility/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../widgets/home/circle_icon_button.dart';
import '../assets_path.dart';

PreferredSize get appBar{
  return PreferredSize(
    preferredSize: Size.fromHeight(29),
    child: AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Image.asset(AssetsPath.logoNav),
      actions: [
        CircleIconButton(onTap: () {  }, iconData: Icons.person,),
        SizedBox(width: 8,),
        CircleIconButton(onTap: () {  }, iconData: Icons.phone,),
        SizedBox(width: 8,),
        CircleIconButton(onTap: () {  }, iconData: Icons.notifications_active,)
      ],
    ),
  );
}

TextFormField get textFormField{
  return TextFormField(
    decoration: InputDecoration(
        prefixIcon: Icon(Icons.search),
        hintText: "Search",
        filled: true,
        fillColor: Colors.grey.shade300,
        border: InputBorder.none,
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10)
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10)
        ),
        disabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10)
        )
    ),
  );
}