



import 'package:fasty_delivery_app/Core/Classes/crud.dart';
import 'package:fasty_delivery_app/Core/Constant/apilinks.dart';

class LoginData{
  Crud crud;
  LoginData(this.crud);
  postData(String phoneNumber, String password) async{
    var response = await crud.postRequest(ApiLinks.loginLink, {
      "phone_number" : phoneNumber, "password":password
    });

    return response;
  }
}