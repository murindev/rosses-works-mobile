import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:rosses_mobile_master/app/controller/account/AccountProfileController.dart';


class AccountProfilePhoneFormView extends StatelessWidget {

 final AccountProfileController ctrl = Get.put(AccountProfileController());
 
  @override
  Widget build(BuildContext context) {
    var name = Get.arguments['name'];
    var field = Get.arguments['field'];
    String value = Get.arguments['value'];
    final maskFormatterPhone = new MaskTextInputFormatter(mask: '+7 (###) ###-##-##', filter: {"#": RegExp(r'[0-9]')});

    return Obx( () => Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text(ctrl.headerText.value),
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20, left: 18, right: 18),
              child: TextField(
                  inputFormatters: [maskFormatterPhone],
                  maxLength: null,
                  controller: TextEditingController(text: '${value ?? ''}'),
                  decoration: InputDecoration(labelText: '${name ?? ''}'),
                  keyboardType: TextInputType.number,
                  onChanged: (val) => value = val
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, left: 18, right: 18),
              child: SizedBox(
                width: double.infinity,
                child: RaisedButton(
                    color: Colors.indigo,
                    textColor: Colors.white,
                    child: Text('Подтвердить'),
                    onPressed: () => value.length == 18 ? ctrl.onTextFormSubmit(field, value) : null
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
