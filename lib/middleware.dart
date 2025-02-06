

import 'package:fasty_delivery_app/Core/Constant/routes_names.dart';
import 'package:fasty_delivery_app/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MiddleWare extends GetMiddleware{

 int? get priorety => 1;

 @override
 RouteSettings? redirect(String? route){

  if(sharedPrefs.getInt("id") != null && sharedPrefs.getInt("id") != -1){
    return const RouteSettings(name : AppRoutes.home);
  }
  return null;
 }
 

} 