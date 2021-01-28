import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rosses_mobile_master/app/repo/MasterRepo.dart';
import 'package:rosses_mobile_master/model/master/ImplementsSchedule.dart';
import 'package:rosses_mobile_master/route/app_pages.dart';
import 'package:rosses_mobile_master/shared/settings.dart';
import 'package:rosses_mobile_master/shared/widgets/Loader.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record_mp3/record_mp3.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;


class MasterImplementController extends GetxController {
  final currentItem = ImplementsSchedule().obs;
  final currentStep = 0.obs;

  File image;

  MasterRepo masterRepo = MasterRepo();

  void onItemInit() async {
    var item = await masterRepo.getImplementById(await GetStorage().read('implementId'));
    ImplementsSchedule itemMap = ImplementsSchedule.fromJson(await item);
    currentItem(itemMap);
    await Get.offAllNamed(Routes.MASTER_IMPLEMENT);
  }

  @override
  void onInit() async {
    if (Get.arguments != null) {
      await GetStorage().write('implementId', Get.arguments);
    }
    onItemInit();
    print('GetStorage ${await GetStorage().read('implementId')}');
    print('onReady ${currentItem.value.toJson()}');
    super.onInit();
  }

  @override
  void onReady() async {
    ever(currentItem, (_) => print(currentItem.value.toJson()));

    super.onReady();
  }

  void onStepDeparture() async {
    var step = await masterRepo.onStepDeparture(currentItem.value.act.id, currentItem.value.id);
    ImplementsSchedule itemMap = ImplementsSchedule.fromJson(await step);
    currentItem(itemMap);
    currentStep(1);
    Get.back();
  }

  void onStepArrived() async {
    var step = await masterRepo.onStepArrived(currentItem.value.act.id, currentItem.value.id);
    ImplementsSchedule itemMap = ImplementsSchedule.fromJson(await step);
    currentItem(itemMap);
    currentStep(2);
    Get.back();
    startRecord();
  }

  void onStepAudit() async {
    var step = await masterRepo.onStepAudit(currentItem.value.act.id, currentItem.value.id);
    ImplementsSchedule itemMap = ImplementsSchedule.fromJson(await step);
    print('onStepAudit');
    currentItem(itemMap);
    currentStep(3);
    Get.back();
  }

  getPhoto() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.camera, maxHeight: 1200, imageQuality: 100);
    if (pickedFile != null) {
      try {
        var _res = await masterRepo.onAuditPhotoSave(File(pickedFile.path));
        if (await _res == 200 || await _res == 201) {
          print('_res ${_res}');
          var item = await masterRepo.getImplementById(await GetStorage().read('implementId'));
          ImplementsSchedule itemMap = ImplementsSchedule.fromJson(await item);
          currentItem(itemMap);
        }
      } catch (error) {
        print('error error ${error}');
      }
    } else {
      print('No image selected.');
    }
  }

  getScannedAct() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery, imageQuality: 100);
    if (pickedFile != null) {
      try {
        var _res = await masterRepo.onActSave(File(pickedFile.path));
        if (await _res == 200 || await _res == 201) {
          print('_res ${_res}');
          var item = await masterRepo.getImplementById(await GetStorage().read('implementId'));
          ImplementsSchedule itemMap = ImplementsSchedule.fromJson(await item);
          currentItem(itemMap);
        }
      } catch (error) {
        print('error error ${error}');
      }
    } else {
      print('No image selected.');
    }
  }

  void onStepFinished() async {
    var step = await masterRepo.onStepFinished(currentItem.value.act.id, currentItem.value.id);
    ImplementsSchedule itemMap = ImplementsSchedule.fromJson(await step);
    currentItem(itemMap);
    currentStep(2);
    Get.back();
    stopRecord();
    onRecordSave();
  }

  void onCallToCustomer() async {
    // var step = await masterRepo.onStepFinished(currentItem.value.act.id, currentItem.value.id);
    // ImplementsSchedule itemMap = ImplementsSchedule.fromJson(await step);
    // currentItem(itemMap);
    // currentStep(2);
    // Get.back();
    print('Совершить звонок на обьект');
  }

  Future<bool> checkPermission() async {
    if (!await Permission.microphone.isGranted) {
      PermissionStatus status = await Permission.microphone.request();
      if (status != PermissionStatus.granted) {
        return false;
      }
    }
    return true;
  }

  Future<String> getFilePath() async {
    Directory storageDirectory = await getApplicationDocumentsDirectory();
    String sdPath = storageDirectory.path + "/record";
    var d = Directory(sdPath);
    if (!d.existsSync()) {
      d.createSync(recursive: true);
    }
    return sdPath + "/act_${currentItem.value.act.id}.mp3";
  }

  void startRecord() async {
    String recordFilePath;
    bool hasPermission = await checkPermission();
    if (hasPermission) {
      print('Recording...');
      recordFilePath = await getFilePath();
      print('Recording...$recordFilePath');
      RecordMp3.instance.start(recordFilePath, (type) {
        print('Record error--->$type');
      });
    } else {
      print('No microphone permission...');
    }
  }

  void stopRecord() {
    bool s = RecordMp3.instance.stop();
    if (s) {
      print('Record complete');
    }
  }

  void onRecordSave() async {
    String recordFilePath = await getFilePath();
    try {
      var _res = await masterRepo.onRecordSave(File(recordFilePath));
      if (await _res == 200 || await _res == 201) {
        print('saved bbbbbbbbbbbbbbbbbbbbbbbbbbbbbb');
      }
    } catch (error) {
      print('error error ${error}');
    }
  }

  void onClientCallback() async {
    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $tkn',
    };
    try {
      final response = await http.get(
        'https://www.telestore.ru/rest/service/accounts/callback?service=11044&account=0801&name=Невлюдов Рамиль Маратович&number=79298297060',
          headers: headers);
      print('onClientCallback ${response.statusCode}');
      if (response.statusCode == 201 || response.statusCode == 200) {
         print('onClientCallback 2 ${json.decode(response.body)}');
      } else {
        throw Exception('Error fetching onClientCallback');
      }
    } on SocketException {
      print('onClientCallback SocketException ${SocketException} ');
    } on Exception catch (error) {
      print('onClientCallback Exception ${error.toString()} ');
    }
  }
}
