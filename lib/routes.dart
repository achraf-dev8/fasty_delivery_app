
import 'package:fasty_delivery_app/Core/Constant/routes_names.dart';
import 'package:fasty_delivery_app/View/Screens/order_details.dart';
import 'package:fasty_delivery_app/View/Screens/profile/change_password.dart';
import 'package:fasty_delivery_app/View/Screens/profile/edit_name.dart';
import 'package:fasty_delivery_app/View/Screens/archived_orders.dart';
import 'package:fasty_delivery_app/View/Screens/home.dart';
import 'package:fasty_delivery_app/View/Screens/profile/edit_phone_number.dart';
import 'package:fasty_delivery_app/View/Screens/profile/profile.dart';
import 'package:fasty_delivery_app/View/Screens/signin.dart';
import 'package:fasty_delivery_app/middleware.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: "/", page: () => const Signin(), middlewares: [
    MiddleWare()
  ]),
        GetPage(name: AppRoutes.login, page: () =>  const Signin()),

        GetPage(name: AppRoutes.home, page: () => const Home()),
        GetPage(name: AppRoutes.orderDetails, page: () => const OrderDetails(), transition: Transition.rightToLeft),


        GetPage(name: AppRoutes.profile, page: () => const Profile(), transition: Transition.rightToLeft),
      GetPage(name: AppRoutes.changeName, page: () => const EditName(), transition: Transition.rightToLeft),
      GetPage(name: AppRoutes.changePhoneNumber, page: () => const EditPhoneNumber(), transition: Transition.rightToLeft),
       GetPage(name: AppRoutes.changePassword, page: () => const ChangePassword(), transition: Transition.rightToLeft),
        GetPage(name: AppRoutes.archivedOrders, page: () => const ArchivedOrders(), transition: Transition.rightToLeft),
        
];
  

