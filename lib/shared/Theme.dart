import 'package:flutter/material.dart';

class ThemeTpl {
  static final themeData =
  ThemeData(
    fontFamily: 'Cuprum',
    primarySwatch: Colors.red,

  );

  static backArrow(context) {
    return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () => Navigator.of(context).pop());
  }

  static personalMenu() {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
              title: Text('Анкета'),
              leading: Icon(
                Icons.calendar_today,
              ),
              onTap:
                  () {} // {Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));},
          ),
          ListTile(
              title: Text('Кошелёк'),
              leading: Icon(
                Icons.calendar_today,
              ),
              onTap:
                  () {} // {Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));},
          ),
          ListTile(
              title: Text('Магазин'),
              leading: Icon(
                Icons.calendar_today,
              ),
              onTap:
                  () {} // {Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));},
          ),
          ListTile(
              title: Text('Выход'),
              leading: Icon(
                Icons.arrow_back_ios,
              ),
              onTap:
                  () {

                // Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
              } // {Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));},
          ),
        ],
      ),
    );
  }
}