import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mrkt_app/utils/app_colors.dart';

const textTheme = TextTheme(
  headline1: TextStyle(fontSize: 25, color: Colors.black),
  headline2: TextStyle(fontSize: 20, color: Colors.black),
  headline3: TextStyle(fontSize: 18, color: Colors.black),
  headline4: TextStyle(fontSize: 15, color: Colors.black),
  headline5: TextStyle(fontSize: 13, color: Colors.black),
  headline6: TextStyle(fontSize: 11, color: Colors.black),
);

ThemeData lightAppTheme() {
  return ThemeData(
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        elevation: 0,
        titleTextStyle: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontFamily: 'SFProDisplayMedium'),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      primaryColor: AppColors.primaryColor,
      brightness: Brightness.light,
      fontFamily: 'Poppins-Regular',
      scaffoldBackgroundColor: Colors.white,
      textTheme: textTheme);
}
