import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rosses_mobile_master/app/controller/account/AccountProfileController.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:rosses_mobile_master/model/account/AccountProfile.dart';

class AccountProfileEmploymentFormView extends StatelessWidget {

 final AccountProfileController ctrl = Get.put(AccountProfileController());
 
  @override
  Widget build(BuildContext context) {

    Map<String,dynamic> myValuesEmployment = Get.arguments['values'].toMap();
    var values = myValuesEmployment.obs;
    String type = Get.arguments['type'];


    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(type == 'add' ? 'Добавить место работы' : 'Редакция записи об месте работы'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20, left: 18, right: 18),
              child: Column(
                children: [
                  Obx(() => Text('Дата поступления: ${values['date_of_employment']}')),
                  SizedBox(
                    width: double.infinity,
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.grey,
                      child: Text("Изменить дату поступления"),
                      onPressed: () async {
                        var dateOfEmployment = await DatePicker.showSimpleDatePicker(
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
                        values['date_of_employment'] = dateOfEmployment.toString() == null ? '' : dateOfEmployment.toString().split(' ')[0];
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, left: 18, right: 18),
              child: Column(
                children: [
                  Obx(() => Text('Дата увольнения: ${values['date_of_dismissal']} ')),
                  SizedBox(
                    width: double.infinity,
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.grey,
                      child: Text("Изменить дату увольнения"),
                      onPressed: () async {
                        var dateOfDismissal = await DatePicker.showSimpleDatePicker(
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
                        values['date_of_dismissal'] = dateOfDismissal.toString()?.split(' ')[0];
                      },
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 20, left: 18, right: 18),
              child: TextField(
                controller: TextEditingController(text: values['organisation']),
                decoration: InputDecoration(labelText: 'Организация'),
                onChanged: (organisation) => values['organisation'] = organisation,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, left: 18, right: 18),
              child: TextField(
                controller: TextEditingController(text: values['position']),
                decoration: InputDecoration(labelText: 'Должность'),
                onChanged: (position) => values['position'] = position,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, left: 18, right: 18),
              child: TextField(
                controller: TextEditingController(text: values['address_of_organisation']),
                decoration: InputDecoration(labelText: 'Адрес организации'),
                onChanged: (addressOfOrganisation) => values['address_of_organisation'] = addressOfOrganisation,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, left: 18, right: 18),
              child: TextField(
                controller: TextEditingController(text: values['reason_for_dismissal']),
                decoration: InputDecoration(labelText: 'Причина увольнения'),
                onChanged: (reasonForDismissal) => values['reason_for_dismissal'] = reasonForDismissal,
              ),
            ),
            Padding(
                padding: EdgeInsets.only(top: 20, left: 18, right: 18),
                child: type == 'add' ?
                SizedBox(
                  width: double.infinity,
                  child: RaisedButton(
                      color: Colors.indigo,
                      textColor: Colors.white,
                      child: Text(type == 'edit' ? 'Изменить' : 'Добавить'),
                      onPressed: () => ctrl.fieldsAdd(json.encode({"employments": [values]}))
                  ),
                )
                    :
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      RaisedButton(
                          color: Colors.indigo,
                          textColor: Colors.white,
                          child: Text('Изменить'),
                          onPressed: () => ctrl.fieldsEdit(json.encode({"employments": [values]}))
                      ),
                      RaisedButton(
                          color: Colors.red,
                          textColor: Colors.white,
                          child: Text('Удалить'),
                          onPressed: () => ctrl.fieldsDelete(values['id'], "employments")
                      ),
                    ],
                  ),
                )
            ),
            Padding(padding: EdgeInsets.only(bottom: 30))
          ],
        ),
      ),
    );
  }
}
