import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:rosses_mobile_master/model/account/AccountProfile.dart';
import 'package:rosses_mobile_master/model/crm/__/Implement.dart';
import 'package:rosses_mobile_master/model/master/ImplementsSchedule.dart';
import 'package:rosses_mobile_master/shared/settings.dart';
import 'package:http_parser/http_parser.dart';

class MasterRepo {
  final headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  Future getTodayImplementsList() async {
    try {
      final response = await http.get(
          '$CRM/mobile-master?func=implementsList&master=${await GetStorage().read('masterId')}',
          headers: headers);
      if (response.statusCode == 201 || response.statusCode == 200) {
        return response.body;
      } else {
        throw Exception('Error fetching getTodayImplementsList');
      }
    } on SocketException {
      print('getTodayImplementsList SocketException $SocketException ');
    } on Exception catch (error) {
      print('getTodayImplementsList Exception ${error.toString()} ');
    }
  }

  Future getImplementsListByDate(date) async {
    try {
      final response = await http.get(
          '$CRM/mobile-master?func=implementsList&master=${await GetStorage().read('masterId')}&date=${await date}',
          headers: headers);

       print('response.body ${response.body}');

      if (response.statusCode == 201 || response.statusCode == 200) {
        return response.body;
      } else {
        throw Exception('Error fetching getTodayImplementsList');
      }
    } on SocketException {
      print('getTodayImplementsList SocketException $SocketException ');
    } on Exception catch (error) {
      print('getTodayImplementsList Exception ${error.toString()} ');
    }
  }

  Future getImplementById(id) async {
    try {
      final response = await http.post(
          '$CRM/mobile-master?func=implementById&id=${await id}',
          headers: headers);

       print('getImplementById ${json.decode(response.body)}');

      if (response.statusCode == 201 || response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Error fetching getImplementById');
      }
    } on SocketException {
      print('getImplementById SocketException $SocketException ');
      return '';
    } on Exception catch (error) {
      print('getImplementById Exception ${error.toString()} ');
      return '';
    }
  }


  Future onStepDeparture(actId,implementId) async {
    try {
      final response = await http.get(
          '$CRM/mobile-master?func=onStepDeparture&id=${await implementId}&act_id=${await actId}',
          headers: headers);

      if (response.statusCode == 201 || response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Error fetching getTodayImplementsList');
      }
    } on SocketException {
      print('getImplementById SocketException ${SocketException} ');
      return '';
    } on Exception catch (error) {
      print('getImplementById Exception ${error.toString()} ');
      return '';
    }
  }

  Future onStepArrived(actId,implementId) async {
    try {
      final response = await http.get(
          '$CRM/mobile-master?func=onStepArrived&id=${await implementId}&act_id=${await actId}',
          headers: headers);

      if (response.statusCode == 201 || response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Error fetching onStepArrived');
      }
    } on SocketException {
      print('onStepArrived SocketException ${SocketException} ');
      return '';
    } on Exception catch (error) {
      print('onStepArrived Exception ${error.toString()} ');
      return '';
    }
  }

  Future onStepAudit(actId,implementId) async {
    try {
      final response = await http.get(
          '$CRM/mobile-master?func=onStepAudit&id=${await implementId}&act_id=${await actId}',
          headers: headers);

      if (response.statusCode == 201 || response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Error fetching onStepArrived');
      }
    } on SocketException {
      print('onStepArrived SocketException ${SocketException} ');
      return '';
    } on Exception catch (error) {
      print('onStepArrived Exception ${error.toString()} ');
      return '';
    }
  }


  Future onAuditPhotoSave(File filePath) async {

    var implementId = await GetStorage().read('implementId');

    var postUri = Uri.parse("$CRM/mobile-master");
    var request = new http.MultipartRequest("POST", postUri);
    request.headers.addAll(headers);

    request.fields.addAll({'func':'onAuditPhotoSave','implement_id': implementId.toString()});
    request.files.add(await http.MultipartFile.fromPath('file', filePath.path, contentType: MediaType('image', 'jpeg')));
    var response = await request.send();

     print('response.request ${response.reasonPhrase}');



    if (response.statusCode == 201 || response.statusCode == 200) {
      print('response ${response.statusCode}');
      print('response ${response}');
      return response.statusCode;
    }
    else
      print('response.statusCode ${response.statusCode}');

  }


  Future onActSave(File filePath) async {

    var implementId = await GetStorage().read('implementId');

    var postUri = Uri.parse("$CRM/mobile-master");
    var request = new http.MultipartRequest("POST", postUri);
    request.headers.addAll(headers);

    request.fields.addAll({'func':'onContractFileSave','implement_id': implementId.toString()});
    request.files.add(await http.MultipartFile.fromPath('file', filePath.path, contentType: MediaType('image', 'jpeg')));
    var response = await request.send();
    print('response.request ${response.reasonPhrase}');

    if (response.statusCode == 201 || response.statusCode == 200) {
      print('response ${response.statusCode}');
      print('response ${response}');
      return response.statusCode;
    }
    else
      print('response.statusCode ${response.statusCode}');

  }


  Future onStepFinished(actId,implementId) async {
    try {
      final response = await http.get(
          '$CRM/mobile-master?func=onStepFinished&id=${await implementId}&act_id=${await actId}',
          headers: headers);

      if (response.statusCode == 201 || response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Error fetching onStepFinished');
      }
    } on SocketException {
      print('onStepFinished SocketException ${SocketException} ');
      return '';
    } on Exception catch (error) {
      print('onStepFinished Exception ${error.toString()} ');
      return '';
    }
  }



  Future onRecordSave(File filePath) async {

    var implementId = await GetStorage().read('implementId');

    var postUri = Uri.parse("$CRM/mobile-master");
    var request = new http.MultipartRequest("POST", postUri);
    request.headers.addAll(headers);

    request.fields.addAll({'func':'onRecordSave','implement_id': implementId.toString()});
    request.files.add(await http.MultipartFile.fromPath('file', filePath.path, contentType: MediaType('audio', 'mpeg')));
    var response = await request.send();
    print('response.request ${response.reasonPhrase}');

    if (response.statusCode == 201 || response.statusCode == 200) {
      print('response ${response.statusCode}');
      print('response ${response}');
      return response.statusCode;
    }
    else
      print('response.statusCode ${response.statusCode}');

  }


/*  For example :
  from this :
  final file = await MultipartFile.fromFile(filePath);
  to this :
  final file = MultipartFile.fromBytes(File(filePath).readAsBytesSync(), filename: filePath.split("/").last);*/



  Future onImplementsByMonth(firstDate,lastDate) async {
    try {
      final response = await http.get('$CRM/mobile-master'
          '?func=implementsByMonth'
          '&masterId=${await GetStorage().read('masterId')}'
          '&firstDate=$firstDate&lastDate=$lastDate',
          headers: headers);
      print('response.body ${response.body}');
      if (response.statusCode == 201 || response.statusCode == 200) {

        return json.decode(response.body);
      } else {
        throw Exception('Error fetching onImplementsByMonth');
      }
    } on SocketException {
      print('onImplementsByMonth SocketException ${SocketException} ');
      return '';
    } on Exception catch (error) {
      print('onImplementsByMonth Exception ${error.toString()} ');
      return '';
    }
  }








}
