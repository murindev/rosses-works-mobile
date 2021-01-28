import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonRed extends StatelessWidget {
  final String text;
  final String route;
  final padding;

  ButtonRed({this.text, this.route, this.padding = const EdgeInsets.only(bottom: 8)});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: SizedBox(
        width: double.infinity,
        child: RaisedButton(
          color: Colors.red,
          child: Text(
            text,
            style: TextStyle(fontSize: 18),
          ),
          textColor: Colors.white,
          onPressed: () => {Get.toNamed(route)},
        ),
      ),
    );
  }
}

class ButtonIndigo extends StatelessWidget {
  final String text;
  final String route;
  final padding;

  ButtonIndigo(
      {this.text, this.route, this.padding = const EdgeInsets.only(bottom: 8)});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: SizedBox(
        width: double.infinity,
        child: RaisedButton(
          color: Colors.indigo,
          child: Text(
            text,
            style: TextStyle(fontSize: 18),
          ),
          textColor: Colors.white,
          onPressed: () => {Get.toNamed(route)},
        ),
      ),
    );
  }
}


class ButtonFlatSized extends StatelessWidget {
  final String text;
  final String route;
  final padding;
  final fontSize;

  ButtonFlatSized(
      {this.text, this.route, this.padding = const EdgeInsets.only(bottom: 8), this.fontSize = 14.0});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: SizedBox(
        width: double.infinity,
        child: FlatButton(
            child: Text(text,
                style: TextStyle(fontSize: fontSize)),
            onPressed: () => {Get.toNamed(route)}),
      ),
    );
  }
}




