import 'package:flutter/material.dart';
import 'package:flutter_pusher_client/flutter_pusher.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:laravel_echo/laravel_echo.dart';
import 'package:rosses_mobile_master/model/user/JWT.dart';
import 'package:rosses_mobile_master/route/app_pages.dart';

class MiddleWare extends GetxController {
  static observer(Routing routing) {
    if (!Jwt.isAuthorized &&
        Get.routing.current != '/auth_cases' &&
        Get.routing.current != '/login' &&
        Get.routing.current != '/auth_phone' &&
        Get.routing.current != '/auth_register' &&
        Get.routing.current != '/user_agreement') {
      // Get.offNamed(Routes.AUTH_CASES);
    }
/*

    PusherOptions options = PusherOptions(
        host: '194.87.232.56',
        port: 6002,
        encrypted: false,
        cluster: 'mt1',
        auth: PusherAuth('http://194.87.232.56/broadcasting/auth',
            headers: {'Authorization': 'Bearer ${GetStorage().read('jwt')}'})

    );

    FlutterPusher pusher = FlutterPusher('2070', options, enableLogging: true);

   Echo echo = new Echo({
      'broadcaster': 'pusher',
      'client': pusher,
      "wsHost": '194.87.232.56',
      "httpHost": '194.87.232.56',
      "wsPort": 6002,
      'auth': {
        "headers": {'Authorization': 'Bearer ${GetStorage().read('jwt')}'}
      },
      'authEndpoint': 'http://194.87.232.56/broadcasting/auth',
      "disableStats": true,
      "forceTLS": false,
      "enabledTransports": ['ws']
    });

    echo.channel('chatbox').listen('MessageSend', (e) {
       print('chatbox chatbox chatbox ${e}');
    });
    
    
    echo.private('App.User.${GetStorage().read('id')}')
        .listen('PrivateEvent', (e){
           print('PrivateEvent PrivateEvent ${e}');
    });


*/

  }
}
