

import 'package:fasty_delivery_app/View/Widgets/Functions/buttons.dart';
import 'package:flutter/material.dart';

Widget welcomeBar(BuildContext context, String text){
  return Container(
    alignment: Alignment.centerLeft,
    child: Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Text(text, style : Theme.of(context).textTheme.headlineLarge),
    ),
  )  
  ;
}


Widget textBackButtonAppBar(BuildContext context, String text){
     return Row(
       children: [
        backIconButton(21, 40),
        const SizedBox(width:12) , Text(text, style : Theme.of(context).textTheme.headlineLarge),
       ],
     );

     
}