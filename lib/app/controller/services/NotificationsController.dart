import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:rosses_mobile_master/app/view/services/MessagesView.dart';
import 'package:rosses_mobile_master/route/app_pages.dart';

class NotificationsController extends GetxController {
  final message = ''.obs;
  var type = false.obs;

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();



  onSimpleNotify(data) async {
    var initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettingsIOs = IOSInitializationSettings();
    var initSettings = InitializationSettings(initializationSettingsAndroid, initializationSettingsIOs);

    flutterLocalNotificationsPlugin.initialize(initSettings, onSelectNotification: onSelectNotification);

    var android = new AndroidNotificationDetails('id', 'channel ', 'description', priority: Priority.High, importance: Importance.Max);
    var iOS = new IOSNotificationDetails();
    var platform = new NotificationDetails(android, iOS);


    message.value = data['message'];
    update();

    await flutterLocalNotificationsPlugin.show(0, 'ROS SES', 'Уведомление', platform, payload: data['message']);
  }

  onPrivateSimplyNotify(data) async {
    var initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettingsIOs = IOSInitializationSettings();
    var initSettings = InitializationSettings(initializationSettingsAndroid, initializationSettingsIOs);

    flutterLocalNotificationsPlugin.initialize(
        initSettings,
        onSelectNotification: onSelectNotification
    );

    var android = new AndroidNotificationDetails('id', 'channel ', 'description', priority: Priority.High, importance: Importance.Max);
    var iOS = new IOSNotificationDetails();
    var platform = new NotificationDetails(android, iOS);

    message.value = data['message'];
    type.value = data['type'] ?? true;

    update();

    await flutterLocalNotificationsPlugin.show(2, 'ROS SES', 'Уведомление', platform, payload: data['message']);
  }




  Future<void> onSelectNotification(String payload) async {
    // message.update(payload);
    await Get.toNamed(Routes.NOTIFICATION_MESSAGE);
  }

}
