import 'package:flutter/material.dart';

ThemeData appTheme = new ThemeData(
    primarySwatch: Colors.indigo,
    primaryColor: Colors.indigo[700],
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.indigo);

class AppColors {
  static final Color buttonColor = Colors.indigo[200];
  static final Color borderColor = Colors.white24;
  static final Color socialInfoAmount = Colors.white70;
  static final Color socialInfoName = Colors.white30;
}

class AppTextStyles {
  static final socialInfoAmount = new TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      height: 1.6,
      color: AppColors.socialInfoAmount);

  static final socialInfoName = new TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      height: 1.6,
      color: AppColors.socialInfoName);

  static final profileBio =
      new TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400, height: 1.2);

  static final profileName = new TextStyle(
      fontSize: 48.0, fontWeight: FontWeight.w300);

  static final button = new TextStyle(fontSize: 16.0);
}
