import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mrkt_app/utils/app_colors.dart';
import 'package:mrkt_app/utils/constants.dart';

const textTheme = TextTheme(
  headline1: TextStyle(fontSize: 25, color: Colors.black),
  headline2: TextStyle(fontSize: 20, color: Colors.black),
  headline3: TextStyle(fontSize: 18, color: Colors.black),
  headline4: TextStyle(fontSize: 15, color: Colors.black),
  headline5: TextStyle(fontSize: 13, color: Colors.black),
  headline6: TextStyle(fontSize: 11, color: Colors.black),
);

ThemeData lightTheme() {
  return ThemeData(
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        elevation: 0,
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(
            fontSize: 18, color: Colors.black, fontFamily: mediumFont),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)))),
      dialogTheme: const DialogTheme(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)))),
      primaryColor: AppColors.primaryColor,
      brightness: Brightness.light,
      fontFamily: 'Poppins-Regular',
      scaffoldBackgroundColor: Colors.white,
      textTheme: textTheme);
}

ThemeData darkTheme() {
  return ThemeData(
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        elevation: 0,
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(
            fontSize: 18, color: Colors.black, fontFamily: mediumFont),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)))),
      dialogTheme: const DialogTheme(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)))),
      primaryColor: AppColors.primaryColor,
      brightness: Brightness.dark,
      fontFamily: 'Poppins-Regular',
      scaffoldBackgroundColor: AppColors.emperor,
      textTheme: textTheme);
}
