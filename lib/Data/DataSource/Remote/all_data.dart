




import 'package:fasty_delivery_app/Data/Model/order_model.dart';

class AllData {
  static final data = AllData._internal();

  factory AllData() {
    return data;
  }

  AllData._internal();

  List<OrderModel> shippingOrders = [];
  List<OrderModel> ordersToShip = [];
  List<OrderModel> archivedOrders = [];

  

  void restart(){
    
   shippingOrders = [];
  ordersToShip = [];
  archivedOrders = [];

  }


}