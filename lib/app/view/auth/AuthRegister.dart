import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:rosses_mobile_master/app/controller/AuthController.dart';
import 'package:rosses_mobile_master/shared/widgets/widgets.dart';



class AuthRegisterView extends StatelessWidget {

  final AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Регистрация'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 40,horizontal: 12),
          child: Obx(() => Column(
            children: [
              TextSimple('Ваш номер подтветжден. Введите Имя, Фамилию, свой Email и придумайте пароль для авторизации'),
              TextField(
                keyboardType: TextInputType.name,
                onChanged: (name) => authController.onNameInputChange(name),
                decoration: InputDecoration(
                    labelText: 'Имя ',
                    labelStyle: TextStyle(
                      color: Colors.indigo ,
                    ),
                    errorText: authController.nameValidate.value ? null : 'имя - только буквы и пробелы'
                ),
              ),
              TextField(
                keyboardType: TextInputType.name,
                onChanged: (surname) => authController.onSurnameInputChange(surname),
                decoration: InputDecoration(
                    labelText: 'Фамилия ',
                    labelStyle: TextStyle(
                      color: Colors.indigo ,
                    ),
                    errorText: authController.surnameValidate.value ? null : 'фамилия - только буквы и пробелы'
                ),
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                onChanged: (email) => authController.onLoginInputChange(email),
                decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(
                      color: Colors.indigo ,
                    ),
                    errorText: authController.loginValidate.value ? null : 'введите валидный email'
                ),
              ),
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
                        ? () => authController.onRegisterSubmit() : null,
                    child: Text('Подтвердить'),
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
