import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rosses_mobile_master/app/view/auth/AuthCasesView.dart';

enum JwtState { AUTHENTICATED, UNAUTHENTICATED }

class Jwt {
  static bool isAuthorized;

  void check() {
    var jwtString =  GetStorage().read('jwt');

    if (jwtString == null) {
      isAuthorized = false;
    } else {
      var jwtArray = jwtString.split(".");
      var payload = json.decode(ascii.decode(base64.decode(base64.normalize(jwtArray[1]))));

      isAuthorized = DateTime.fromMillisecondsSinceEpoch(payload["exp"] * 1000).isAfter(DateTime.now());

    }
  }

  // void store(jwt) {
  //   GetStorage().write('jwt', jwt);
  // }
}

Future<String> getValue(String value) async {
  return await GetStorage().read('value');
}
