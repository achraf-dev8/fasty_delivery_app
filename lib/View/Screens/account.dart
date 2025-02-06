

import 'package:fasty_delivery_app/Controller/account_controller.dart';
import 'package:fasty_delivery_app/View/Screens/archived_orders.dart';
import 'package:fasty_delivery_app/View/Screens/profile/profile.dart';
import 'package:fasty_delivery_app/View/Widgets/Classes/account_row.dart';
import 'package:fasty_delivery_app/main.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';


class Account extends GetView<AccountController> {
  const Account({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(AccountController());
    return Scaffold(
      body:SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [const SizedBox(height: 30,),
           Padding(
               padding: const EdgeInsets.only(left: 20),
              child: Text(sharedPrefs.getString("name")!,style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 21.5),),
            ),
          const SizedBox(height: 18,),
          AccountRow(name :"Profile", icon : FontAwesomeIcons.solidCircleUser, onTap: (){Get.to(Profile());}),
          AccountRow(name: "Archived Orders", icon:  FontAwesomeIcons.boxOpen,onTap:  (){Get.to(ArchivedOrders());}),
          const SizedBox(height: 40,),
          AccountRow(name:  "Log out",icon:  FontAwesomeIcons.rightFromBracket,onTap: (){controller.logOut();}),
          ],
        ),
      )
    );
  }


}