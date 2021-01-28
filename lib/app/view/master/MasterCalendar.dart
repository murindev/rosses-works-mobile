import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cell_calendar/cell_calendar.dart';
import 'package:rosses_mobile_master/app/controller/master/MasterCalendarController.dart';
import 'package:rosses_mobile_master/route/app_pages.dart';
import 'package:rosses_mobile_master/shared/widgets/navigation/AccountMasterBottomNavigationBar.dart';

import 'package:rosses_mobile_master/shared/_some/calendar_events.dart';

class MasterCalendar extends StatelessWidget {
  final MasterCalendarController calendarCtrl = Get.put(MasterCalendarController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Календарь занятости'),
          leading: Icon(Icons.calendar_view_day),
        ),
        bottomNavigationBar: AccountMasterBottomNavigationBar(),
        body: Obx(() => calendarCtrl.calendarEvents.length > 0
            ? CellCalendar(
                events: calendarCtrl.calendarEvents,
                onCellTapped: (date) {
                  final eventsOnTheDate = calendarCtrl.calendarEvents.where((event) {
                    final eventDate = event.eventDate;
                    return eventDate.year == date.year && eventDate.month == date.month && eventDate.day == date.day;
                  }).toList();
                  showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(date.month.monthName + " " + date.day.toString()),
                                IconButton(
                                  icon: Icon(Icons.link, color: Colors.indigo,),
                                  onPressed: () => Get.toNamed(Routes.MASTER_CALENDAR_DAY, arguments: date ),
                                )
                              ],
                            ),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: eventsOnTheDate
                                  .map(
                                    (event) => Container(
                                      width: double.infinity,
                                      padding: EdgeInsets.all(4),
                                      margin: EdgeInsets.only(bottom: 12),
                                      color: event.eventBackgroundColor,
                                      child: Text(
                                        event.eventName,
                                        style: TextStyle(color: event.eventTextColor),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ));
                },
                onPageChanged: (firstDate, lastDate) => calendarCtrl.implementsByMonth(firstDate, lastDate),
              )
            : InkWell(
                onTap: calendarCtrl.reload,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )));
  }
}
