import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:cell_calendar/cell_calendar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rosses_mobile_master/app/repo/MasterRepo.dart';
import 'package:rosses_mobile_master/model/master/ImplementsSchedule.dart';

class MasterCalendarController extends GetxController {
  final implementsSchedule = List<ImplementsSchedule>().obs;
  final calendarEvents = List<CalendarEvent>().obs;

  MasterRepo masterRepo = MasterRepo();

  getFirstDay() {
    DateTime dateTime = DateTime.now();
    return DateTime(dateTime.year, dateTime.month, 1);
  }

  getLastDay(DateTime dateTime) {
    return dateTime.add(Duration(days: 41));
  }

  Color diffDateTime(dateStart,dateEnd) {
    var now = new DateTime.now();
    var start = DateTime.parse(dateStart);
    var end = DateTime.parse(dateEnd);
    var isAfterNow = start.isAfter(now);
    var isBeforeNow = end.isBefore(now);

    if(!isAfterNow && !isBeforeNow){
      // between
      return Colors.orange;
    } else if(!isBeforeNow) {
      // future
      return Colors.blue;
    } else {
      // past
      return Colors.grey;
    }
  }

  previewThumbs() async {
    calendarEvents([]);
    List<CalendarEvent> eventsList = implementsSchedule.map((element) =>
        CalendarEvent(
            eventName: element.act.address,
            eventDate: DateTime.parse(element.start_date),
            eventBackgroundColor:  diffDateTime(element.start_date, element.end_date)
        )).toList();
    calendarEvents(eventsList);
  }




  void implementsByMonth(first, last) async {
    var firstDate = first ?? getFirstDay();
    var lastDate = last ?? getLastDay(firstDate);
    implementsSchedule([]);
    await masterRepo.onImplementsByMonth(firstDate, lastDate)
        .then((value) {
      if (value != null) {
        Iterable l = value as List;
        List<ImplementsSchedule> iList = l.map((e) => ImplementsSchedule.fromJson(e)).toList();
        iList.forEach((element) {
          implementsSchedule.add(element);
        });
        update();
      }
    }).then((value) => previewThumbs());
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    implementsByMonth(null, null);
    super.onInit();
  }
  void reload() {
    implementsByMonth(null, null);
  }
  onChange(first, last) async {
    implementsByMonth(first, last);
  }

}