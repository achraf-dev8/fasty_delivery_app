


import 'package:fasty_delivery_app/Core/Classes/crud.dart';
import 'package:fasty_delivery_app/Core/Classes/statuts_request.dart';
import 'package:fasty_delivery_app/Core/Constant/apilinks.dart';
import 'package:fasty_delivery_app/Core/Functions/handlingrequest.dart';
import 'package:fasty_delivery_app/Data/DataSource/Remote/all_data.dart';
import 'package:fasty_delivery_app/Data/Model/order_model.dart';
import 'package:fasty_delivery_app/main.dart';

class HomeData{
  Crud crud;
  HomeData(this.crud);
 Future<StatusRequest> getAllData(bool firstOpen) async{

    var response = await crud.postRequest(ApiLinks.allDataLink, {"id" : sharedPrefs.getInt("id").toString()});
    StatusRequest statusRequest = handlingData(response);
    
    if(StatusRequest.sucsses == statusRequest){
      for(int i=0; i<response["orders_to_ship"].length ; i++){
        AllData().ordersToShip.add(OrderModel.fromJson(response["orders_to_ship"][i]));
      }

      for(int i=0; i<response["shipping_orders"].length ; i++){
        AllData().shippingOrders.add(OrderModel.fromJson(response["shipping_orders"][i]));
      }

      if(firstOpen){
        for(int i=0; i<response["archived_orders"].length ; i++){
        AllData().archivedOrders.insert(0, OrderModel.fromJson(response["archived_orders"][i]));
      }
      }

      }

      return statusRequest;
  }
}
