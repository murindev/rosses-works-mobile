import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:rosses_mobile_master/model/account/AccountProfile.dart';
import 'package:rosses_mobile_master/shared/settings.dart';
import 'package:http_parser/http_parser.dart';

class AccountProfileRepo {
  AccountProfileApi _accountProfileApi = AccountProfileApi();

  Future getProfile() => _accountProfileApi.getProfile();
/*  Future putProfileFields(payload) => _accountProfileApi.putProfileFields(payload);
  Future postProfileFields(payload) => _accountProfileApi.postProfileFields(payload);
  Future postProfileFieldRemove(data,field) => _accountProfileApi.postProfileFieldRemove(data,field);
  Future postProfilePhoto(filePath, user) => _accountProfileApi.postProfilePhoto(filePath, user);*/
}

class AccountProfileApi {

  final headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer ${GetStorage().read('jwt')}'
  };

  Future getProfile() async {
    final response = await http.get('$BACKEND/mobile/profile',  headers: headers);
    if (response.statusCode == 201 || response.statusCode == 200) {
      return await jsonDecode(response.body);
    } else {
      throw Exception('Error fetching profile');
    }
  }

// change
  Future putProfileFields(data) async {

    final response = await http.put('$BACKEND/mobile/profile', headers: headers ,body:  data);
     print('response ${response.body}');

    if (response.statusCode == 201 || response.statusCode == 200) {
      return 200;
    } else {
      throw Exception('Error putting  profile');
    }

  }

  Future profileSubmit(data) async {

    final response = await http.post('$BACKEND/mobile/profile-notification', headers: headers ,body:  data);
    print('response ${response.body}');

    if (response.statusCode == 201 || response.statusCode == 200) {
      return 200;
    } else {
      throw Exception('Error putting  profile');
    }

  }

  Future profileSubmitUpdate() async {

    final response = await http.post('$BACKEND/mobile/profile-notification-update', headers: headers);
    print('response ${response.body}');

    if (response.statusCode == 201 || response.statusCode == 200) {
      return 200;
    } else {
      throw Exception('Error putting  profile');
    }

  }

// add
  Future postProfileFields(data) async {
    print('9999999 ${await data}');
    final response = await http.put('$BACKEND/mobile/profile', headers: headers,body:  data);

    print('postProfileFields ${response.body}');
    print('postProfileFields ${response.statusCode}');

    if (response.statusCode == 201 || response.statusCode == 200) {
      return 200;
    } else {
      print('-----');
      throw Exception('Error putting  profile');
    }

  }

  // remove

  Future postProfileFieldRemove(data,field) async {
    print('9999999 ${await data} ${await field}');
    final response = await http.delete('$BACKEND/mobile/profile/$data/$field', headers: headers);

    print('postProfileFieldRemove ${response.body}');

    if (response.statusCode == 201 || response.statusCode == 200) {
      return 200;
    } else {
      print('-----');
      throw Exception('Error putting  profile');
    }

  }

  Future postProfilePhoto(File filePath, user) async {
    print('9999999 ${await filePath.path}');
    var postUri = Uri.parse("$BACKEND/mobile/profile-avatar");
    var request = new http.MultipartRequest("POST", postUri);
    request.headers.addAll(headers);
    // request.fields.addAll({'user': user});
    request.files.add(await http.MultipartFile.fromPath(
        'photo', filePath.path, contentType: MediaType('image', 'jpeg')));
    var response = await request.send();

    print('88888 ${response}');

    if (response.statusCode == 201 || response.statusCode == 200)

      return response.statusCode;
    else
      print('response.statusCode ${response.statusCode}');

  }

  }

