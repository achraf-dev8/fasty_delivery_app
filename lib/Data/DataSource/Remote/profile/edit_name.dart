


import 'package:fasty_delivery_app/Core/Classes/crud.dart';
import 'package:fasty_delivery_app/Core/Constant/apilinks.dart';
import 'package:fasty_delivery_app/main.dart';

class EditNameData{
  Crud crud;
  EditNameData(this.crud);
  postData(String name) async{
    
    var response = await crud.postRequest(ApiLinks.editNameLink, {
    "id" : sharedPrefs.getInt("id").toString(),
    "name" : name,
    });

    return response;
  }
}