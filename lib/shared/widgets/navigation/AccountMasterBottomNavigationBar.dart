import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rosses_mobile_master/route/app_pages.dart';

class AccountMasterBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Routing routing;

    print('routing ${GetStorage().read('masterId')}');
    String current = Get.routing.current;

    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      child: Container(
        height: 60,
        color: Colors.red,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Opacity(
              opacity: GetStorage().read('rank_id') > 1 ? 1 : .5,
              child: IconButton(
                iconSize: 30.0,
                // padding: EdgeInsets.only(right: 28.0),
                icon: Icon(
                  Icons.calendar_view_day,
                  color: current == Routes.MASTER_CALENDAR ? Colors.white : Colors.black,
                ),
                // onPressed: () =>  Get.offAllNamed(Routes.MASTER_CALENDAR),
                onPressed: () => GetStorage().read('rank_id') > 1 ? Get.offAllNamed(Routes.MASTER_CALENDAR) : null,
              ),
            ),
            Opacity(
              opacity: GetStorage().read('rank_id') > 1 ? 1 : .5,
              child: IconButton(
                iconSize: 30.0,
                // padding: EdgeInsets.only(left: 28.0),
                icon: Icon(Icons.calendar_today, color: current == Routes.MASTER_DAY_SCHEDULE ? Colors.white : Colors.black),
                onPressed: () => GetStorage().read('rank_id') > 1 ? Get.offAllNamed(Routes.MASTER_DAY_SCHEDULE) : null,
              ),
            ),

            IconButton(
              iconSize: 30.0,
              // padding: EdgeInsets.only(right: 28.0),
              icon: Icon(Icons.account_circle, color: current == Routes.ACCOUNT_HOME ? Colors.white : Colors.black),
              onPressed: () => Get.toNamed(Routes.ACCOUNT_HOME),
            ),
          ],
        ),
      ),
    );
  }
}
