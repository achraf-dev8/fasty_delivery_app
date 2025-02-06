

import 'package:fasty_delivery_app/Core/Classes/crud.dart';
import 'package:fasty_delivery_app/Core/Constant/apilinks.dart';

class ResetPassword{
  Crud crud;
  ResetPassword(this.crud);
  postData(String newPassword, int id) async{

    var response = await crud.postRequest(ApiLinks.resetPassword, {
      "new_password" : newPassword, "id" : id.toString()
    });

    return response;
  }
}