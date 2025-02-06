


import 'package:fasty_delivery_app/Controller/profile/profile_contoller.dart';
import 'package:fasty_delivery_app/View/Widgets/Functions/appbars.dart';
import 'package:fasty_delivery_app/View/Widgets/Functions/paddings.dart';
import 'package:fasty_delivery_app/View/Widgets/Classes/profile_column.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Profile extends GetView<ProfileContoller> {

  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ProfileContoller());
    return Scaffold(
      body:SafeArea(
        child: 
          ListView(children: [
            authPadding(textBackButtonAppBar(context, "Profile")),
            const SizedBox(height: 19.5),
            ProfileColumn(name: "Name", body: controller.name, onTap: (){controller.toName();}),
            ProfileColumn(name: "Phone number", body: controller.phoneNumber, onTap: (){controller.toPhoneNumber();}),
            const SizedBox(height: 8.5,),
            ProfileColumn(name: "Change password", onTap: (){controller.toPassword();}),
          ],),
      )
    );}
}