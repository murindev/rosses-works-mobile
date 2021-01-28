import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:rosses_mobile_master/app/repo/MasterRepo.dart';
import 'package:rosses_mobile_master/model/crm/__/Implement.dart';
import 'package:rosses_mobile_master/model/master/ImplementsSchedule.dart';
import 'package:rosses_mobile_master/route/app_pages.dart';
import 'package:rosses_mobile_master/shared/settings.dart';
import 'package:rosses_mobile_master/shared/widgets/Loader.dart';

class MasterCalendarDayController extends GetxController {
 final implementsSchedule = List<ImplementsSchedule>().obs;



  MasterRepo masterRepo = MasterRepo();



  getArguments() async {

  }

  void loadList(date) async {

     print('date date date ${date}');





    Get.dialog(LoaderWidget());
    implementsSchedule.value = [];
    await masterRepo.getImplementsListByDate(date).then((value) {
      if(value != null){
        Iterable l = json.decode(value) as List;
        List<ImplementsSchedule> iList = l.map((e) =>  ImplementsSchedule.fromJson(e)).toList();
        iList.forEach((element) {implementsSchedule.add(element); });
        update();
      }
    }).then((value) => Get.back());
 }


  @override
  void onInit() async {
    // print('Get.arguments ${Get.arguments}');
    // loadList();
    super.onInit();
  }



  @override
  void onReady() async {
    loadList(await Get.arguments);
    super.onReady();
  }





}
