


import 'package:fasty_delivery_app/Core/Constant/routes_names.dart';
import 'package:fasty_delivery_app/View/Widgets/Functions/dialogs.dart';
import 'package:fasty_delivery_app/main.dart';
import 'package:get/get.dart';

class AccountController extends GetxController{

    logOut()async{
    orderDialog("Are you sure you want to log out?", (){confirmLogin();});


    }
    confirmLogin()async{
  sharedPrefs.setInt("id", -1);
    Get.offAllNamed(AppRoutes.login);
    }
  }



