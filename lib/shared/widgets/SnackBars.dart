import 'package:flutter/material.dart';
import 'package:get/get.dart';


snackBarError(title,text){
  return Get.snackbar(title,text,
      icon: Icon(Icons.warning_amber_rounded, color: Colors.red,),
      shouldIconPulse: true,
      barBlur: 10,
      isDismissible: true,colorText: Colors.black,
      backgroundColor: Colors.white,
      borderColor: Colors.black,
      borderWidth: 3,
      duration: Duration(seconds: 5));
}