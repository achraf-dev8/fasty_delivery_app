

class ApiLinks{
   //static const String server = "http://10.0.2.2/fasty";

   static const String server = "http://172.20.10.5/fasty";

   static const String delivery = "$server/delivery";

   static const String loginLink = "$delivery/login.php";

   static const String allDataLink = "$delivery/alldata.php";

  static const String orderDetailsLink = "$server/orders/order_details.php";


   static const String ordersLink = "$delivery/orders";

   static const String shippedLink = "$ordersLink/shipped_order.php";

   static const String shipLink = "$ordersLink/ship_order.php";

   static const String dropLink = "$ordersLink/drop_order.php";


  static const String profileLink = "$delivery/profile";

  static const String editNameLink = "$profileLink/edit_name.php";

  static const String editPhoneNumberLink = "$profileLink/edit_phone_number.php";

  static const String resetPassword = "$profileLink/reset_password.php";
  
  
   static const String upload = "$server/upload";

   static const String offersUploadLink = "$upload/offers";

   static const String itemsUploadLink = "$upload/items";

}