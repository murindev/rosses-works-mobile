import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rosses_mobile_master/app/controller/account/AccountProfileController.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';

class AccountProfileDateFormView extends StatelessWidget {

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
              child: RaisedButton(
                child: Text("Изменить: ${name ?? ''} - ${ctrl.newDate.value.length == 0 ? value : ctrl.newDate}"),
                onPressed: () async {
                   var datePicked = await DatePicker.showSimpleDatePicker(
                    context,
                    initialDate: DateTime(1994),
                    firstDate: DateTime(1940),
                    lastDate: DateTime(2100),
                    dateFormat: "yyyy-MMMM-dd",
                    locale: DateTimePickerLocale.ru,
                    looping: true,
                    titleText: 'Выберите дату',
                    confirmText: 'Сохранить',
                    cancelText: 'Отмена',
                  );

                  ctrl.onDatePickerUpdate(datePicked);
                },
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
                    onPressed: () => ctrl.onTextFormSubmit(field, ctrl.newDate.value.length == 0 ? value : ctrl.newDate)
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
