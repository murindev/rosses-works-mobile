import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:rosses_mobile_master/shared/settings.dart';

class AuthRepo {
  AuthApi _authApi = AuthApi();

  Future sendPhoneNumber(payload) => _authApi.sendPhoneNumber(payload);
  Future sendCodeNumber(payload) => _authApi.sendCodeNumber(payload);
  Future sendRegisterData(payload) => _authApi.sendRegisterData(payload);
  Future login(payload) => _authApi.login(payload);
  Future sendPassUpdateData(payload) => _authApi.sendPassUpdateData(payload);
}

class AuthApi {
  Future sendPhoneNumber(payload) async {
     print('sendPhoneNumber ${payload}');
    String phone = await payload.replaceAll(RegExp(r"[^0-9]+"), '');
    try {
      final response = await http.post('$BACKEND/auth/phone',
        headers: {
          'Accept': 'application/json',
        },
        body: {"phone": phone,"roles": '3','rank_id': '1'},
      );
      if (response.statusCode >= 200 && response.statusCode <= 204) {
         print('sendPhoneNumber ${response.body}');
        return 200;
      }
    } on SocketException {
      print('88SocketException888 ${SocketException} ');
    } on Exception catch (error) {
      print('error ${error.toString()}');
      return Future.error(error.toString());
    }
  }


  Future sendCodeNumber(payload) async {
     print('payloadpayloadpayload ${payload}');
    try {
      final response = await http.post('$BACKEND/auth/confirmation',
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        },
        body: json.encode(payload),
      );
      if (response.statusCode >= 200 && response.statusCode <= 204) {
        return 200;
      }
      if (response.statusCode == 206) {
        return response;
      }
    } on SocketException {
      print('88SocketException888 ${SocketException} ');
    } on Exception catch (error) {
      print(error.toString());
      return Future.error(error.toString());
    }
  }


  Future sendRegisterData(payload) async {
    print('payloadpayloadpayload ${payload}');
    try {
      final response = await http.post('$BACKEND/auth/register',
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        },
        body: json.encode(payload),
      );

      print('response.body ${response.body}');
      if (response.statusCode >= 200 && response.statusCode <= 204) {
        return response;
      }
    } on SocketException {
      print('88SocketException888 ${SocketException} ');
    } on Exception catch (error) {
      print(error.toString());
      return Future.error(error.toString());
    }
  }

  Future sendPassUpdateData(payload) async {
    try {
      final response = await http.post('$BACKEND/auth/pass',
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        },
        body: json.encode(payload),
      );

      print('response.body ${response.body}');
      if (response.statusCode >= 200 && response.statusCode <= 204) {
        return response;
      }
    } on SocketException {
      print('88SocketException888 ${SocketException} ');
    } on Exception catch (error) {
      print(error.toString());
      return Future.error(error.toString());
    }
  }


  Future login(payload) async {
    try {
      final response = await http.post('$BACKEND/auth/login',
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        },
        body: json.encode(payload),
      );
      return response;
/*       print('88888 ${response}');
      if (response.statusCode >= 200 && response.statusCode <= 204) {
        return response;
      } else {

      }*/
    } on SocketException {
      return 999;
    } on Exception catch (error) {
      return Future.error(error.toString());
    }
  }


}

