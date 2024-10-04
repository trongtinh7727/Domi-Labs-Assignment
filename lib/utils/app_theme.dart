import 'package:domi/utils/app_colors.dart';
import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  fontFamily: "Figtree",
  pageTransitionsTheme: const PageTransitionsTheme(builders: {
    TargetPlatform.android: CupertinoPageTransitionsBuilder(),
    TargetPlatform.iOS: CupertinoPageTransitionsBuilder()
  }),
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(width: 0.5, color: AppColors.borderColor),
    ),
    fillColor: AppColors.surfaceCard,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
    backgroundColor:
        MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
      if (states.contains(MaterialState.disabled)) {
        return AppColors.primaryInacctive;
      }
      return AppColors.primaryAcctive;
    }),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
      ),
    ),
    elevation: MaterialStateProperty.all(0),
    minimumSize: MaterialStateProperty.all(Size(0, 44)),
    padding: MaterialStateProperty.all(
      EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    ),
  )),
);
