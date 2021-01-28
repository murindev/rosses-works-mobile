import 'package:flutter/material.dart';
import 'package:get/get.dart';

confirmDialog(middleText,callback,title) {
  return Get.defaultDialog(
    onConfirm: callback,
    middleText: middleText,
    title: title == null ? 'Подтверждение действия' : title,
    textCancel: 'Отмена',
    textConfirm: 'Да',
    confirmTextColor: Colors.white,
    barrierDismissible: false,
    radius: 5,
  );
}


/*
onConfirm: () => {},
middleText: "Подтерждаете выезд по адресу?",
title: 'Подтверждение действия',
textCancel: 'Отмена',
textConfirm: 'Да',
confirmTextColor: Colors.white,
barrierDismissible: false,
radius: 5,*/
