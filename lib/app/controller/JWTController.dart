

import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rosses_mobile_master/route/app_pages.dart';
// import 'package:rosses_mobile_master/model/user/JWT.dart';
import 'package:rosses_mobile_master/app/view/auth/AuthCasesView.dart';
import 'package:rosses_mobile_master/app/view/auth/LoginView.dart';

class JwtController extends GetxController {
  var isLogged = false.obs;
  _check() {
    GetStorage().write('jwt', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NTAsImlhdCI6MTYwMzkyNDQ0OCwiZXhwIjoxNjA0MDEwODQ4fQ.LZkQw5fuNW2v4bpvuK-8xccEGEfYdnD2YWgB5D5sgIo');

    String jwtString = GetStorage().read('jwt');
     print('jwtString ${jwtString}');
    if(jwtString == null){
      return false;
    } else {
      var jwtArray = jwtString.split(".");
      var payload = json.decode(
          ascii.decode(base64.decode(base64.normalize(jwtArray[1]))));
      if (DateTime.fromMillisecondsSinceEpoch(payload["exp"] * 1000).isAfter(DateTime.now())) {
       return true;
      } else {
        return false;
      }
    }
  }


  @override
  void onInit() {
    ever(isLogged, fireRoute);
    isLogged.value =  _check();
    super.onInit();
  }
  fireRoute(logged){
    if(!logged) {
      Get.to(AuthCasesView());
    }
  }
}