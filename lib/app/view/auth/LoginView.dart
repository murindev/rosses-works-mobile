import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rosses_mobile_master/app/controller/AuthController.dart';

class LoginView extends StatelessWidget {

  final AuthController authController = Get.put(AuthController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Авторизация'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Align(
          alignment: Alignment(0, -1 / 3),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Obx(() => TextField(
                keyboardType: TextInputType.emailAddress,
                onChanged: (email) => authController.onLoginInputChange(email),
                decoration: InputDecoration(
                    labelText: 'Ввод логина',
                    labelStyle: TextStyle(
                      color: Colors.indigo ,
                    ),
                    errorText: authController.loginValidate.value ? null : 'введите валидный email'
                ),
              )),
              const Padding(padding: EdgeInsets.all(12)),
              Obx(() => TextField(
                keyboardType: TextInputType.visiblePassword,
                onChanged: (passString) => authController.onPassInputChange(passString),
                decoration: InputDecoration(
                    labelText: 'Ввод пароля',
                    labelStyle: TextStyle(
                      color: Colors.indigo ,
                    ),
                    errorText: authController.passValidate.value ? null : '6 и более знаков (Латиница)'
                ),
              )),
              Obx(() => Padding(
                padding: const EdgeInsets.only(top: 28.0),
                child: SizedBox(
                  width: double.infinity,
                  child: RaisedButton(
                    color: Colors.indigo,
                    textColor: Colors.white,
                    onPressed: authController.passValidate.value && authController.passValidate.value  ? () => authController.onLogin() : null,
                    child: Text('Логин'),
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
