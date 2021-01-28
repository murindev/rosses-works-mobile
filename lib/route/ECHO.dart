import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pusher_client/flutter_pusher.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:laravel_echo/laravel_echo.dart';
import 'package:rosses_mobile_master/app/controller/services/NotificationsController.dart';
import 'package:rosses_mobile_master/shared/settings.dart';

NotificationsController notificationsController = Get.put(NotificationsController());

Future<void> initPlatformState() async {
  String platformVersion;

  try {
    PusherOptions options =
        PusherOptions(host: IP, port: 6002, encrypted: false, cluster: 'mt1', auth: PusherAuth('http://$IP/broadcasting/auth', headers: {'Authorization': 'Bearer ${GetStorage().read('jwt')}'}));

    FlutterPusher pusher = FlutterPusher('2070', options, enableLogging: true);

    Echo echo = new Echo({
      'broadcaster': 'pusher',
      'client': pusher,
      "wsHost": IP,
      "httpHost": IP,
      "wsPort": 6002,
      'auth': {
        "headers": {'Authorization': 'Bearer ${GetStorage().read('jwt')}'}
      },
      'authEndpoint': 'http://$IP/broadcasting/auth',
      "disableStats": true,
      "forceTLS": false,
      "enabledTransports": ['ws']
    });

    echo.channel('message').listen('MessageSend', (e) {
      print('*******mobileMessage ${e}');
      notificationsController.onSimpleNotify(e);
    });

    echo.private('App.User.${GetStorage().read('id')}').listen('PrivateEvent', (e) {
      print('******* App.User. ${e}');
      notificationsController.onPrivateSimplyNotify(e);
    }).listen('ChangeUserAttributesEvent', (e) {
      print('******* ChangeUserAttributesEvent ${e}');

      GetStorage().write('active', e['attributes']['active']);
      GetStorage().write('name', e['attributes']['name']);
      GetStorage().write('surname', e['attributes']['surname']);
      GetStorage().write('email', e['attributes']['email']);
      GetStorage().write('avatar', e['attributes']['avatar']);
      GetStorage().write('phone', e['attributes']['phone']);
      GetStorage().write('salary', e['attributes']['salary']);
      GetStorage().write('percent', e['attributes']['percent']);
      GetStorage().write('percent_limit', e['attributes']['percent_limit']);
      GetStorage().write('banned', e['attributes']['banned']);
      GetStorage().write('role_id', e['attributes']['role']['id']);
      GetStorage().write('role_name', e['attributes']['role']['name']);
      GetStorage().write('rank_id', e['attributes']['rank']['id']);
      GetStorage().write('rank_name', e['attributes']['rank']['name']);
      GetStorage().write('master_id', e['attributes']['crm_id']);


      notificationsController.onPrivateSimplyNotify({"message":"У Вас поменялся статус","type": true});

    });
  } on PlatformException {
    print('******* PlatformException ${PlatformException}');
  }
}

class ECHO extends GetxController {
  static observer(Routing routing) async {
    await initPlatformState();
  }
}
