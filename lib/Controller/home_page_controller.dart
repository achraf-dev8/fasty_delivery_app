

import 'package:fasty_delivery_app/Core/Classes/statuts_request.dart';
import 'package:fasty_delivery_app/Core/Functions/handlingrequest.dart';
import 'package:fasty_delivery_app/Data/DataSource/Remote/all_data.dart';
import 'package:fasty_delivery_app/Data/DataSource/Remote/home.dart';
import 'package:fasty_delivery_app/Data/DataSource/Remote/order.dart';
import 'package:fasty_delivery_app/Data/Model/order_model.dart';
import 'package:fasty_delivery_app/View/Widgets/Functions/dialogs.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController{

  OrderData orderData = OrderData(Get.find());
  StatusRequest statusRequest = StatusRequest.sucsses;
  HomeData homeData = HomeData(Get.find());


  delete(OrderModel order){
    AllData().ordersToShip.remove(order);
    update();
  }

    ship(OrderModel order){
    orderDialog("Are you sure you want to ship this order?", ()async{Get.back(); await shipConfirm(order);});
  }

        shipConfirm(OrderModel order) async{
          var response = await orderData.shipOrder(order.id!);
              statusRequest = StatusRequest.loading;
    update();
    statusRequest = handlingData(response);
        if(statusRequest == StatusRequest.sucsses){
      await getData();
     if(response["status"] == "fail"){
       
        Get.showSnackbar( const GetSnackBar(message: "Sorry, this order is already taken!", 
        duration:  Duration(milliseconds: 2700),));

          }

      }else{
        update();
      }
      }
    
      shipped(OrderModel order){
    orderDialog("Are you sure you shipped this order?", ()async{Get.back(); await shippedConfirm(order);});
  }

        shippedConfirm(OrderModel order) async{
          var response = await orderData.shippedOrder(order.id!, order.user!);
              statusRequest = StatusRequest.loading;
    update();
    statusRequest = handlingData(response);
        if(statusRequest == StatusRequest.sucsses){
          AllData().archivedOrders.add(order);
      await getData();
      }else{
        update();
      }
      }

        drop(OrderModel order){
    orderDialog("Are you sure you want to drop this order?", ()async{Get.back(); await dropConfrim(order);});
  }

        dropConfrim(OrderModel order) async{
          var response = await orderData.dropOrder(order.id!);
              statusRequest = StatusRequest.loading;
    update();
    statusRequest = handlingData(response);
        if(statusRequest == StatusRequest.sucsses){
      await getData();

      }else{
        update();
      }
      }


       getData() async{
      AllData().shippingOrders.clear();
      AllData().ordersToShip.clear();
    statusRequest = await homeData.getAllData(false);
     update();
  }


   reload() async{
    statusRequest = StatusRequest.loading;
    update();
    await getData();
  }
  }
  



