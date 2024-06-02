import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storysphere_mobileapp/constants/utils/color_constant.dart';
import 'package:storysphere_mobileapp/constants/utils/text_theme.dart';

extension ThemeContext on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
}

ThemeData get lightTheme => ThemeData(
    brightness: Brightness.light,
    fontFamily: 'Graphik',
    primaryColor: ColorConstants.backgroundColor,
    useMaterial3: true,
    scaffoldBackgroundColor: ColorConstants.backgroundColor,
    splashFactory: NoSplash.splashFactory,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: getColorSchemePrimary,
      secondary: getColorSchemeSecondary,
      onSecondary: getColorSchemeSecondary,
      onPrimary: getColorSchemePrimary,
      error: Colors.red,
      onError: Colors.red,
      background: ColorConstants.backgroundColor,
      onBackground: ColorConstants.backgroundColor,
      surface: const Color(0xfffffff),
      onSurface: const Color(0x000000ff),
    ),
    appBarTheme: AppBarTheme(
      color: ColorConstants.redMain,
      iconTheme: IconThemeData(color: Colors.grey[100]),
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      titleTextStyle: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w700,
        color: ColorConstants.textColorGrey,
      ),
    ),
    textTheme: StorySphereTextTheme(),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.white,
      enabledBorder: OutlineInputBorder(
        gapPadding: 120.r,
        borderSide: BorderSide(width: 1, color: ColorConstants.borderCardColor),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      focusColor: ColorConstants.btnPrimary,
      iconColor: ColorConstants.btnPrimary,
      hoverColor: ColorConstants.btnPrimary,
      prefixIconColor: ColorConstants.btnPrimary,
      filled: true,
      labelStyle: TextStyle(
        fontSize: 16.sp,
        color: ColorConstants.textColorLight,
      ),
      border: OutlineInputBorder(
        gapPadding: 120.r,
        borderSide: BorderSide(width: 1, color: ColorConstants.borderCardColor),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      hintStyle: TextStyle(
          color: ColorConstants.btnPrimary, fontWeight: FontWeight.w400),
      disabledBorder: OutlineInputBorder(
        gapPadding: 120.r,
        borderSide: BorderSide(width: 1, color: ColorConstants.borderCardColor),
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
    ),
    buttonTheme:
        const ButtonThemeData(buttonColor: ColorConstants.buttonPurple),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateColor.resolveWith(
          (states) => ColorConstants.buttonPurple,
        ),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        textStyle: MaterialStateProperty.all<TextStyle>(
          TextStyle(
            fontSize: 16.sp,
            color: ColorConstants.textColorLight,
          ),
        ),
      ),
    ),
    checkboxTheme: CheckboxThemeData(
      checkColor: MaterialStateProperty.all(ColorConstants.textColorLight),
      fillColor: MaterialStateProperty.all(ColorConstants.buttonAqua),
    ),
    unselectedWidgetColor: ColorConstants.formColor,
    bottomSheetTheme: BottomSheetThemeData()
        .copyWith(dragHandleColor: ColorConstants.btnPrimary));
