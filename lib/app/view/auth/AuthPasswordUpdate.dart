import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:rosses_mobile_master/route/app_pages.dart';
import 'package:rosses_mobile_master/app/controller/AuthController.dart';
import 'package:rosses_mobile_master/shared/widgets/widgets.dart';



class AuthPasswordUpdate extends StatelessWidget {

  final AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Обновление пароля'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 40,horizontal: 12),
          child: Obx(() => Column(
            children: [
              TextSimple('Ваш номер подтветжден. Вы уже зарегистрированы, Ваш логин - ${authController.login}, если вы не помните пароль, обновите его в форме ниже, либо перейдите на страницу авторизации'),
              TextField(
                keyboardType: TextInputType.visiblePassword,
                onChanged: (passString) => authController.onPassInputChange(passString),
                decoration: InputDecoration(
                    labelText: 'Пароль',
                    labelStyle: TextStyle(
                      color: Colors.indigo ,
                    ),
                    errorText: authController.passValidate.value ? null : '6 и более знаков (Латиница)'
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 28.0),
                child: SizedBox(
                  width: double.infinity,
                  child: RaisedButton(
                    color: Colors.indigo,
                    textColor: Colors.white,
                    onPressed: authController.passValidate.value && authController.passValidate.value
                        ? () => authController.onPassUpdateSubmit() : null,
                    child: Text('Подтвердить пароль'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 28.0),
                child: SizedBox(
                  width: double.infinity,
                  child: RaisedButton(
                    color: Colors.indigo,
                    textColor: Colors.white,
                    onPressed: () => Get.toNamed(Routes.LOGIN),
                    child: Text('На страницу авторизации'),
                  ),
                ),
              )
            ],
          )) ,
        ),
      ),
    );
  }
}
