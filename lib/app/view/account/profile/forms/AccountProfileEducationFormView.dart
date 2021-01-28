import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rosses_mobile_master/app/controller/account/AccountProfileController.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:rosses_mobile_master/model/account/AccountProfile.dart';

class AccountProfileEducationFormView extends StatelessWidget {

 final AccountProfileController ctrl = Get.put(AccountProfileController());
 
  @override
  Widget build(BuildContext context) {


    Map<String,dynamic> myValues = Get.arguments['values'].toMap();
    var values = myValues.obs;
    String type = Get.arguments['type'];


    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(type == 'add' ? 'Добавить запись об образовании' : 'Редакция записи об образовании'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20, left: 18, right: 18),
              child: Column(
                children: [
                  // Obx(() => Text('Дата поступления: ${newDateAdmission.value.length == 0 ? values.date_admission : newDateAdmission.value} ')),
                  Obx(() => Text('Дата поступления: ${values['date_admission']}')),
                  SizedBox(
                    width: double.infinity,
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.grey,
                      child: Text("Изменить дату поступления"),
                      onPressed: () async {
                        var dateAdmission = await DatePicker.showSimpleDatePicker(
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
                        values['date_admission'] = dateAdmission.toString() == null ? '' : dateAdmission.toString().split(' ')[0];
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
                  Obx(() => Text('Дата окончания: ${values['date_graduation']} ')),
                  SizedBox(
                    width: double.infinity,
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.grey,
                      child: Text("Изменить дату окончания"),
                      onPressed: () async {
                        var dateGraduation = await DatePicker.showSimpleDatePicker(
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
                        values['date_graduation'] = dateGraduation.toString()?.split(' ')[0];
                      },
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 20, left: 18, right: 18),
              child: TextField(
                controller: TextEditingController(text: values['institution']),
                decoration: InputDecoration(labelText: 'Учебное заведение'),
                onChanged: (institution) => values['institution'] = institution,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, left: 18, right: 18),
              child: TextField(
                controller: TextEditingController(text: values['speciality']),
                decoration: InputDecoration(labelText: 'Специальность'),
                onChanged: (speciality) => values['speciality'] = speciality,
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
                      onPressed: () => ctrl.fieldsAdd(json.encode({"educations": [values]}))
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
                          onPressed: () => ctrl.fieldsEdit(json.encode({"educations": [values]}))
                      ),
                      RaisedButton(
                          color: Colors.red,
                          textColor: Colors.white,
                          child: Text('Удалить'),
                          onPressed: () => ctrl.fieldsDelete(values['id'], "educations")
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
