
import 'package:fasty_delivery_app/Core/Classes/statuts_request.dart';
import 'package:fasty_delivery_app/Core/Constant/routes_names.dart';
import 'package:fasty_delivery_app/Core/Functions/checkinternet.dart';
import 'package:fasty_delivery_app/Core/Functions/handlingrequest.dart';
import 'package:fasty_delivery_app/Data/DataSource/Remote/profile/edit_name.dart';
import 'package:fasty_delivery_app/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditNameContoller extends GetxController{
  EditNameData editNameData = EditNameData(Get.find());
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController(text: sharedPrefs.getString("name"));
  StatusRequest statusRequest = StatusRequest.sucsses;
  

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }
    updateStatusRequest() async{
    statusRequest = await checkInternetFull();
      update();
  }
  
save() async{

      if(sharedPrefs.getString("name") ==  nameController.text){
      Get.offNamedUntil(AppRoutes.profile, (route) => route.settings.name == AppRoutes.home,);
         return null;
    }

        if(formKey.currentState!.validate()){
      if(formKey.currentState!.validate() ){
        statusRequest = StatusRequest.loading;
        update();
        var response = await editNameData.postData(nameController.text);
      statusRequest = handlingData(response);
        if(StatusRequest.sucsses == statusRequest){
         sharedPrefs.setString("name", nameController.text);
         Get.offNamedUntil(AppRoutes.profile, (route) => route.settings.name == AppRoutes.home,);  
  }
update();
      }}
}



}