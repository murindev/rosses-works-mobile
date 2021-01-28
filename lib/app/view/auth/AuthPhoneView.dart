import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:rosses_mobile_master/app/controller/AuthController.dart';
import 'package:rosses_mobile_master/shared/widgets/widgets.dart';

class AuthPhoneView extends StatelessWidget {
  final maskFormatter = new MaskTextInputFormatter(
      mask: '+7 (###) ###-##-##', filter: {"#": RegExp(r'[0-9]')});
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Подтверждение телефона'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 40, horizontal: 12),
          child: Column(
            children: [
              TextSimple(
                  'Для начала регистрации необходимо подтвердить Ваш номер телефона'),
              Column(
                children: [
                  Obx(() => TextField(
                      inputFormatters: [maskFormatter],
                      keyboardType: TextInputType.number,
                      onChanged: (phoneNumber) =>
                          authController.onPhoneInputChange(phoneNumber),
                      decoration: InputDecoration(
                        labelText: 'Номер Телефона (Вводите без +7)',
                        errorText: authController.phoneValidate.value
                            ? null
                            : 'введите правильный номер',
                      ))),
                  Obx(
                    () => Padding(
                      padding: const EdgeInsets.only(top: 28.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: RaisedButton(
                            color: Colors.indigo,
                            textColor: Colors.white,
                            key: const Key('registerForm_continue_raisedButton'),
                            child: const Text('Подтвердить'),
                            onPressed: authController.phoneValidate.value
                                ? () => authController.onPhoneInputSubmit()
                                : null),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

