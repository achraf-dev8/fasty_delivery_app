

import 'package:fasty_delivery_app/Core/Classes/statuts_request.dart';
import 'package:fasty_delivery_app/Core/Constant/routes_names.dart';
import 'package:fasty_delivery_app/Core/Functions/checkinternet.dart';
import 'package:fasty_delivery_app/Core/Functions/handlingrequest.dart';
import 'package:fasty_delivery_app/Data/DataSource/Remote/all_data.dart';
import 'package:fasty_delivery_app/Data/DataSource/Remote/login.dart';
import 'package:fasty_delivery_app/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInController extends GetxController{ 
  LoginData logindata = LoginData(Get.find());
  GlobalKey <FormState> formKey = GlobalKey<FormState>();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool obscureText = true;
  bool wrongLoginInfo = false;
  StatusRequest statusRequest = StatusRequest.loading;

  @override
  void dispose() {
    passwordController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  updateStatusRequest() async{
    statusRequest = await checkInternetFull();
      update();
  }

  @override
    void onInit() async{
      await updateStatusRequest();
    super.onInit();
  }

  login() async{
wrongLoginInfo = false;
    if(formKey.currentState!.validate()){
      statusRequest = StatusRequest.loading;
      update();
      var response = await logindata.postData(phoneNumberController.text, passwordController.text);
      statusRequest = handlingData(response);
      if(StatusRequest.sucsses == statusRequest){
        if(response["status"] == "success"){
        AllData().restart();
        fetchUserData(response);
        await Get.offNamed(AppRoutes.home);
        }else{
          wrongLoginInfo = true;
        
        }
      
      }
    }
    update();
    
}

showHideText(){
  obscureText = !obscureText;
  update();
}


fetchUserData(response){
         var data = response["data"];
         sharedPrefs.setInt("id", data["id"]);
         sharedPrefs.setString("phone_number", data["phone_number"]);
         sharedPrefs.setString("password", data["password"]);
         sharedPrefs.setString("name", data["name"]);
}


}