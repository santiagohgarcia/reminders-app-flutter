// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

var appTheme = ThemeData(
    brightness: Brightness.light,
    visualDensity: VisualDensity(vertical: 0.5, horizontal: 0.5),
    primarySwatch: MaterialColor(
      0xff3949ab,
      <int, Color>{
        50: Color.fromRGBO(57, 73, 171, .1),
        100: Color.fromRGBO(57, 73, 171, .2),
        200: Color.fromRGBO(57, 73, 171, .3),
        300: Color.fromRGBO(57, 73, 171, .4),
        400: Color.fromRGBO(57, 73, 171, .5),
        500: Color.fromRGBO(57, 73, 171, .6),
        600: Color.fromRGBO(57, 73, 171, .7),
        700: Color.fromRGBO(57, 73, 171, .8),
        800: Color.fromRGBO(57, 73, 171, .9),
        900: Color.fromRGBO(57, 73, 171, 1),
      },
    ),
    primaryColor: Color(0xff3949ab),
    primaryColorBrightness: Brightness.light,
    primaryColorLight: Color(0xff3949ab),
    primaryColorDark: Color(0xff3949ab),
    canvasColor: Color(0xffE1E2E1),
    accentColor: Color(0xffE1E2E1), 
    accentColorBrightness: Brightness.light,
    scaffoldBackgroundColor: Color(0xffB5BFD3),
    bottomAppBarColor: Color(0xff3949ab),
    cardColor: Colors.white,
    dividerColor: Color(0x1f6D42CE),
    focusColor: Color(0x1aF5E0C3));



