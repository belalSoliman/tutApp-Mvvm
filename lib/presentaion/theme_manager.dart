//theme manager
import 'package:flutter/material.dart';
import 'package:tutapp/presentaion/color_manager.dart';
import 'package:tutapp/presentaion/font_manager.dart';
import 'package:tutapp/presentaion/styles_manager.dart';
import 'package:tutapp/presentaion/values_manager.dart';

ThemeData getAppTheme() {
  return ThemeData(
    //main colors
    primaryColor: ColorManager.primaryColor,
    primaryColorDark: ColorManager.black,
    primaryColorLight: ColorManager.white,
    disabledColor: ColorManager.grey,
    splashColor: ColorManager.primaryColor,

    //card view them
    cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.grey,
      elevation: AppSize.s4,
      margin: EdgeInsets.all(AppSize.s8),
    ),

    // appBar theme
    appBarTheme: AppBarTheme(
        centerTitle: true,
        color: ColorManager.primaryColor,
        elevation: AppSize.s4,
        titleTextStyle: getRegularTextStyle(
            fontSize: FontSizes.large, color: ColorManager.white)),

    //button theme
    buttonTheme: ButtonThemeData(
      buttonColor: ColorManager.primaryColor,
      shape: StadiumBorder(),
      disabledColor: ColorManager.grey,
      splashColor: ColorManager.white,
    ),
    //elvated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorManager.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12),
        ),
        textStyle: getRegularTextStyle(
            fontSize: FontSizes.large, color: ColorManager.white),
      ),
    ),
    //text theme
    textTheme: TextTheme(
      headlineLarge: getSemiBoldTextStyle(
          fontSize: AppSize.s16, color: ColorManager.darkGrey),
      headlineMedium:
          getMediumTextStyle(fontSize: AppSize.s14, color: ColorManager.grey),
    ),

    //input decoration theme(text form field)
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.all(AppSize.s8),
      hintStyle: getRegularTextStyle(
          fontSize: FontSizes.medium, color: ColorManager.grey),
      labelStyle: getRegularTextStyle(
          fontSize: FontSizes.medium, color: ColorManager.grey),
      errorStyle: getRegularTextStyle(
          fontSize: FontSizes.medium, color: ColorManager.errorColor),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSize.s12),
        borderSide: BorderSide(color: ColorManager.primaryColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
        borderSide: BorderSide(color: ColorManager.primaryColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
        borderSide: BorderSide(color: ColorManager.grey),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
        borderSide: BorderSide(color: ColorManager.errorColor),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSize.s12),
        borderSide: BorderSide(color: ColorManager.errorColor),
      ),
    ),
  );
}
