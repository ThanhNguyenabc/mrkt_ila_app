import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mrkt_app/utils/app_colors.dart';
import 'package:mrkt_app/utils/constants.dart';

const lightTextTheme = TextTheme(
  headline1: TextStyle(fontSize: 25, color: Colors.black),
  headline2: TextStyle(fontSize: 20, color: Colors.black),
  headline3: TextStyle(fontSize: 18, color: Colors.black),
  headline4: TextStyle(fontSize: 15, color: Colors.black),
  headline5: TextStyle(fontSize: 13, color: Colors.black),
  headline6: TextStyle(fontSize: 11, color: Colors.black),
  bodyText1: TextStyle(fontSize: 9, color: Colors.black),
);

const darkTextTheme = TextTheme(
  headline1: TextStyle(fontSize: 25, color: Colors.white),
  headline2: TextStyle(fontSize: 20, color: Colors.white),
  headline3: TextStyle(fontSize: 18, color: Colors.white),
  headline4: TextStyle(fontSize: 15, color: Colors.white),
  headline5: TextStyle(fontSize: 13, color: Colors.white),
  headline6: TextStyle(fontSize: 11, color: Colors.white),
  bodyText1: TextStyle(fontSize: 9, color: Colors.white),
);

class IlaAppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.light,
          elevation: 0,
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(
              fontSize: 18, color: Colors.black, fontFamily: mediumFont),
          iconTheme: IconThemeData(color: Colors.black),
        ),
        typography: Typography(),
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
        inputDecorationTheme:
            const InputDecorationTheme(fillColor: Colors.white),
        iconTheme: const IconThemeData(color: Colors.black),
        dividerColor: AppColors.alto,
        textTheme: lightTextTheme);
  }

  static ThemeData get darkTheme {
    return ThemeData(
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          elevation: 0,
          backgroundColor: AppColors.rhino,
          titleTextStyle: TextStyle(
              fontSize: 18, color: Colors.white, fontFamily: mediumFont),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        typography: Typography(),
        bottomSheetTheme: const BottomSheetThemeData(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)))),
        dialogTheme: const DialogTheme(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)))),
        primaryColor: AppColors.rhino,
        brightness: Brightness.dark,
        fontFamily: 'Poppins-Regular',
        inputDecorationTheme:
            const InputDecorationTheme(fillColor: Colors.transparent),
        scaffoldBackgroundColor: AppColors.rhino,
        iconTheme: const IconThemeData(color: Colors.white),
        dividerColor: AppColors.alto,
        textTheme: darkTextTheme);
  }
}
