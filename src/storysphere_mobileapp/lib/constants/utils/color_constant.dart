import 'package:flutter/material.dart';

class ColorConstants {
  const ColorConstants._();
  //BASICS
  static const transparent = Colors.transparent;
  static const black = Colors.black;

  //BACKGROUND - ELEMENTS
  static const darkGreenBackground = Color(0XFF092E34);
  static const bottomNavBackground = Color(0XFF0F7077);
  static const formStrokeColor = Color(0XFF9E9E9E);
  static const buttonDarkGreen = Color(0XFF0F7077);
  static const buttonPastelGreen = Color(0XFF85A8B0);
  static const tagYellow = Color(0XFFFFC93E);
  static const buttonLightGreen = Color(0XFF12979E);
  static const activeOrange = Color(0XFFE46C16);
  static const sliderGrey = Color(0XFFD9D9D9);
  static const bgWhite = Color(0XFFFFFFFF);
  static const bgLightYellowPaper = Color(0XFFFFECDE);
  static const bgPink = Color(0XFFE3BBB9);

  //TEXT
  static const primaryText = Color(0XFFFFFFFF);
  static const secondaryText = Color(0XFF9E9E9E);
  static const lighterSecondaryText = Color(0XFFD9D9D9);
  static const darkText = Color(0XFF000000);
  static const lightText = Color(0XFFFFFFFF);
  static const headingGreen = Color(0XFF0F7077);
  static const purpleLight = Color(0XFFB294F1);
  static const errorText = Color(0XFFFAFF00);

}

class AppController extends ChangeNotifier {
  static SelectedProfile get selectedProfile => SelectedProfile.artist;
}

enum SelectedProfile { fan, artist, venue }

//getting the color scheme for every other app
Color get getColorSchemePrimary => ColorConstants.buttonDarkGreen;

Color get getColorSchemeSecondary => ColorConstants.buttonPastelGreen;
