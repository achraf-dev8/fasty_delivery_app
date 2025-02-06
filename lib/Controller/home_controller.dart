



import 'package:fasty_delivery_app/Core/Classes/statuts_request.dart';
import 'package:fasty_delivery_app/Data/DataSource/Remote/home.dart';
import 'package:fasty_delivery_app/View/Screens/account.dart';
import 'package:fasty_delivery_app/View/Screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Homecontroller extends GetxController{
    
  int selectedIndex =0;
  StatusRequest statusRequest = StatusRequest.loading;
  HomeData homeData = HomeData(Get.find());
    final List<Widget> pagesList = [
    const HomePage(), const Account()
  ]; 


  @override
  void onInit() async{
    await getData();
    super.onInit();
  }

   getData() async{
    statusRequest = await homeData.getAllData(true);
     update();
  }

  changeSelected(int val){
    selectedIndex = val;
    update();
  }

}