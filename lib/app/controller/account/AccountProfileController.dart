import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rosses_mobile_master/shared/settings.dart';
import 'package:rosses_mobile_master/app/repo/AccountProfileRepo.dart';
import 'package:rosses_mobile_master/model/account/AccountProfile.dart';
import 'package:rosses_mobile_master/route/app_pages.dart';
import 'package:rosses_mobile_master/shared/widgets/SnackBars.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class AccountProfileController extends GetxController {
  final accountProfile = AccountProfile().obs;
  final headerText = 'Редактирование'.obs;
  final photo = ''.obs;
  var newDate = ''.obs;

  AccountProfileApi accountProfileApi = AccountProfileApi();

  checkGeo() async {
    final gg = await Geolocator.getCurrentPosition();
    print('Geolocator ${gg}');


/*
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();


    var initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettingsIOs = IOSInitializationSettings();
    var initSetttings = InitializationSettings(initializationSettingsAndroid, initializationSettingsIOs);

    flutterLocalNotificationsPlugin.initialize(initSetttings,
        // onSelectNotification: onSelectNotification
    );


    var android = new AndroidNotificationDetails(
        'id', 'channel ', 'description',
        priority: Priority.High, importance: Importance.Max);
    var iOS = new IOSNotificationDetails();
    var platform = new NotificationDetails(android, iOS);
    await flutterLocalNotificationsPlugin.show(
        3000, 'Flutter devs', 'Flutter Local Notification Demo', platform,
        payload: 'Welcome to the Local Notification demo ');

    */

  }



  getProfile() async {
    Get.dialog(Center(child: CircularProgressIndicator()), barrierDismissible: false);
    await accountProfileApi
        .getProfile()
        .then((value) => {
              accountProfile(AccountProfile.fromJson(value)),
            })
        .then((value) => Get.back());
  }

  @override
  onReady() async {
    await getProfile();
    // GetStorage().write('masterId', accountProfile.value.crmId);
    super.onReady();
  }

  onTextFormEditing(val) {}

  void onTextFormSubmit(field, val) async {
    await accountProfileApi
        .putProfileFields(json.encode({field: val}))
        .then((value) => {
              if (value == 200) {getProfile()} else {snackBarError('Ошибка', 'Что то пошло не так, попробуйте повторить позднее')}
            })
        .then((value) => {Get.back()});
  }

  void onAgreementCheck(field, val) async {
    await accountProfileApi.putProfileFields(json.encode({field: val})).then((value) => {
          if (value == 200)
            {
              GetStorage().write('agreement', true),
              accountProfile.value.agreement = 1,
              accountProfile.update(accountProfile),
            }
          else
            {snackBarError('Ошибка', 'Что то пошло не так, попробуйте повторить позднее')}
        });
  }

  void onDatePickerUpdate(date) {
    List datePickedList = date.toString().split(' ');
    newDate.value = datePickedList[0];
    update();
  }

  void fieldsAdd(data) async {
    await accountProfileApi
        .postProfileFields(data)
        .then((value) => {
              if (value == 200) {getProfile()} else {snackBarError('Ошибка', 'Что то пошло не так, попробуйте повторить позднее')}
            })
        .then((value) => Get.back());
  }

  void fieldsEdit(data) async {
    await accountProfileApi
        .putProfileFields(data)
        .then((value) => {
              if (value == 200) {getProfile()} else {snackBarError('Ошибка', 'Что то пошло не так, попробуйте повторить позднее')}
            })
        .then((value) => Get.back());
  }

  void fieldsDelete(data, field) async {
    await accountProfileApi
        .postProfileFieldRemove(data, field)
        .then((value) => {
              if (value == 200) {getProfile()} else {snackBarError('Ошибка', 'Что то пошло не так, попробуйте повторить позднее')}
            })
        .then((value) => Get.back());
  }

  void onAgreementSubmit(data) async {
    if (await GetStorage().read('profileSubmitted') == null) {
      await accountProfileApi
          .profileSubmit(data)
          .then((value) => {
                if (value == 200) {GetStorage().write('profileSubmitted', true), getProfile()} else {snackBarError('Ошибка', 'Что то пошло не так, попробуйте повторить позднее')}
              })
          .then((value) => Get.offAllNamed(Routes.ACCOUNT_HOME));
    } else {
      await accountProfileApi.profileSubmitUpdate().then((value) => {
        if (value == 200) {
          snackBarError('Успех', 'Профиль успешно обновлен')
        } else {snackBarError('Ошибка', 'Что то пошло не так, попробуйте повторить позднее')}
      });
    }
  }

  void onPhotoReceive() async {
    final response = await http.head('$ROOT/storage/avatars/${GetStorage().read('id')}.jpeg');
    if (response.statusCode == 200) {
      photo.value = '$ROOT/storage/avatars/${GetStorage().read('id')}.jpeg';
    } else {
      photo.value = '$ROOT/storage/avatars/camera.png';
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    accountProfile.close();
    super.onClose();
  }
}
