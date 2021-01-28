import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:rosses_mobile_master/app/controller/AuthController.dart';
import 'package:rosses_mobile_master/shared/widgets/widgets.dart';

class AuthCodeView extends StatelessWidget {

 final AuthController authController = Get.find();
 final codeFormatter = new MaskTextInputFormatter(mask: '####', filter: {"#": RegExp(r'[0-9]')});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Подтверждение телефона'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 40,horizontal: 12),
        child: Column(
          children: [
            Obx(() => TextSimple('Сейчас вам поступит звонок \n на номер ${authController.auth.value.phone}  \n Введите последние 4 цифры номера \n входящего звонка')),
         Obx(() => TextField(
           inputFormatters: [codeFormatter],
           keyboardType: TextInputType.number,
           onChanged: (code) => authController.onCodeInputChange(code),
           decoration: InputDecoration(
             labelText: 'Ввод цифр',
             labelStyle: TextStyle(
               color: Colors.indigo ,
             ),
             errorText: authController.codeValidate.value ? null : 'введите 4 цифры'
           ),
         )),
            Obx(() => Padding(
              padding: const EdgeInsets.only(top: 28.0),
              child: SizedBox(
                width: double.infinity,
                child: RaisedButton(
                  color: Colors.indigo,
                  textColor: Colors.white,
                  onPressed: authController.codeValidate.value 
                      ? () => authController.onCodeSubmitChange() : null,
                  child: Text('Подтвердить'),
                ),
              ),
            ))

          ],
        ),
      ),
    );
  }
}
