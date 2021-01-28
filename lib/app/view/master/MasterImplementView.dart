import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:rosses_mobile_master/app/controller/master/MasterImplementController.dart';
import 'package:rosses_mobile_master/shared/settings.dart';
import 'package:rosses_mobile_master/shared/widgets/InteractiveWidgets.dart';
import 'package:rosses_mobile_master/shared/widgets/navigation/AccountMasterBottomNavigationBar.dart';

class MasterImplementView extends StatelessWidget {
  final MasterImplementController ctrlItem = Get.put(MasterImplementController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Выполнение заказа'),
          leading: Icon(Icons.calendar_today),
          actions: [
            Obx(() => IconButton(
              icon: Icon(ctrlItem.currentItem.value?.act?.execution?.step == 5 ? Icons.phone_disabled : Icons.phone),
              onPressed:ctrlItem.currentItem.value?.act?.execution?.step == 5
                  ? null
                  : () => confirmDialog(
                  "Совершить звонок на обьект?", () => ctrlItem.onClientCallback(), null),
              padding: EdgeInsets.only(right: 20),
            )),
          ],
        ),
        bottomNavigationBar: AccountMasterBottomNavigationBar(),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Obx(() => ctrlItem.currentItem.value.id != null
              ? Column(
                  children: [
                    Card(
                      borderOnForeground: true,
                      child: ExpansionTile(
                          leading: Container(
                              color: Colors.indigo,
                              padding: EdgeInsets.symmetric(vertical: 3, horizontal: 6),
                              child: Text(
                                '${ctrlItem.currentItem.value?.start_dateTime}\n${ctrlItem.currentItem.value?.end_dateTime}',
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontFamily: 'Minisystem', fontSize: 12),
                              )),
                          //Icon(Icons.account_tree_sharp),
                          backgroundColor: Colors.black12,
                          title: Text(
                            "#${ctrlItem.currentItem.value?.act?.id} - ${ctrlItem.currentItem.value?.act?.address}",
                            style: TextStyle(color: Colors.black),
                          ),
                          childrenPadding: EdgeInsets.fromLTRB(12, 0, 12, 12),
                          children: ctrlItem.currentItem.value?.act?.volumes_mobile != null
                              ? ctrlItem.currentItem.value.act.volumes_mobile.map((volume) {
                                  return Column(
                                    children: [
                                      SizedBox(
                                          width: double.infinity,
                                          child: Text(
                                            '${volume.pest_row.name} - ${volume.square} ( ${volume.square_entity_row.name} )',
                                            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                                          )),
                                      Column(
                                        children: volume.method.map((method) {
                                          return SizedBox(width: double.infinity, child: Text('  - ${method.name}'));
                                        }).toList(),
                                      )
                                    ],
                                  );
                                }).toList()
                              : [
                                  Center(
                                    child: Text('Waiting'),
                                  ),
                                ]),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: ctrlItem.currentItem.value.act.execution == null
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : Stepper(
                                currentStep: ctrlItem.currentItem.value.act.execution.step,
                                type: StepperType.vertical,
                                physics: ClampingScrollPhysics(),
                                steps: [
                                  Step(
                                    title: Text("Выезд по адресу"),
                                    subtitle: ctrlItem.currentItem.value.act.execution.step > 0 ? Text('${ctrlItem.currentItem.value.act.execution.departured}') : Text(''),
                                    state: ctrlItem.currentItem.value.act.execution.step == 0 ? StepState.editing : StepState.indexed,
                                    // isActive: ctrlItem.currentItem.value.act.execution.step == 0,
                                    content: Column(
                                      children: [
                                        SizedBox(
                                          width: double.infinity,
                                          child: RaisedButton(
                                              color: Colors.indigo,
                                              textColor: Colors.white,
                                              child: Text('Выезд по адресу'),
                                              onPressed: () => confirmDialog("Подтерждаете выезд по адресу?", () => ctrlItem.onStepDeparture(), null)),
                                        )
                                      ],
                                    ),
                                  ),
                                  Step(
                                    title: Text("Прибыл по адресу"),
                                    state: ctrlItem.currentItem.value.act.execution.step == 1 ? StepState.editing : StepState.indexed,
                                    subtitle: ctrlItem.currentItem.value.act.execution.step > 1 ? Text('${ctrlItem.currentItem.value.act.execution.arrived}') : Text(''),
                                    isActive: ctrlItem.currentItem.value.act.execution.step == 1,
                                    content: SizedBox(
                                      width: double.infinity,
                                      child: RaisedButton(
                                          child: Text('Подтвердить'),
                                          color: Colors.indigo,
                                          textColor: Colors.white,
                                          onPressed: () => confirmDialog("Подтерждаете прибытие по адресу?", () => ctrlItem.onStepArrived(), null)),
                                    ),
                                  ),
                                  Step(
                                    title: Text("Аудит"),
                                    subtitle: ctrlItem.currentItem.value.act.execution.step > 2 ? Text('${ctrlItem.currentItem.value.act.execution.audit}') : Text(''),
                                    state: ctrlItem.currentItem.value.act.execution.step == 2 ? StepState.editing : StepState.indexed,
                                    isActive: ctrlItem.currentItem.value.act.execution.step == 2,
                                    content: Column(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(bottom: 30),
                                          child: ClipOval(
                                            child: Container(
                                              width: 80,
                                              height: 80,
                                              color: Colors.indigo,
                                              child: IconButton(
                                                onPressed: () => ctrlItem.getPhoto(),
                                                icon: Icon(Icons.add_a_photo),
                                                color: Colors.white,
                                                iconSize: 32,
                                                // child: Text('Добавить фото'),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Wrap(
                                            spacing: 8,
                                            runSpacing: 2,
                                            children: ctrlItem.currentItem.value.act.audit_photos
                                                .map((audit) => SizedBox(
                                                      width: 50,
                                                      height: 80,
                                                      child: Image.network(
                                                        audit.photo != null ? AUDIT_PHOTO_PATH + audit.photo : 'https://egitim01.bakirkoyajans.com.tr/wp-content/uploads/2019/01/icon-k.jpg',
                                                      ),
                                                    ))
                                                .toList(),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SizedBox(
                                            width: double.infinity,
                                            child: RaisedButton(
                                              color: Colors.indigo,
                                              onPressed: () => confirmDialog(
                                                  ctrlItem.currentItem.value.act.audit_photos == null ? "Подтерждаете ОТКАЗ от аудита?" : "Аудит завершен?", () => ctrlItem.onStepAudit(), null),
                                              child: Text(
                                                'Заершить аудит',
                                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Step(
                                    title: Text("Договор"),
                                    state: ctrlItem.currentItem.value.act.execution.step == 3 ? StepState.editing : StepState.indexed,
                                    isActive: ctrlItem.currentItem.value.act.execution.step == 3,
                                    content: Column(
                                      children: [
                                        Text('Сделайте скан документа в удобной для вас программе (Например Genius Scan) и сохраните файл. Затем выберите и загрузите этот файл'),
                                        SizedBox(
                                          width: double.infinity,
                                          child: SizedBox(
                                            child: RaisedButton(
                                              child: Text('Загрузить скан'),
                                              onPressed: () => ctrlItem.getScannedAct(),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Step(
                                      title: Text("Завершение работы"),
                                      state: ctrlItem.currentItem.value.act.execution.step == 4 ? StepState.complete : StepState.indexed,
                                      isActive: ctrlItem.currentItem.value.act.execution.step == 4,
                                      content: Column(
                                        children: [
                                          SizedBox(
                                              width: double.infinity,
                                              child: RaisedButton(
                                                  child: Text('Завершить работу'), onPressed: () => confirmDialog("Подтерждаете завершение работы?", () => ctrlItem.onStepFinished(), null)))
                                        ],
                                      )),
                                  Step(
                                      title: Text("Завершено"),
                                      state: ctrlItem.currentItem.value.act.execution.step == 5 ? StepState.complete : StepState.indexed,
                                      isActive: ctrlItem.currentItem.value.act.execution.step == 5,
                                      content: Text('Текст итогов')),
                                ],
/*                currentStep: _index,
                onStepTapped: (index) {
                  setState(() {
                    _index = index;
                  });
                },*/
                                controlsBuilder: (BuildContext context, {VoidCallback onStepContinue, VoidCallback onStepCancel}) => Container(),
                              ),
                      ),
                    ),
                  ],
                )
              : Center(
                  child: CircularProgressIndicator(),
                )),
        ));
  }
}
