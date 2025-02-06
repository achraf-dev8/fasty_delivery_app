


import 'package:fasty_delivery_app/Data/DataSource/Remote/all_data.dart';
import 'package:fasty_delivery_app/View/Widgets/Functions/appbars.dart';
import 'package:fasty_delivery_app/View/Widgets/Functions/paddings.dart';
import 'package:fasty_delivery_app/View/Widgets/Classes/order_card.dart';
import 'package:flutter/material.dart';


class ArchivedOrders extends StatelessWidget {
  const ArchivedOrders({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: 
                 ListView(children: [
                  authPadding(textBackButtonAppBar(context, "Archived Orders")),
                  const SizedBox(height: 15,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: ListView.builder(physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: AllData().archivedOrders.length,
                      itemBuilder: (context, i) => OrderCard(order: AllData().archivedOrders[i], delete: (val){}, drop: (val){}, 
                      ship: (val){}, shipped: (val){}, 
                      ),),
                  ), const SizedBox(height: 20,)
                ],)
        ),
    ); 
    }
}
