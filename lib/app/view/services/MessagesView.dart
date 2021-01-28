import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rosses_mobile_master/app/controller/services/NotificationsController.dart';
import 'package:rosses_mobile_master/route/app_pages.dart';

class MessageView extends StatelessWidget {

  NotificationsController notificationsController = Get.put(NotificationsController());



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(' Сообщение'), leading: Icon(Icons.message),),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              children: [
                Obx(() => Text('${notificationsController.message.value}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                )),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Obx(() => RaisedButton(
                      child: Text(notificationsController.type.value ? 'Обновить' : 'Вернуться', style: TextStyle(fontSize: 18)),
                      onPressed: () => notificationsController.type.value ? Get.offNamed(Routes.ACCOUNT_HOME) : Get.back(),
                      color: Colors.indigo,
                      textColor: Colors.white,
                      elevation: 5,
                    )) ,
                  ),
                )
              ],
            ) , // ${Get.arguments}
          ),
        ),
      )


/*      Container(
        child: Obx(() => Text('${notificationsController.message.value}' )) , // ${Get.arguments}
      ),*/
    );
  }
}