import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';
import 'package:rosses_mobile_master/app/repo/AuthRepo.dart';
import 'package:rosses_mobile_master/model/user/Auth.dart';
import 'package:rosses_mobile_master/model/user/JWT.dart';
import 'package:rosses_mobile_master/route/app_pages.dart';
import 'package:rosses_mobile_master/shared/widgets/SnackBars.dart';

class AuthController extends GetxController {
  final AuthRepo authRepo = AuthRepo();
  var auth = Auth().obs;

  // phone
  final phoneValidate = false.obs;

  // code
  final code = ''.obs;
  final codeValidate = false.obs;

  // register / login
  final phone = ''.obs;
  final login = ''.obs;
  final name = ''.obs;
  final surname = ''.obs;
  final nameValidate = false.obs;
  final surnameValidate = false.obs;
  final loginValidate = false.obs;
  final pass = ''.obs;
  final passValidate = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  // phone
  void onPhoneInputChange(phone) {
    auth.update((auth) => auth.phone = phone);
    phoneValidate.value = phone.length == 18;
    update();
  }

  void onPhoneInputSubmit() {
    authRepo.sendPhoneNumber(auth().phone).then((req) => {
          if (req == 200) {GetStorage().write('phone', auth().phone.replaceAll(RegExp(r"[^0-9]+"), '')), Get.toNamed('/auth_code')}
        });
  }

  // code

  void onCodeInputChange(codeDigits) {
    codeValidate.value = codeDigits.length == 4;
    code.value = codeDigits;
    update();
  }

  void onCodeSubmitChange() async {
    authRepo.sendCodeNumber({"code": code.value, "phone": await GetStorage().read('phone')}).then((req) => {
          if (req == 200)
            {Get.toNamed('/auth_register')}
          else if (req.statusCode == 206)
            {
              name.value = json.decode(req.body)['user']['name'],
              surname.value = json.decode(req.body)['user']['surname'],
              login.value = json.decode(req.body)['user']['email'],
              phone.value = json.decode(req.body)['user']['phone'],
              update(),
              Get.toNamed(Routes.AUTH_PASS_UPDATE)
            }
          else
            {snackBarError('Ошибка', 'Попробуйте еще раз')}
        });
  }

  // register

  void onLoginInputChange(email) {
    loginValidate.value = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
    login.value = email;
    update();
  }

  void onNameInputChange(str) {
    nameValidate.value = RegExp(r"^[a-zA-Zа-яА-Я ]*$").hasMatch(str);
    name.value = str;
    update();
  }

  void onSurnameInputChange(str) {
    surnameValidate.value = RegExp(r"^[a-zA-Zа-яА-Я ]*$").hasMatch(str);
    surname.value = str;
    update();
  }

  void onPassInputChange(passString) {
    passValidate.value = passString.length >= 6;
    pass.value = passString;
    update();
  }

  void onRegisterSubmit() async {
    authRepo.sendRegisterData({'name': name.value, 'surname': surname.value, 'email': login.value, 'password': pass.value, 'phone': GetStorage().read('phone')}).then((response) => {
          if (response.statusCode >= 200 && response.statusCode <= 204)
            {
              // GetStorage().write('name', name.value),
              // GetStorage().write('surname', surname.value),
              // GetStorage().write('login', login.value),
              // GetStorage().write('jwt', response.body),
              Get.toNamed(Routes.LOGIN)
            }
          else
            {print('onRegisterSubmit error')}
        });
  }

  void onPassUpdateSubmit() async {
    authRepo.sendPassUpdateData({'password': pass.value, 'phone': GetStorage().read('phone')}).then((response) => {
          if (response.statusCode >= 200 && response.statusCode <= 204) {Get.toNamed(Routes.LOGIN)} else {print('onRegisterSubmit error')}
        });
  }

  // login

  void onLogin() {
    authRepo.login({'email': login.value, 'password': pass.value}).then((response) => {
          if (response == 999)
            {snackBarError('Нет связи', 'Убедитесь что вы подключены к интернету')}
          else if (response.statusCode >= 200 && response.statusCode <= 204)
            {
              GetStorage().write('jwt', json.decode(response.body)['access_token']),
              GetStorage().write('id', json.decode(response.body)['user']['id']),
              GetStorage().write('active', json.decode(response.body)['user']['active']),
              GetStorage().write('name', json.decode(response.body)['user']['name']),
              GetStorage().write('surname', json.decode(response.body)['user']['surname']),
              GetStorage().write('email', json.decode(response.body)['user']['email']),
              GetStorage().write('avatar', json.decode(response.body)['user']['avatar']),
              GetStorage().write('phone', json.decode(response.body)['user']['phone']),
              GetStorage().write('salary', json.decode(response.body)['user']['salary']),
              GetStorage().write('percent', json.decode(response.body)['user']['percent']),
              GetStorage().write('percent_limit', json.decode(response.body)['user']['percent_limit']),
              GetStorage().write('banned', json.decode(response.body)['user']['banned']),
              GetStorage().write('role_id', json.decode(response.body)['user']['role']['id']),
              GetStorage().write('role_name', json.decode(response.body)['user']['role']['name']),
              GetStorage().write('rank_id', json.decode(response.body)['user']['rank']['id']),
              GetStorage().write('rank_name', json.decode(response.body)['user']['rank']['name']),
              GetStorage().write('master_id', json.decode(response.body)['user']['crm_id']),
              GetStorage().read('agreement') ?? GetStorage().write('agreement',false),


              Get.offNamed(Routes.ACCOUNT_HOME)
            }
          else if (response.statusCode == 401)
            {snackBarError('Ошибка', 'Неправильный Логин или Пароль')}
          else
            {print('onRegisterSubmit error ${response.statusCode}')}
        });
  }

  void onReady() {
    // called after the widget is rendered on screen
    super.onReady();
  }

  void onLogout() async {
    await GetStorage().write('jwt', null);
    Get.offAllNamed(Routes.AUTH_CASES);
  }
}
