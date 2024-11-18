//function that return texts styles
import 'package:flutter/cupertino.dart';
import 'package:tutapp/presentaion/font_manager.dart';

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color) {
  return TextStyle(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
    fontFamily: FontConstants.fontFamily,
  );
}

//function that return regular text style
TextStyle getRegularTextStyle(
    {required double fontSize, required Color color}) {
  return _getTextStyle(fontSize, FontWeights.regular, color);
}

//function that return medium text style
TextStyle getMediumTextStyle({required double fontSize, required Color color}) {
  return _getTextStyle(fontSize, FontWeights.medium, color);
}

//function that return semi bold text style
TextStyle getSemiBoldTextStyle(
    {required double fontSize, required Color color}) {
  return _getTextStyle(fontSize, FontWeights.semiBold, color);
}

//function that return bold text style
TextStyle getBoldTextStyle({required double fontSize, required Color color}) {
  return _getTextStyle(fontSize, FontWeights.bold, color);
}

//function that return light text style
TextStyle getLightTextStyle({required double fontSize, required Color color}) {
  return _getTextStyle(fontSize, FontWeights.light, color);
}
