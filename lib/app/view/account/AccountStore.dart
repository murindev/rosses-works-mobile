import 'package:flutter/material.dart';
import 'package:rosses_mobile_master/shared/widgets/navigation/AccountMasterAppBarActions.dart';
import 'package:rosses_mobile_master/shared/widgets/navigation/AccountMasterBottomNavigationBar.dart';
class AccountStore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        endDrawer: AccountMasterAppBarActions(),
        appBar: AppBar(
          title: Text('Склад'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(12.0),
        ),
        bottomNavigationBar: AccountMasterBottomNavigationBar()
    );
  }
}
