import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rosses_mobile_master/app/controller/account/AccountProfileController.dart';
import 'package:rosses_mobile_master/app/view/account/profile/forms/AccountProfilePhotoFormView.dart';
import 'package:rosses_mobile_master/model/account/AccountProfile.dart';
import 'package:rosses_mobile_master/shared/settings.dart';
import 'package:rosses_mobile_master/shared/widgets/navigation/AccountMasterAppBarActions.dart';
import 'package:rosses_mobile_master/shared/widgets/navigation/AccountMasterBottomNavigationBar.dart';
import 'package:rosses_mobile_master/route/app_pages.dart';

class AccountProfileView extends StatelessWidget {
  final AccountProfileController accountProfileController = Get.put(AccountProfileController());

  @override
  Widget build(BuildContext context) {
    accountProfileController.onPhotoReceive();
     print('accountProfileController.accountProfile.value.agreement ${accountProfileController.accountProfile.value.toMap()}');

    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text('Профиль'),
        ),
        endDrawer: AccountMasterAppBarActions(),
        bottomNavigationBar: AccountMasterBottomNavigationBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Card(
                  color: Colors.grey[200],
                  elevation: 3,
                  child: InkWell(
                    onTap: () => showModalBottomSheet(
                        context: context,
                        builder: (builder) {
                          return ProfilePhoto(accountProfileController.accountProfile.value.user_id);
                        }),
                    child: Column(
                      children: [
                        ListTile(
                          leading: ClipRRect(borderRadius: new BorderRadius.circular(50.0), child: Image.network('${accountProfileController.photo.value}')),
                          title: Text(
                            '${GetStorage().read('name') ?? ''} ${GetStorage().read('patronymic') ?? ''}  ${GetStorage().read('surname') ?? ''}',
                          ),
                          subtitle: Text(
                            '${GetStorage().read('rank_name')}',
                            // '${accountProfileController.accountProfile.value.role?.name} : ${accountProfileController.accountProfile.value.title?.name}',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                _divider(),
                _h2('Основные данные'),
                // _CustomListItem('Фамилия:', 'surname', accountProfileController.accountProfile.value.surname, ''),
                // _CustomListItem('Имя:', 'name', accountProfileController.accountProfile.value.name, ''),
                _CustomListItem('Отчество:', 'patronymic', accountProfileController.accountProfile.value.patronymic, ''),
                _CustomListItem('Дата рождения:', 'birth_date', accountProfileController.accountProfile.value.birth_date, 'date'),
                _CustomListItem('Место рождения (село, город, край, область, республика):', 'birth_place', accountProfileController.accountProfile.value.birth_place, ''),
                _CustomListItem('Адрес (место жительства): индекс, область, город, улица, дом, квартира:', 'address_residence', accountProfileController.accountProfile.value.address_residence, ''),
                _CustomListItem(
                    'Адрес (место прописки): индекс, область, город, улица, дом, квартира:', 'address_registration', accountProfileController.accountProfile.value.address_registration, ''),
                _CustomListItem('Телефон (Домашний):', 'phone_home', accountProfileController.accountProfile.value.phone_home, 'phone'),
                _CustomListItem('Телефон (Сотовый):', 'phone_mobile', accountProfileController.accountProfile.value.phone_mobile, 'phone'),
                _CustomListItem('Телефон (Рабочий):', 'phone_office', accountProfileController.accountProfile.value.phone_office, 'phone'),
                _CustomListItem('Паспортные данные:', 'passport_data', accountProfileController.accountProfile.value.passport_data, ''),
                _CustomListItem('Семейное положение:', 'marital_status', accountProfileController.accountProfile.value.marital_status, ''),
                _CustomListItem('Отношение к воинской обязанности и воинское звание:', 'military_status', accountProfileController.accountProfile.value.military_status, ''),
                _divider(),
                _TableListItem(
                    'education',
                    'Образование',
                    'Основное:',
                    {'date_admission': 'Дата поступления', 'date_graduation': 'Дата окончания', 'institution': 'Учебное заведение', 'speciality': 'Специальность'},
                    accountProfileController.accountProfile.value.education),
                _CustomListItem('Дополнительное образование:', 'education_additional', accountProfileController.accountProfile.value.education_additional, ''),
                _CustomListItem('Знание иностранных языков, степень владения:', 'languages', accountProfileController.accountProfile.value.languages, ''),
                _divider(),
                _TableListItem(
                    'employment',
                    'Трудовая деятельность',
                    'Укажите в обратном хронологическом парядке 5 последних мест Вашей работы:',
                    {
                      'date_of_employment': 'Дата начала работы',
                      'date_of_dismissal': 'Дата увольнения',
                      'organisation': 'Организация',
                      'position': 'Должность',
                      'address_of_organisation': 'Адрес организации',
                      'reason_for_dismissal': 'Причина увольнения',
                    },
                    accountProfileController.accountProfile.value.employments),
                _divider(),
                _h2('Желаемый уровень заработной платы'),
                _CustomListItem('на испытательный срок:', 'salary_for_probation', accountProfileController.accountProfile.value.salary_for_probation, ''),
                _CustomListItem('после испытательного срока:', 'salary_after_probation', accountProfileController.accountProfile.value.salary_after_probation, ''),
                _CustomListItem('Преимущества Вашей кандидатуры:', 'advantages', accountProfileController.accountProfile.value.advantages, ''),
                _CustomListItem('Ваши хобби:', 'hobbies', accountProfileController.accountProfile.value.hobbies, ''),
                _CustomListItem('Какую информацию Вы хотели бы добавить о себе:', 'additional_info', accountProfileController.accountProfile.value.additional_info, ''),
                _divider(),
                Container(
                  child: Column(
                    children: [
                      accountProfileController.accountProfile.value.agreement == 1
                          ? Column(children: [
                              Padding(padding: EdgeInsets.only(top: 20)),
                              SizedBox(
                                width: double.infinity,
                                child: RaisedButton(
                                  color: Colors.indigo,
                                  textColor: Colors.white,
                                  onPressed: () => accountProfileController.onAgreementSubmit(json.encode({'agreement': accountProfileController.accountProfile.value.agreement})),
                                  child: Text('${GetStorage().read('profileSubmitted') == null ? 'Отправить' : 'Обновить'} анкету'),
                                ),
                              ),
                            ])
                          : Container(
                              child:
                              CheckboxListTile(
                              title: Text("Против проверки предоставленной мною информации не возражаю"),
                              value:  accountProfileController.accountProfile.value.agreement == 1,
                              onChanged: (bool newValue) => accountProfileController.onAgreementCheck('agreement', newValue),
                              controlAffinity: ListTileControlAffinity.leading,
                            )
                      ),
                      Padding(padding: EdgeInsets.only(top: 20))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _divider() {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Divider(
        color: Colors.indigo[100],
        height: 30,
        thickness: 4,
        // indent: 20,
        endIndent: 0,
      ),
    );
  }

  Widget _customListItem(String name, String value) {
    return Container(
      // padding: new EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
      margin: EdgeInsets.only(top: 10.0),
/*      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.0),
        border: Border.all(color: Colors.black),
      ),*/
      child: InkWell(
        onLongPress: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          textDirection: TextDirection.ltr,
          children: [
            Container(
              // width: 40,
              child: Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(
                  Icons.keyboard_arrow_right,
                  size: 20,
                  color: Colors.indigo[300],
                ),
              ),
            ),
            Flexible(
              child: Container(
                width: double.infinity,
                child: Column(
                  textDirection: TextDirection.ltr,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(name,
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.left,
                        // softWrap: true,
                        style: TextStyle(fontWeight: FontWeight.w300, fontStyle: FontStyle.italic, fontSize: 13, color: Colors.grey)),
                    Text(value,
                        // softWrap: true,
                        textAlign: TextAlign.left,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black54))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _h2(String txt) {
    return SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Text(
            txt,
            style: TextStyle(
              color: Colors.red,
              fontSize: 20,
            ),
            textDirection: TextDirection.ltr,
          ),
        ));
  }
}

class _TableListItem extends StatelessWidget {
  final String model;
  final String title;
  final String name;
  final headings;
  final List values;

  _TableListItem(this.model, this.title, this.name, this.headings, this.values) : super();

  @override
  Widget build(BuildContext context) {
// headings
    List<DataColumn> headingsList = [];
    for (var i in headings.entries) {
      headingsList.add(DataColumn(
        label: Text(
          i.value,
          style: TextStyle(fontFamily: 'Cuprum', fontWeight: FontWeight.w300, fontSize: 12, color: Colors.indigo),
        ),
      ));
    }
// Cells
    List<DataRow> valuesRows = [];

    if (values != null && values.length > 0)
      values.forEach((valueMap) {
        List<DataCell> dataCellsList = [];

        for (var v in headings.entries) {
          dataCellsList.add(DataCell(TableRowInkWell(
            onLongPress: () {
              if (model == 'education') {
                Get.toNamed(Routes.ACCOUNT_PROFILE_EDUCATION, arguments: {'name': name, 'headings': headings, 'values': valueMap, 'type': 'edit'});
              }
              if (model == 'employment') {
                Get.toNamed(Routes.ACCOUNT_PROFILE_EMPLOYMENT, arguments: {'name': name, 'headings': headings, 'values': valueMap, 'type': 'edit'});
              }
            },
            child: Text(
              valueMap.getValue(v.key) != null ? valueMap.getValue(v.key) : '',
              //v.key,
              style: TextStyle(fontFamily: 'Cuprum'),
            ),
          )));
        }

        return valuesRows.add(DataRow(
          cells: dataCellsList,
        ));
      });

    return Column(
      children: [
        SizedBox(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(
                    title,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                    ),
                    textDirection: TextDirection.ltr,
                  ),
                ),
                RawMaterialButton(
                  onPressed: () {
                    if (model == 'education') {
                      Get.toNamed(Routes.ACCOUNT_PROFILE_EDUCATION, arguments: {'name': name, 'headings': headings, 'values': AccountProfileEducation.initial(), 'type': 'add'});
                    }
                    if (model == 'employment') {
                      Get.toNamed(Routes.ACCOUNT_PROFILE_EMPLOYMENT, arguments: {'name': name, 'headings': headings, 'values': AccountProfileEmployment.initial(), 'type': 'add'});
                    }
                  },
                  elevation: 2.0,
                  fillColor: Colors.indigo[200],
                  child: Icon(
                    Icons.add,
                    size: 16.0,
                  ),
                  // padding: EdgeInsets.all(15.0),
                  shape: CircleBorder(),
                ),
              ],
            )),
        ListTile(
          dense: true,
          hoverColor: Colors.red,
          contentPadding: EdgeInsets.only(bottom: 0, top: 0),
          onLongPress: () => {},
          title: Text(
            name,
            style: TextStyle(fontWeight: FontWeight.w300, fontStyle: FontStyle.italic, fontSize: 13, color: Colors.grey),
          ),
          subtitle: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(bottom: 10),
            child: DataTable(headingRowHeight: 24, dividerThickness: 0, dataRowHeight: 24, horizontalMargin: 0, columnSpacing: 15, columns: headingsList, showCheckboxColumn: false, rows: valuesRows),
          ),
          // trailing: null
        ),
      ],
    );
  }
}

class _CustomListItem extends StatelessWidget {
  final String name;
  final String field;
  final String value;
  final String formatter;

  _CustomListItem(this.name, this.field, this.value, this.formatter) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: new EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
      margin: EdgeInsets.only(top: 10.0),
      // padding: EdgeInsets.only(top: 10,bottom: 10),
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(2.0),
      //   border: Border.all(color: Colors.indigo[300]),
      // ),
      child: InkWell(
        onLongPress: () {
          if (formatter == 'phone') {
            Get.toNamed(Routes.ACCOUNT_PROFILE_PHONE, arguments: {'name': name, 'field': field, 'value': value});
          } else if (formatter == 'date') {
            Get.toNamed(Routes.ACCOUNT_PROFILE_DATE, arguments: {'name': name, 'field': field, 'value': value});
          } else {
            Get.toNamed(Routes.ACCOUNT_PROFILE_TEXT, arguments: {'name': name, 'field': field, 'value': value});
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          textDirection: TextDirection.ltr,
          children: [
            Container(
              // width: 40,
              child: Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(
                  Icons.keyboard_arrow_right,
                  size: 20,
                  color: Colors.indigo[300],
                ),
              ),
            ),
            Flexible(
              child: Container(
                width: double.infinity,
                child: Column(
                  textDirection: TextDirection.ltr,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(name ?? ' ',
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.left,
                        // softWrap: true,
                        style: TextStyle(fontWeight: FontWeight.w300, fontStyle: FontStyle.italic, fontSize: 13, color: Colors.grey)),
                    Text(value ?? '',
                        // softWrap: true,
                        textAlign: TextAlign.left,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black54))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
