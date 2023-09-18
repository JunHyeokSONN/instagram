// import 'package:flutter/material.dart';
//
// var _var1;
//
// var theme = ThemeData(
//   // textButtonTheme: TextButtonThemeData(
//   //   style: TextButton.styleFrom(
//   //     backgroundColor: Colors.grey,
//   //   )
//   // ),
//   // elevatedButtonTheme: ElevatedButtonThemeData(style: ),
//   appBarTheme: AppBarTheme(
//     color: Colors.white,
//     elevation : 1,
//     actionsIconTheme: IconThemeData( color: Colors.black , ),
//     titleTextStyle: TextStyle( color: Colors.black , fontSize: 25), centerTitle: false,
//   ),
//   textTheme: TextTheme(
//     bodyText1: TextStyle(color: Colors.blue),
//     bodyText2: TextStyle(color: Colors.red),
//   ),
//   bottomNavigationBarTheme: BottomNavigationBarThemeData(
//     backgroundColor: Colors.white,
//     elevation: 10,
//     type: BottomNavigationBarType.fixed,
//     selectedIconTheme: IconThemeData(color: Colors.black),
//
//   ),
// );

import 'package:flutter/material.dart';

var _var1;

var theme = ThemeData(
  appBarTheme: AppBarTheme(
    color: Colors.white,
    elevation : 1,
    actionsIconTheme: IconThemeData( color: Colors.black , ),
    titleTextStyle: TextStyle( color: Colors.black , fontSize: 25), centerTitle: false,
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(color: Colors.blue),
    bodyText2: TextStyle(color: Colors.black),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: Colors.black,
  ),
);