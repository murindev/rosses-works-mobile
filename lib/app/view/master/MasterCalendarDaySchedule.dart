import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rosses_mobile_master/app/controller/master/MasterCalendarDayController.dart';
import 'package:rosses_mobile_master/app/controller/master/MasterScheduleController.dart';
import 'package:rosses_mobile_master/route/app_pages.dart';
import 'package:rosses_mobile_master/shared/widgets/navigation/AccountMasterBottomNavigationBar.dart';

class MasterCalendarDaySchedule extends StatelessWidget {

/*  final String date;
  MasterCalendarDaySchedule(this.date);*/

  final MasterCalendarDayController ctrl = Get.put(MasterCalendarDayController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Список актов на ${Get.arguments}'),
          leading: Icon(Icons.calendar_today),
          actions: [
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Get.back(),
            )
          ],
        ),
        bottomNavigationBar: AccountMasterBottomNavigationBar(),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ctrl.implementsSchedule != null
              ? Obx(() => ListView.builder(
                  itemCount: ctrl.implementsSchedule.length,
                  itemBuilder: (context, index) => Container(
                        margin: EdgeInsets.only(top: 10.0),
                        child: Container(
                          padding: EdgeInsets.only(top: 0, bottom: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2.0),
                            border:
                                Border.all(color: Colors.indigo[300], width: 3),
                          ),
                          child: Column(
                            children: [
//// =>
                              ListTile(
                                onTap: null,
                                tileColor: Colors.black12,
                                trailing: Icon(
                                  Icons.more,
                                  size: 24,
                                  color: Colors.red,
                                ),
                                title: Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: Text(
                                      '#${ctrl.implementsSchedule[index].act.id} - ${ctrl.implementsSchedule[index]?.start_dateDate} ( ${ctrl.implementsSchedule[index]?.start_dateTime} - ${ctrl.implementsSchedule[index]?.end_dateTime} )',
                                      textDirection: TextDirection.ltr,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 13,
                                          color: Colors.red)),
                                ),
                                subtitle: Padding(
                                  padding: const EdgeInsets.only(bottom: 8),
                                  child: Text(
                                      '${ctrl.implementsSchedule[index]?.act?.address}',
                                      softWrap: true,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontStyle: FontStyle.italic,
                                          fontSize: 14,
                                          color: Colors.black)),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 6),
                              ),
                              Column(
                                children: ctrl.implementsSchedule[index].act
                                    .volumes_mobile
                                    .map((volume) => Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              16, 0, 16, 10),
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                  width: double.infinity,
                                                  child: Text(
                                                      '${volume.pest_row.name}  / ${volume.square}  ${volume.square_entity_row.name} ',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 14,
                                                          color: Colors.red))),
                                              Column(
                                                children: volume.method
                                                    .map<Widget>((e) {
                                                  return SizedBox(
                                                      width: double.infinity,
                                                      child: Text(e.name));
                                                }).toList(),
                                              ),
                                            ],
                                          ),
                                        ))
                                    .toList(),
                              ),
                            ],
                          ),
                        ),
                      )))
              : Center(
                  child: Text(
                    'На сегодня задач нет',
                    style: TextStyle(
                         fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                ),
        ));
  }
}
