import 'package:get_storage/get_storage.dart';

class Auth {
  String jwt;
  String phone;
  String login;
  String name;
  String role;
  String title;
// jwt, phone, login, userName, role
  Auth({jwt, phone, login, name, role, title})
      : jwt = GetStorage().read('jwt'),
        phone = GetStorage().read('phone'),
        login = GetStorage().read('login'),
        name = GetStorage().read('name'),
        role = GetStorage().read('role'),
        title = GetStorage().read('title');
}




