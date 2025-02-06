


import 'package:fasty_delivery_app/Controller/signin_controller.dart';
import 'package:fasty_delivery_app/Core/Constant/colors.dart';
import 'package:fasty_delivery_app/Core/Constant/images.dart';
import 'package:fasty_delivery_app/Core/Functions/validator.dart';
import 'package:fasty_delivery_app/View/Screens/error/handling-request-view.dart';
import 'package:fasty_delivery_app/View/Widgets/Functions/appbars.dart';
import 'package:fasty_delivery_app/View/Widgets/Functions/buttons.dart';
import 'package:fasty_delivery_app/View/Widgets/Functions/paddings.dart';
import 'package:fasty_delivery_app/View/Widgets/Functions/text_feilds.dart';
import 'package:fasty_delivery_app/View/Widgets/Classes/textfeild.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Signin extends GetView<SignInController> {
    const Signin({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(SignInController());
    return GetBuilder<SignInController>(
      builder: (controller) {
        return Scaffold( 
          body:HandlingRequestView(update: ()async{await controller.updateStatusRequest();}, statusRequest: controller.statusRequest, widget: SafeArea(
            child: authPadding(
              Form(
                key : controller.formKey,
                child: ListView(children: [ welcomeBar(context, "Welcom Back"),
                const SizedBox(height: 35),
                  Image.asset(
                              AppImages.logo,
                              height: 112,
                              width: 112,
                            ), 
                            
                 const Text(textAlign: TextAlign.center, "Delivery App", style: TextStyle(color : AppColors.organgeYellow,
                 fontSize: 24),),
                            const SizedBox(height: 35,),
                            
                            phoneTextFeild(controller.phoneNumberController, null),
                      
                            passwordTextFeild("Password", controller.passwordController, false,
                            false, controller.obscureText, (){controller.showHideText();}),
                            GetBuilder<SignInController>( 
                              builder: (controller) => Visibility(visible: controller.wrongLoginInfo,
                                  child: const Column( crossAxisAlignment: CrossAxisAlignment.start,
                                    children : [
                                    SizedBox(height: 0),
                                    Text("Wrong phone number or password", style: TextStyle(color : AppColors.darkRed, fontSize : 14.5)),
                                    SizedBox(height: 16),
                                  ])
                                  )
                              
                            ),
                            SizedBox(height: 8),
                            nextButton(()async { 
                              await controller.login();
                              }, "Sign in"),
                            ],),
              ), 
                         
                          ),
          ),)
        );
      }
    );
  }

}