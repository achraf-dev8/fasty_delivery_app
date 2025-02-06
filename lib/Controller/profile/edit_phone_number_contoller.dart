
import 'package:fasty_delivery_app/Core/Classes/statuts_request.dart';
import 'package:fasty_delivery_app/Core/Constant/routes_names.dart';
import 'package:fasty_delivery_app/Core/Functions/checkinternet.dart';
import 'package:fasty_delivery_app/Core/Functions/handlingrequest.dart';
import 'package:fasty_delivery_app/Data/DataSource/Remote/profile/edit_phone_number.dart';
import 'package:fasty_delivery_app/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditPhoneNumberContoller extends GetxController{
  EditPhoneNumberData editPhoneNumberData = EditPhoneNumberData(Get.find());
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController phoneNumberController = TextEditingController(text: sharedPrefs.getString("phone_number"));
  StatusRequest statusRequest = StatusRequest.sucsses;
  String? loginExists;
  

  @override
  void dispose() {
   // phoneNumberController.dispose();
    super.dispose();
  }
    updateStatusRequest() async{
    statusRequest = await checkInternetFull();
      update();
  }
  
save() async{
  loginExists = null;
  update();
 await Future.delayed(const Duration(milliseconds: 500), () {});
       
      if(formKey.currentState!.validate() ){
        statusRequest = StatusRequest.loading;
        update();
        var response = await editPhoneNumberData.postData(phoneNumberController.text);
      statusRequest = handlingData(response);
        if(StatusRequest.sucsses == statusRequest){
       if(response["status"] == "success"){
        try{
          
        sharedPrefs.setString("phone_number", phoneNumberController.text);
         Get.offNamedUntil(AppRoutes.profile, (route) => route.settings.name == AppRoutes.home,);  
         }catch(e){
          Get.defaultDialog(title: e.toString());
         } 
        }else{
          loginExists = "This phone number is already used";
          update();
          await Future.delayed(const Duration(milliseconds: 100), () {
    formKey.currentState!.validate();
  });
        }

  }else{
    update();
  }

      }
}



}