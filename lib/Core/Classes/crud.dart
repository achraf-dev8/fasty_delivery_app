import 'dart:async';

import 'package:fasty_delivery_app/Core/Classes/statuts_request.dart';
import 'package:fasty_delivery_app/Core/Functions/checkinternet.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

      final String basicAuth = 'Basic ${base64Encode(utf8.encode(
        'achraf:achraf08/'))}';

    Map<String, String> myheaders = {
          'authorization': basicAuth
        };

class Crud{
    postRequest(String url, Map data) async{

          if(await checkInternet()){
      try{
       var response = await http.post(Uri.parse(url), body : data, headers: myheaders).timeout(const Duration(seconds: 6));
      if(response.statusCode == 200 || response.statusCode == 201){
        
        var responseBody = jsonDecode(response.body);
        return responseBody;
      }else{
  
  //Get.defaultDialog(title :response.body);
        return StatusRequest.serverfailure;
      }
    } on TimeoutException {
      
        return StatusRequest.serverfailure;
      } 
    catch(e){
      var response = await http.post(Uri.parse(url), body : data).timeout(const Duration(seconds: 6));
     // Get.defaultDialog(title : response.body.toString());
      return StatusRequest.serverfailure;
      }
      }else{
      //  Get.defaultDialog(title : 'internet'.toString());
        return StatusRequest.offlinefailure;
      }
}}
