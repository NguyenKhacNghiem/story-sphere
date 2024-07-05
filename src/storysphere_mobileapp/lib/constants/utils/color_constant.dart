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

  //TEXT
  static const primaryText = Color(0XFFFFFFFF);
  static const secondaryText = Color(0XFF9E9E9E);
  static const darkText = Color(0XFF000000);
  static const lightText = Color(0XFFFFFFFF);
  static const headingGreen = Color(0XFF0F7077);

  static const textLinkAqua = Color(0XFF44CCB0);
  static const textLinkPurple = Color(0XFFD505D8);
  static const textLinkFascia = Color(0XFFFF2998);
  static const brandedBlue = Color(0XFF05386B);
  static const textColorLight = Color.fromRGBO(242, 240, 237, 1); // #F2F0ED
  static const gradientGreen = Color(0XFF30C2A5);
  static const gradientBlue = Color(0XFF1D2865);
  static const gradientPurple = Color(0XFF710C7E);
  static const gradientFascia = Color(0XFFFE2C73);
  static const error = Colors.red;
  static const subTitleText = Color(0xFFF2F0ED);
  static const inactiveColor = Color(0xFF292828);
  static const favoriteColor = Color(0xFFFF0100);
  static const cardGroundColor = Color(0xFF252525);
  static const borderCardColor = Color(0xFFDDDDDD);
  static const confirmedStatusColor = Color(0xFF2C58DD);
  static const declinedStatusStatusColor = Color(0xFFFF0100);
  static const performedStatusColor = Color(0xFF31CA2C);
  static const notRepliedYetStatusColor = Color(0xFF4C4C4C);
  static const paidStatusColor = Color(0xFF31CA2C);
  static const disabledButtonFuscia = Color(0x20BD1F71);
  static const disabledButtonPurple = Color(0x40800682);
  static const disabledButtonAqua = Color(0x40379683);
  static const acceptColor = Color(0xFF4BAF4F);
  static const cardMusicProfileColor = Color(0xFF161616);
  static const appleLoginColor = Color(0x00000000);
  static const appleLoginColorTextBackground = Color(0x35393D);
  static const textColorGrey = Color(0xFF646464);
  static const primaryGreen = Color(0xFF54A72C);
  static const primaryGrey = Color(0xFF8797A3);
  static const mainDark = Color(0xFF1F3746);
  static const btnPrimary = Color(0xFF294658);
  static const btnPrimaryDisabled = Color(0xAA294658);
  static const grey = Color(0xFF969696);
  static const greyForeground = Color(0xFFF7F7F8);
  static const headerTitleDefault = Color(0xFF2B2B2B);
  static const headerBottomBorder = Color(0xFFEAF1FB);
  static const cardBorder = Color(0xFFE5EAF3);
  static const blueMain = Color(0xFF2572C6);
  static const blueMainForeground = Color(0xFFEEF1FE);
  static const pinkMain = Color(0xFFD381B1);
  static const pinkMainForeground = Color(0xFFFFF1F9);
  static const redMain = Color(0xFFE0403C);
  static const redMainForeground = Color(0xFFFFECEC);
  static const greenMain = Color(0xFF1A8C43);
  static const greenMainForeground = Color(0xFFE0EFE5);
  static const orangeMain = Color(0xFFE6B04E);
  static const orangeMainForeground = Color(0xFFFBF3E6);
  static const yellowMain = Color(0xFFFBBE4A);
  static const orange1 = Color(0xffF57F20);
  static const iconButtonBackground = Color(0xFFECEDF0);
  static const yellow1 = Color(0xFFE8AD3D);
  static const grey1 = Color(0xFFDDDDDD);
  static const darkBlack = Color.fromRGBO(7, 7, 14, 1);
}

class AppController extends ChangeNotifier {
  static SelectedProfile get selectedProfile => SelectedProfile.artist;
}

enum SelectedProfile { fan, artist, venue }

//getting the color scheme for every other app
Color get getColorSchemePrimary => ColorConstants.btnPrimary;

Color get getColorSchemeSecondary => ColorConstants.btnPrimary;
