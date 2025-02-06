


import 'package:fasty_delivery_app/Core/Constant/colors.dart';
import 'package:fasty_delivery_app/Core/Constant/routes_names.dart';
import 'package:fasty_delivery_app/Data/Model/order_model.dart';
import 'package:fasty_delivery_app/View/Widgets/Functions/buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class OrderCard extends StatelessWidget {
  final OrderModel order;
  final void Function(OrderModel) delete;
  final void Function(OrderModel) drop;
  final void Function(OrderModel) ship;
  final void Function(OrderModel) shipped;
  const OrderCard({super.key, required this.order, required this.delete, required this.drop, required this.ship,
  required this.shipped
  });
  @override
  Widget build(BuildContext context) {
    return Card(
        color: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 3,
        child: InkWell(
          overlayColor: WidgetStateProperty.all<Color>(AppColors.buttonSplash),
          borderRadius: BorderRadius.circular(10),
          onTap: (){Get.toNamed(AppRoutes.orderDetails, arguments: order.id!);},
          child: Expanded(
            child:  SizedBox(
              width: 290,
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.2, right: 8.2, top: 12),
                    child: Row(
                      children: [
                        Text("Order Number #${order.id}", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17.25),),
                        const Spacer(),
                        Text(Jiffy.parse(order.date!).fromNow(), style: const TextStyle(fontSize: 16.25, color: AppColors.darkGrey)),
                      ],
                    ),
                  ),
                  const Divider(color: AppColors.softGrey,), Padding(
                    padding: const  EdgeInsets.only(left: 8.2, right: 8.2, bottom: 12),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [ 
                      Text("Adress : ${order.address}", 
                      style: const TextStyle(fontSize: 20),),
                     Text("Order Price : ${order.price}\$", style: const TextStyle(fontSize: 20)),
                     Text("Shipping Price : ${order.deliveryPrice}\$", style: const TextStyle(fontSize: 20),),
                     Text("Payement Method : ${order.payementMethod}", style: const TextStyle(fontSize: 20),),
                     Text("Delivery Time : ${order.deliveryTime}", style: const TextStyle(fontSize: 20),),
                     const SizedBox(height: 10,), order.state == 1 ?
                     Row(children: [orderButton(AppColors.blue, "Ship", (){ship(order);}) ,
                     const SizedBox(width: 5,),
                     orderButton(AppColors.lightRed, "Delete", (){delete(order);}) ,
                     ],)
                     
                     
                     : order.state == 2 ? Row(children: [orderButton(AppColors.organgeYellow, "Shipped", (){shipped(order);}) ,
                     const SizedBox(width: 5,), orderButton(AppColors.lightRed, "Drop", (){drop(order);}) ,
                     ],) : const SizedBox(),
                    ],),
                  )
                ],
              ),
            ),
          ),
        ),
      );
  }



}