import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:rosses_mobile_master/app/repo/AccountProfileRepo.dart';
import 'package:rosses_mobile_master/app/view/account/profile/AccountProfileView.dart';
import 'package:rosses_mobile_master/route/app_pages.dart';

class ProfilePhoto extends StatefulWidget {
  final userId;
  ProfilePhoto(this.userId): super();

  @override
  _ProfilePhotoState createState() => _ProfilePhotoState(userId);
}

class _ProfilePhotoState extends State<ProfilePhoto> {

  final _userId;
  _ProfilePhotoState(this._userId);

  File _image;
  final picker = ImagePicker();

  Future getPhoto() async {

    final pickedFile = await picker.getImage(source: ImageSource.camera, maxHeight: 500,imageQuality: 100);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);

      } else {
        print('No image selected.');
      }
    });
  }

  Future savePhoto() async {

    AccountProfileApi accountProfileApi = AccountProfileApi();

    try {
      var  _res = await accountProfileApi.postProfilePhoto(_image,'$_userId');

      if (await _res == 200 || await _res == 201) {
        Get.offAndToNamed(Routes.ACCOUNT_PROFILE);
/*        setState(() {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AccountProfileView())
          );
        });*/
      }
    } catch(error){
      setState(() {
        Text('error');
      });
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: _image == null ? null : RawMaterialButton(
              onPressed: savePhoto,
              elevation: 2.0,
              fillColor: Colors.indigo,
              child: Icon(
                Icons.done,
                size: 32.0,
              ),
              // padding: EdgeInsets.all(15.0),
              shape: CircleBorder(),
              constraints: BoxConstraints.tight(Size(40, 40)),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 26, horizontal: 0),
        child: Center(
          child:
          _image == null ? Text('Сделайте фото.') : Image.file(_image),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo,
        onPressed: getPhoto,
        tooltip: 'Pick Image',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
}
