


import 'package:fasty_delivery_app/Controller/home_page_controller.dart';
import 'package:fasty_delivery_app/Core/Constant/colors.dart';
import 'package:fasty_delivery_app/Data/DataSource/Remote/all_data.dart';
import 'package:fasty_delivery_app/View/Screens/error/handling-request-view.dart';
import 'package:fasty_delivery_app/View/Widgets/Classes/order_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomePageController> {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => HomePageController());
    return  RefreshIndicator(
      color: AppColors.blue,
      strokeWidth: 3,
      onRefresh: () async{
         await controller.reload();},
      child: GetBuilder<HomePageController>(
        builder: (controller) =>  HandlingRequestView( statusRequest: controller.statusRequest, 

        update: (){controller.getData();}, widget: AllData().ordersToShip.isNotEmpty || AllData().shippingOrders.isNotEmpty ?
          Padding( 
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView(children: [
                  const SizedBox(height: 10,),
              Visibility( visible: AllData().shippingOrders.isNotEmpty,
                child: const Text("Shipping order", style: 
                TextStyle(color: AppColors.darkGrey, fontWeight: FontWeight.bold, fontSize: 20),),
              ),
                  ListView.builder(physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: AllData().shippingOrders.length,
                    itemBuilder: (context, i) => OrderCard(order: AllData().shippingOrders[i], delete: (val){},
                    ship: (val){}, shipped: (val){controller.shipped(val);}, drop: (val){controller.drop(val);}, 
                    ),),
                    
            const SizedBox(height: 12,),
               Visibility( visible: AllData().ordersToShip.isNotEmpty,
                 child: const Text("Orders to ship", style: 
                       TextStyle(color: AppColors.darkGrey, fontWeight: FontWeight.bold, fontSize: 20),),
               ),
                
                  ListView.builder(physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: AllData().ordersToShip.length,
                    itemBuilder: (context, i) => OrderCard(order: AllData().ordersToShip[i], delete: (val){controller.delete(val);},
                    ship: (val){controller.ship(val);}, shipped: (val){}, drop: (val){}, 
                    ),), const SizedBox(height: 20,)
                ],),
          ) :  ListView(
            children:const [  
              SizedBox(height: 335,),
               Text("No current orders!", style: 
                    TextStyle(color: AppColors.darkGrey, fontWeight: FontWeight.bold, fontSize: 25),
                     textAlign: TextAlign.center,),]

            
          ),
        ),),
    );
  }

}