import 'package:flutter/material.dart';

class AppColors {
  static ThemeMode currentMode = ThemeMode.light;

  static const boulder = Color(0xFF7A7A7A);
  static const primaryColor = Color(0xFF2F69EC);
  static const alto = Color(0xFFD1D1D1);
  static const gigas = Color(0xFF3D3D8D);
  static const gray = Color(0xFF848484);
  static const resolutionBlue = Color(0xFF00327D);
  static const havelockBlue = Color(0xFF5997E0);
  static const emperor = Color(0xFF555555);
  static const toryBlue = Color(0xFF153E9A);
  static const lorchmara = Color(0xFF0174C7);
  static const violet = Color(0xFF814DEF);
  static const magenta = Color(0xFFF363EE);
  static const smalt = Color(0xFF00388B);
  static const scorpion = Color(0xFF5E5E5E);
  static const gray90 = Color(0xFF909090);
  static const electricViolet = Color(0xFF7536FC);
  static const alizarinCrimson = Color(0xFFE42F2F);
  static const saffron = Color(0xFFF7C927);
  static const fruitSalad = Color(0xFF56B14E);
  static const niagara = Color(0xFF08ACA2);
  static const moddyBlue = Color(0xFF7A7ACC);
  static const scooter = Color(0xFF21B9DB);
  static const seashell = Color(0xFFF1F1F1);
  static const kleinBlue = Color(0xFF00229C);
  static const red = Color(0xFFFF0000);
  static const blueChalk = Color(0xFFF4DEFF);
  static const island = Color(0xFFFFFBEE);
  static const milkPunch = Color(0xFFFFF6D9);
  static const clearDay = Color(0xFFEFFFFC);
  static const frostedMint = Color(0xFFDBFFF8);
  static const whitePointer = Color(0xFFFAF0FF);
  static const zumthor = Color(0xFFE6EDFF);
  static const anakiwa = Color(0xFF98DAFF);
  static const portage = Color(0xFF9366F2);
  static const dogerblue = Color(0xFF3EB9FF);
  static const balzeOrange = Color(0xFFFF6600);
  static const melrose = Color(0xFFB09FFF);

  static const rhino = Color(0xFF2C2F5C);
  static const solitude = Color(0xFFE2EEFF);
  static const eastbay = Color(0xFF4D507E);
  static const malibu = Color(0xFF4CBCFC);
}

extension AppColorScheme on ColorScheme {
  Color get primaryColor => AppColors.primaryColor;
  Color get primaryTextColor =>
      brightness == Brightness.light ? AppColors.primaryColor : Colors.white;

  Color get bottomUnActiveColor =>
      brightness == Brightness.light ? Colors.black : Colors.white;
  Color get bottomActiveColor =>
      brightness == Brightness.light ? AppColors.gigas : AppColors.solitude;
  Color get commonColor =>
      brightness == Brightness.light ? Colors.white : AppColors.eastbay;
  Color get testListItemDesBgColor => brightness == Brightness.light
      ? AppColors.electricViolet
      : AppColors.malibu;
  Color get profileTitleColor =>
      brightness == Brightness.light ? AppColors.gigas : AppColors.solitude;
  Color get settingLinks => brightness == Brightness.light
      ? Colors.black.withOpacity(0.5)
      : AppColors.solitude;
  Color get selectedAppearanceColor =>
      brightness == Brightness.light ? Colors.black : Colors.white;
  Color get editCEFRIconColor => brightness == Brightness.light
      ? AppColors.electricViolet
      : AppColors.solitude;
}
