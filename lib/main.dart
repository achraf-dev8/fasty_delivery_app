

import 'package:fasty_delivery_app/Core/Constant/colors.dart';
import 'package:fasty_delivery_app/bindings.dart';
import 'package:fasty_delivery_app/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';

late SharedPreferences sharedPrefs;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPrefs =  await SharedPreferences. getInstance();
    SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
        debugShowCheckedModeBanner: false,
      initialBinding: InitBinding(),
      theme: ThemeData(
        canvasColor: Colors.white,
            bottomNavigationBarTheme: const BottomNavigationBarThemeData( 
      backgroundColor: Colors.white,
    ),
        textTheme: const TextTheme(headlineLarge: TextStyle(color: AppColors.black, fontSize: 25, fontWeight: FontWeight.bold)),
        fontFamily: 'Roadgeek',
        scaffoldBackgroundColor: Colors.white),
      getPages: routes,
    );
  }
}
