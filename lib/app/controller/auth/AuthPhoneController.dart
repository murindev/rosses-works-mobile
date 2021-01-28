import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rosses_mobile_master/model/user/Auth.dart';

class AuthPhoneController extends GetxController{

  var phone = Auth().phone.obs;
  var jwt = Auth().jwt.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }




}