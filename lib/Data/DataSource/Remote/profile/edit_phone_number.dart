




import 'package:fasty_delivery_app/Core/Classes/crud.dart';
import 'package:fasty_delivery_app/Core/Constant/apilinks.dart';
import 'package:fasty_delivery_app/main.dart';

class EditPhoneNumberData{
  Crud crud;
  EditPhoneNumberData(this.crud);
  postData(String phoneNumber) async{

    var response = await crud.postRequest(ApiLinks.editPhoneNumberLink, {
    "id" : sharedPrefs.getInt("id").toString(),
    "phone_number" : phoneNumber,
    });

    return response;
  }
}