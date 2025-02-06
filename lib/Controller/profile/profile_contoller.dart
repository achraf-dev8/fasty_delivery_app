
import 'package:fasty_delivery_app/Core/Constant/routes_names.dart';
import 'package:fasty_delivery_app/View/Widgets/Functions/dialogs.dart';
import 'package:fasty_delivery_app/main.dart';
import 'package:get/get.dart';

class ProfileContoller extends GetxController{

  String name = sharedPrefs.getString("name")!;
  String phoneNumber = sharedPrefs.getString("phone_number")!;

  void toName(){
    Get.toNamed(AppRoutes.changeName);
  }
    void toPhoneNumber(){
    Get.toNamed(AppRoutes.changePhoneNumber);
  }

    void toPassword(){
    Get.toNamed(AppRoutes.changePassword);
  }





}