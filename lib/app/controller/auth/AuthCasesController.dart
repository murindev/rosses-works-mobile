import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rosses_mobile_master/model/user/Auth.dart';

class AuthCasesController extends GetxController {


  @override
  void onInit() {
    GetStorage().write('login', null);
    GetStorage().write('jwt', null);
    GetStorage().write('masterId', null);
    super.onInit();
  }


  @override
  void onReady() {
    GetStorage().write('jwt', null);
    super.onReady();
  }
}