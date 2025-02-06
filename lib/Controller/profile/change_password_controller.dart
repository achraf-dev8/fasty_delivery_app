
import 'package:fasty_delivery_app/Core/Classes/statuts_request.dart';
import 'package:fasty_delivery_app/Core/Constant/routes_names.dart';
import 'package:fasty_delivery_app/Core/Functions/checkinternet.dart';
import 'package:fasty_delivery_app/Core/Functions/handlingrequest.dart';
import 'package:fasty_delivery_app/Data/DataSource/Remote/profile/reset_password.dart';
import 'package:fasty_delivery_app/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController{
  ResetPassword resendPasswordTwoData = ResetPassword(Get.find());
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool passwordObscureText = true;
  bool newPasswordObscureText = true;
  bool confirmObscureText = true;
  StatusRequest statusRequest = StatusRequest.sucsses;
  bool wrongConfirmation = false;
    
      @override
  void dispose() {
    passwordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
    updateStatusRequest() async{
    statusRequest = await checkInternetFull();
      update();
  }

  
nextStep() async{
  
  wrongConfirmation = !(newPasswordController.text == confirmPasswordController.text);
  update();
    if(formKey.currentState!.validate()){
      statusRequest = StatusRequest.loading;
      update();
      var response = await resendPasswordTwoData.postData(newPasswordController.text, sharedPrefs.getInt("id")!);
      statusRequest = handlingData(response);
      
      if(StatusRequest.sucsses == statusRequest){
        sharedPrefs.setString("password", newPasswordController.text);       
        Get.offNamedUntil(AppRoutes.profile, (route) => route.settings.name == AppRoutes.home,); 
  }else{
    update();
  }}}

  passwordShowHideText(){
  passwordObscureText = !passwordObscureText;
  update();

}
  newPasswordShowHideText(){
  newPasswordObscureText = !newPasswordObscureText;
  update();
}
confrimShowHideText(){
  confirmObscureText = !confirmObscureText;
  update();
}
}

