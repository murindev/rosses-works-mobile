import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rosses_mobile_master/app/controller/auth/AuthCasesController.dart';
import 'package:rosses_mobile_master/app/view/AuthView.dart';
import 'package:rosses_mobile_master/app/view/auth/LoginView.dart';
import 'package:rosses_mobile_master/shared/widgets/Buttons.dart';

class AuthCasesView extends StatelessWidget {

  final AuthCasesController authCasesController = Get.put(AuthCasesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 100,
            ),
            Column(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  margin: EdgeInsets.only(bottom: 20),
                  child: Image.asset(
                    'assets/logo.png',
                    fit: BoxFit.contain,
                  ),
                ),
                Container(
                  child: Text(
                    'Работа мечты \n в твоем кармане',
                    style: TextStyle(fontSize: 36, fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  ButtonRed(text:'Я новый пользователь',route: '/auth_phone' ),
                  ButtonIndigo(text: 'У меня есть аккаунт', route: '/login'),
                  ButtonFlatSized(text: 'Пользователькое соглашение',route: '/user_agreement',),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
