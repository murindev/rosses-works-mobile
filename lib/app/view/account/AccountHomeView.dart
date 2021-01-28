import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rosses_mobile_master/app/controller/account/AccountProfileController.dart';
import 'package:rosses_mobile_master/app/view/test/test1.dart';
import 'package:rosses_mobile_master/app/view/test/test2.dart';
import 'package:rosses_mobile_master/route/app_pages.dart';
import 'package:rosses_mobile_master/shared/widgets/navigation/AccountMasterAppBarActions.dart';
import 'package:rosses_mobile_master/shared/widgets/navigation/AccountMasterBottomNavigationBar.dart';

class AccountHomeView extends StatelessWidget {

  final AccountProfileController acc = Get.put(AccountProfileController());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        resizeToAvoidBottomInset: false,
        endDrawer: AccountMasterAppBarActions(),
        appBar: AppBar(
          title: Text('Личный кабинет'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Container(
                // width: E,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Text(
                      'Добро пожаловать в личный кабинет \n\n Ваш статус "${GetStorage().read('rank_name')}" ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              if(GetStorage().read('rank_id') == 1)
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: Text(
                        'После собеседования Вам будет предложено пройти обучение и практику, перед тем как Вы приступите к работе и Вам станет доступен весь функционал приложения!',
                        style: TextStyle( fontSize: 16),
                      ),
                    ),
                    Visibility(
                      visible: GetStorage().read('agreement'),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 16),
                            child: Text(
                              'Расскажите о себе - для этого необходимо заполнить анкету, после чего, наш отдел кадров свяжется с Вами в течении рабочего дня',
                              style: TextStyle( fontSize: 16),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 16),
                            child: SizedBox(
                              width: double.infinity,
                              child: RaisedButton(
                                child: Text(
                                  'Заполнить анкету',
                                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                ),
                                color: Colors.indigo,
                                onPressed: () => Get.toNamed(Routes.ACCOUNT_PROFILE),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AccountMasterBottomNavigationBar());
  }
}
