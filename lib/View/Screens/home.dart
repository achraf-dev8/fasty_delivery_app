


import 'package:fasty_delivery_app/Controller/home_controller.dart';
import 'package:fasty_delivery_app/Core/Classes/statuts_request.dart';
import 'package:fasty_delivery_app/Core/Constant/colors.dart';
import 'package:fasty_delivery_app/View/Screens/error/handling-request-view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class Home extends GetView<Homecontroller> {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(Homecontroller());
    
    return GetBuilder<Homecontroller>(
      builder: (controller) =>
         Scaffold(
           bottomNavigationBar: controller.statusRequest != StatusRequest.sucsses ? null
            : BottomNavigationBar(
                onTap: (val){controller.changeSelected(val);},
                showSelectedLabels: true,
                currentIndex: controller.selectedIndex,
                selectedItemColor: AppColors.organgeYellow,
                unselectedItemColor: AppColors.mediumGrey,
                selectedLabelStyle: TextStyle(fontSize: 15.75, fontWeight: FontWeight.bold) ,
                selectedIconTheme:  IconThemeData(size: 19.5),
                unselectedIconTheme: IconThemeData(size: 19),
                items: const [
                  BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.house), label: "Home"),
                   BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.solidUser), label: "Account"),
                ]),

          body: HandlingRequestView(statusRequest: controller.statusRequest, update: (){controller.getData();}, 
          widget: controller.pagesList[controller.selectedIndex],)  
          ));
      }
  }
