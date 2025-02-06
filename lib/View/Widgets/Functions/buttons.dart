
import 'package:auto_size_text/auto_size_text.dart';
import 'package:fasty_delivery_app/Core/Constant/colors.dart';
import 'package:fasty_delivery_app/View/Widgets/Functions/shapes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

Widget textButton(String text, void Function()? onPressed, TextStyle style){
return TextButton( style: ButtonStyle(
    overlayColor: WidgetStateProperty.resolveWith<Color?>(
      (Set<WidgetState> states) {
        if (states.contains(WidgetState.pressed)) {
          return AppColors.buttonSplash; 
        }
        return null; 
      },
    ),
  ),
                      onPressed: onPressed,
                      child: Text(
                        text,
                        textAlign: TextAlign.center,
                        style: style,
                      ),
                    );
}

Widget nextButton(void Function()? onPressed, String text){
return SizedBox( height: 48,
width: 290,
child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all<Color>(AppColors.organgeYellow),
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      onPressed: onPressed,
                      child: Text(text,
                        style: const TextStyle(
                          color: AppColors.white,
                          fontSize: 24, ), ), ),); 
}

Widget backIconButton(double iconSize, double circleSize){
  return greyCircle(IconButton(onPressed: (){Get.back();}, 
        icon:  Icon(FontAwesomeIcons.arrowLeft, size: iconSize, color: AppColors.brownRed,)), circleSize, null);}

Widget orderButton(Color color, String text, void Function() onPressed){
  return SizedBox( height: 40,width: 97.5, child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all<Color>(color),
                          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                        ),
                        onPressed: onPressed,
                        
                        child: AutoSizeText(text,
                        maxLines: 1,
                          style: const TextStyle(
                            color: AppColors.white,
                            fontSize: 18.5, ), ), ),);
}
