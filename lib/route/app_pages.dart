import 'package:get/get.dart';
import 'package:rosses_mobile_master/app/view/account/AccountStore.dart';
import 'package:rosses_mobile_master/app/view/account/AccountWallet.dart';
import 'package:rosses_mobile_master/app/view/auth/AuthPasswordUpdate.dart';
import 'package:rosses_mobile_master/app/view/master/MasterCalendar.dart';
import 'package:rosses_mobile_master/app/view/master/MasterCalendarDaySchedule.dart';
import 'package:rosses_mobile_master/app/view/master/MasterDaySchedule.dart';
import 'package:rosses_mobile_master/app/view/account/profile/forms/AccountProfileDateFormView.dart';
import 'package:rosses_mobile_master/app/view/account/profile/forms/AccountProfileEducationFormView.dart';
import 'package:rosses_mobile_master/app/view/account/profile/forms/AccountProfileEmploymentFormView.dart';
import 'package:rosses_mobile_master/app/view/account/profile/forms/AccountProfileTextFormView.dart';
import 'package:rosses_mobile_master/app/view/account/profile/forms/AccountProfilePhoneFormView.dart';
import 'package:rosses_mobile_master/app/view/auth/AuthCodeView.dart';
import 'package:rosses_mobile_master/app/view/account/AccountHomeView.dart';
import 'package:rosses_mobile_master/app/view/account/profile/AccountProfileView.dart';
import 'package:rosses_mobile_master/app/view/agreements/UserAgreementView.dart';
import 'package:rosses_mobile_master/app/view/auth/AuthCasesView.dart';
import 'package:rosses_mobile_master/app/view/auth/AuthPhoneView.dart';
import 'package:rosses_mobile_master/app/view/auth/AuthRegister.dart';
import 'package:rosses_mobile_master/app/view/auth/LoginView.dart';
import 'package:rosses_mobile_master/app/view/auth/LogoutView.dart';
import 'package:rosses_mobile_master/app/view/master/MasterImplementView.dart';
import 'package:rosses_mobile_master/app/view/services/MessagesView.dart';

class AppPages {
  static const INITIAL = Routes.ACCOUNT_HOME;
  static const LOGIN = Routes.AUTH_CASES;

  static final routes = [
    // login group
    GetPage(
      name: Routes.LOGIN,
      page: () => (LoginView()),
      // page: _checkRoute == true ? () =>  ( LoginView()) : () =>  ( AuthCasesView()) ,
    ),
    GetPage(
      name: Routes.LOGOUT,
      page: () => (LogoutView()),
    ),

    //auth
    GetPage(
      name: Routes.AUTH_CASES,
      page: () => AuthCasesView(),
    ),
    GetPage(
      name: Routes.AUTH_PHONE,
      page: () => (AuthPhoneView()),
    ),
    GetPage(
      name: Routes.AUTH_CODE,
      page: () => (AuthCodeView()),
    ),
    GetPage(
      name: Routes.AUTH_REGISTER,
      page: () => AuthRegisterView(),
    ),
    GetPage(
      name: Routes.AUTH_PASS_UPDATE,
      page: () => AuthPasswordUpdate(),
    ),
    // agreements
    GetPage(
      name: Routes.USER_AGREEMENT,
      page: () => UserAgreementView(),
    ),

    // account
    GetPage(
      name: Routes.ACCOUNT_HOME,
      page: () => AccountHomeView(),
    ),
    //account profile forms
    GetPage(
      name: Routes.ACCOUNT_PROFILE,
      page: () => AccountProfileView(),
    ),
    GetPage(
      name: Routes.ACCOUNT_WALLET,
      page: () => AccountWallet(),
    ),
    GetPage(
      name: Routes.ACCOUNT_STORE,
      page: () => AccountStore(),
    ),
    //account profile forms
    GetPage(
      name: Routes.ACCOUNT_PROFILE_TEXT,
      page: () => AccountProfileTextFormView(),
    ),
    GetPage(
      name: Routes.ACCOUNT_PROFILE_PHONE,
      page: () => AccountProfilePhoneFormView(),
    ),
    GetPage(
      name: Routes.ACCOUNT_PROFILE_DATE,
      page: () => AccountProfileDateFormView(),
    ),
    GetPage(
      name: Routes.ACCOUNT_PROFILE_EDUCATION,
      page: () => AccountProfileEducationFormView(),
    ),
    GetPage(
      name: Routes.ACCOUNT_PROFILE_EMPLOYMENT,
      page: () => AccountProfileEmploymentFormView(),
    ),

    //account -> master
    GetPage(
      name: Routes.MASTER_DAY_SCHEDULE,
      page: () => MasterDaySchedule(),
    ),
    GetPage(
      name: Routes.MASTER_IMPLEMENT,
      page: () => MasterImplementView(),
    ),
    GetPage(
      name: Routes.MASTER_CALENDAR,
      page: () => MasterCalendar(),
    ),
    GetPage(
      name: Routes.MASTER_CALENDAR_DAY,
      page: () => MasterCalendarDaySchedule(),
    ),

    // services

    GetPage(name: Routes.NOTIFICATION_MESSAGE, page: () => MessageView())
  ];
}

abstract class Routes {
  static const HOME = '/home';

  // login group
  static const LOGIN = '/login';
  static const LOGOUT = '/logout';

  //auth
  static const AUTH_CASES = '/auth_cases';
  static const AUTH_PHONE = '/auth_phone';
  static const AUTH_CODE = '/auth_code';
  static const AUTH_REGISTER = '/auth_register';
  static const AUTH_PASS_UPDATE = '/auth_pass_update';

  // agreements
  static const USER_AGREEMENT = '/user_agreement';

  //account
  static const ACCOUNT_HOME = '/account_home';
  static const ACCOUNT_PROFILE = '/account_profile';
  static const ACCOUNT_WALLET = '/account_wallet';
  static const ACCOUNT_STORE = '/account_store';

  //account profile forms
  static const ACCOUNT_PROFILE_TEXT = '/account_profile_text';
  static const ACCOUNT_PROFILE_PHONE = '/account_profile_phone';
  static const ACCOUNT_PROFILE_DATE = '/account_profile_date';
  static const ACCOUNT_PROFILE_EDUCATION = '/account_profile_education';
  static const ACCOUNT_PROFILE_EMPLOYMENT = '/account_profile_employment';

  //account -> master
  static const MASTER_DAY_SCHEDULE = '/master_day_schedule';
  static const MASTER_IMPLEMENT = '/master_implement';
  static const MASTER_CALENDAR = '/master_calendar';
  static const MASTER_CALENDAR_DAY = '/master_calendar_day';

  //services

  static const NOTIFICATION_MESSAGE = 'notification_message';
}
