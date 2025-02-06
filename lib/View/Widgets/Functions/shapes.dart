
import 'package:fasty_delivery_app/Core/Constant/colors.dart';
import 'package:flutter/material.dart';

Widget circle(Widget widget, double size, EdgeInsetsGeometry? margin, Color color){
    return Container( 
      margin:  margin,
      width: size,
      height: size,
      decoration: BoxDecoration(
       color:color,
       shape: BoxShape.circle,
       ),
       child: widget,
       );
  }
  Widget greyCircle(IconButton iconButton, double size, EdgeInsetsGeometry? margin){
    return circle(iconButton, size, margin, AppColors.circleGrey);
  }

