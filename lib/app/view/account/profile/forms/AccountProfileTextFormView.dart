import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rosses_mobile_master/app/controller/account/AccountProfileController.dart';


class AccountProfileTextFormView extends StatelessWidget {

 final AccountProfileController ctrl = Get.put(AccountProfileController());
 
  @override
  Widget build(BuildContext context) {
    var name = Get.arguments['name'];
    var field = Get.arguments['field'];
    var value = Get.arguments['value'];

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
                  key: Key('profileText_input'),
                  maxLength: null,
                  controller: TextEditingController(text: '${value ?? ''}'),
                  decoration: InputDecoration(labelText: '${name ?? ''}'),
                  keyboardType: TextInputType.multiline,
                  maxLines: 4,
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
                    onPressed: () =>  ctrl.onTextFormSubmit(field, value)
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
