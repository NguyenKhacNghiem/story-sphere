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
    primaryColor: ColorConstants.darkGreenBackground,
    useMaterial3: true,
    scaffoldBackgroundColor: ColorConstants.darkGreenBackground,
    splashFactory: NoSplash.splashFactory,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: getColorSchemePrimary,
      secondary: getColorSchemeSecondary,
      onSecondary: getColorSchemeSecondary,
      onPrimary: getColorSchemePrimary,
      error: Colors.red,
      onError: Colors.red,
      background: ColorConstants.darkGreenBackground,
      onBackground: ColorConstants.darkGreenBackground,
      surface: const Color(0xfffffff),
      onSurface: const Color(0x000000ff),
    ),
    appBarTheme: AppBarTheme(
      color: ColorConstants.activeOrange,
      iconTheme: IconThemeData(color: Colors.grey[100]),
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      titleTextStyle: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w700,
        color: ColorConstants.secondaryText,
      ),
    ),
    textTheme: StorySphereTextTheme(),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.white,
      enabledBorder: OutlineInputBorder(
        gapPadding: 120.r,
        borderSide: BorderSide(width: 1, color: ColorConstants.formStrokeColor),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      focusColor: ColorConstants.buttonPastelGreen,
      iconColor: ColorConstants.buttonPastelGreen,
      hoverColor: ColorConstants.buttonPastelGreen,
      prefixIconColor: ColorConstants.buttonPastelGreen,
      filled: true,
      labelStyle: TextStyle(
        fontSize: 16.sp,
        color: ColorConstants.primaryText,
      ),
      border: OutlineInputBorder(
        gapPadding: 120.r,
        borderSide: BorderSide(width: 1, color: ColorConstants.formStrokeColor),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      hintStyle: TextStyle(
          color: ColorConstants.buttonPastelGreen, fontWeight: FontWeight.w400),
      disabledBorder: OutlineInputBorder(
        gapPadding: 120.r,
        borderSide: BorderSide(width: 1, color: ColorConstants.formStrokeColor),
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
    ),
    buttonTheme:
        const ButtonThemeData(buttonColor: ColorConstants.buttonDarkGreen),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateColor.resolveWith(
          (states) => ColorConstants.buttonDarkGreen,
        ),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        textStyle: MaterialStateProperty.all<TextStyle>(
          TextStyle(
            fontSize: 16.sp,
            color: ColorConstants.primaryText,
          ),
        ),
      ),
    ),
    checkboxTheme: CheckboxThemeData(
      checkColor: MaterialStateProperty.all(ColorConstants.primaryText),
      fillColor: MaterialStateProperty.all(ColorConstants.buttonPastelGreen),
    ),
    unselectedWidgetColor: ColorConstants.formStrokeColor,
    bottomSheetTheme: BottomSheetThemeData()
        .copyWith(dragHandleColor: ColorConstants.buttonPastelGreen));
