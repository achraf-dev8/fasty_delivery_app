





import 'package:fasty_delivery_app/Core/Constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

      orderDialog(String text, void Function()? onPressed){
          Get.defaultDialog(
        backgroundColor: AppColors.white,
      titlePadding: const EdgeInsets.only(right: 13, left : 13, top : 10),
      title: text,
      titleStyle: const TextStyle(color: AppColors.black, fontSize: 20,),
      content: const SizedBox(height: 2,),
      cancel: confirmButton("Yes", onPressed),

      confirm: cancelButton("No") );
  }


  Widget confirmButton(String text, void Function()? onPressed){
    return dialogButton(text, onPressed, AppColors.organgeYellow, AppColors.white);
  }


    Widget cancelButton(String text){
    return dialogButton(text, (){Get.back();}, AppColors.white, AppColors.organgeYellow);
  }

  Widget dialogButton(String text, void Function()? onPressed, Color buttonColor, Color textColor){
    return Padding(
        padding: const EdgeInsets.only(left:16.0),
        child: OutlinedButton(onPressed: onPressed, 
        style: OutlinedButton.styleFrom(
          backgroundColor: buttonColor,
          side: const BorderSide(color: AppColors.organgeYellow, width: 2),
        ), child:  Text(text, 
        style: TextStyle(color: textColor, fontWeight: FontWeight.bold, fontSize: 16.5),)),
      );
  }