import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rosses_mobile_master/app/controller/AuthController.dart';
import 'package:rosses_mobile_master/route/app_pages.dart';

class AccountMasterAppBarActions extends StatelessWidget {

  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return
      Drawer(
        child: Container(
          color: Colors.indigo,
          child: ListView(
            children: [
              AppBarBtn(
                icon: Icons.person_pin_rounded,
                title: 'Анкета',
                route: Routes.ACCOUNT_PROFILE,
              ),
              Opacity(
                  opacity: GetStorage().read('rank_id') > 1 ? 1 : .5,
                  child: AppBarBtn(
                    icon: Icons.account_balance_wallet,
                    title: 'Кошелёк',
                    route: GetStorage().read('rank_id') > 1 ? Routes.ACCOUNT_WALLET : null,
                  ),
              ),
              Opacity(
                opacity: GetStorage().read('rank_id') > 1 ? 1 : .5,
                child: AppBarBtn(
                  icon: Icons.store,
                  title: 'Склад',
                  route: GetStorage().read('rank_id') > 1 ? Routes.ACCOUNT_STORE : null,
                ),
              ),
              ListTile(
                  title: Text(
                    'Выход',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  leading: Icon(
                    Icons.exit_to_app,
                    color: Colors.white70,
                  ),
                  onTap: () => authController.onLogout()),
            ],
          ),
        ),
      );
  }
}
// Get.toNamed(Routes.AUTH_CASES)
class AppBarBtn extends StatelessWidget {
  final title;
  final icon;
  final route;

  AppBarBtn({this.title, this.icon, this.route});

  @override
  Widget build(BuildContext context) {
    if (route == Get.routing.current) {
      return ListTile(
          tileColor: Colors.white,
          title: Text(
            '$title',
            style: TextStyle(color: Colors.indigo, fontSize: 16),
          ),
          leading: Icon(
            icon,
            color: Colors.indigo,
          ),
          onTap: () => Get.toNamed(route));
    } else {
      return ListTile(
          title: Text(
            '$title',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          leading: Icon(
            icon,
            color: Colors.white70,
          ),
          onTap: () => Get.toNamed(route));
    }
  }
}

// Get.routing.current == Routes.ACCOUNT_PROFILE
