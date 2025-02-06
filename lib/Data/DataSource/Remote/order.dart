

import 'package:fasty_delivery_app/Core/Classes/crud.dart';
import 'package:fasty_delivery_app/Core/Constant/apilinks.dart';
import 'package:fasty_delivery_app/main.dart';

class OrderData{
  Crud crud;
  OrderData(this.crud);

  dropOrder(int id) async{
    return await crud.postRequest(ApiLinks.ordersLink, {
    "id" : id.toString(),
    });
  }

  shipOrder(int id) async{
  return await crud.postRequest(ApiLinks.shipLink, {
    "id" : id.toString(), "delivery" : sharedPrefs.getInt("id").toString(),
  });
}

  shippedOrder(int id, int user) async{
      return await crud.postRequest(ApiLinks.shippedLink, {
    "id" : id.toString(), "user" : user.toString()
    });
}

}