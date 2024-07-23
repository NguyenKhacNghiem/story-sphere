import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:storysphere_mobileapp/constants/utils/color_constant.dart';

class FontConstant {

  // BIG SHOULDERS TEXT
  static TextStyle titleBigDisplayWhite = GoogleFonts.bigShouldersText(
    textStyle: TextStyle(
      fontSize: 32.sp,
      fontWeight: FontWeight.w500,
      color: ColorConstants.lightText,

  ));
  
  
  static TextStyle resultTitleDisplay = titleBigDisplayWhite.copyWith(
    fontSize: 28.sp);

  static TextStyle titleBigDisplayGreen = titleBigDisplayWhite.copyWith(
    color: ColorConstants.headingGreen,
    fontWeight: FontWeight.bold,
  );

  static TextStyle headline1White = GoogleFonts.bigShouldersDisplay(
    textStyle: TextStyle(
      color: ColorConstants.lightText,
      fontSize: 24.sp,
      fontWeight: FontWeight.w500,
  ));

  static TextStyle headline2White = headline1White.copyWith(
    fontSize: 20.sp,
    fontWeight: FontWeight.w700,
  );

  static TextStyle headline2Light = headline2White.copyWith(
    fontWeight: FontWeight.w100,
  );

  static TextStyle userDisplayName = headline1White.copyWith(
    fontSize: 20.sp,
    fontWeight: FontWeight.w500,
  );
  static TextStyle chapterDisplay = headline1White.copyWith(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
  );


  //BE VIETNAM PRO

  static TextStyle subTitleText = GoogleFonts.beVietnamPro(
      textStyle: TextStyle(
        fontSize: 13.sp,
        fontWeight: FontWeight.w300,
        color: ColorConstants.lightText,
        height: 1.33.sp,
  ));

  static TextStyle darkSubtitle = subTitleText.copyWith(
      fontWeight: FontWeight.w200, 
      color: ColorConstants.secondaryText
  );

  static TextStyle voteReminder = subTitleText.copyWith(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: ColorConstants.lighterSecondaryText,
  );

  static TextStyle chapterNameItem = subTitleText.copyWith(
      fontWeight: FontWeight.bold,
      fontSize: 22.sp,
  );

  static TextStyle contentOutLine = subTitleText.copyWith(
    fontSize: 14,
  );

  static TextStyle categoryDescrip = subTitleText.copyWith(
    color: ColorConstants.secondaryText,
    fontWeight: FontWeight.w100,
    wordSpacing: 1.sp,
  );

  static TextStyle dataDisplay = subTitleText.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w700,
  );

  static TextStyle userNameText = subTitleText.copyWith(
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
  );

  static TextStyle userIntroduction = subTitleText.copyWith(
    color: ColorConstants.secondaryText,
    fontWeight: FontWeight.w100,
    fontSize: 12.sp,
    wordSpacing: 1.sp,
  );

  static TextStyle fromStoryLabel = userIntroduction.copyWith(
    fontSize: 13,
  );

  static TextStyle fromStorystoryName = fromStoryLabel.copyWith(
    fontWeight: FontWeight.bold,
  );
  
  static TextStyle bookTitleDisplay = subTitleText.copyWith(
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
    height: 1.0.sp,
  );

  static TextStyle bookTitleItem = subTitleText.copyWith(
    fontSize: 18.sp,
    fontWeight: FontWeight.bold,
    height: 1.0.sp,
  );

  static TextStyle chapterNameList = bookTitleItem.copyWith(
    fontWeight: FontWeight.normal, 
  );

  static TextStyle authorNameDisplay = subTitleText.copyWith(
    fontSize: 14.sp,
    color: ColorConstants.secondaryText,
    fontWeight: FontWeight.w700
  );

  static TextStyle purpleText = subTitleText.copyWith(
    fontSize: 14.sp,
    color: ColorConstants.purpleLight,
    fontWeight: FontWeight.w700
  );


  static TextStyle headline3 = subTitleText.copyWith(
    color: ColorConstants.black,
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
  );

  static TextStyle smallTextDisplayLabel = headline3.copyWith(
    fontSize: 14.sp,
  );

  static TextStyle bigTextDisplayLabel = headline3.copyWith(
    fontSize: 20.sp,
  );

  static TextStyle headline3White = headline3.copyWith(
    color: ColorConstants.lightText,
  );

  static TextStyle ratingPointDisplay = subTitleText.copyWith(
    fontSize: 14.sp,
    fontWeight: FontWeight.w700,
  );

  static TextStyle searchingText = subTitleText.copyWith(
    fontSize: 13.sp,
    fontWeight: FontWeight.w200,
    color: ColorConstants.buttonPastelGreen
  );

  static TextStyle dropdownText = subTitleText.copyWith(
    fontSize: 16.sp,
  );

  static TextStyle buttonTextGrey = subTitleText.copyWith(
    fontSize: 16.sp,
    color: ColorConstants.secondaryText,
  );


  static TextStyle buttonTextWhite = subTitleText.copyWith(
    fontSize: 14.sp,
    fontWeight: FontWeight.bold,
  );

  // CRIMSON PRO
  static TextStyle storyNameChapterWhite = GoogleFonts.crimsonPro(
    textStyle: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
      color: ColorConstants.lightText,

  ));

  //READ SETTING SECTION
  //Be Vietnam Pro
  static TextStyle beVNProRead = GoogleFonts.beVietnamPro(
    textStyle: TextStyle(
      fontSize: 14.sp,
      color: ColorConstants.primaryText,
    )
  );

  static TextStyle beVNProLabel = beVNProRead.copyWith(
    fontSize: 28.sp,
    fontWeight: FontWeight.bold,
  );

  static TextStyle crimsonProRead = GoogleFonts.crimsonPro(
    textStyle: TextStyle(
      fontSize: 18.sp,
      color: ColorConstants.primaryText,
    )
  );

  static TextStyle crimsonProLabel = crimsonProRead.copyWith(
    fontSize: 32.sp,
    fontWeight: FontWeight.bold,
  );

  static TextStyle farsanRead = GoogleFonts.farsan(
    textStyle: TextStyle(
      fontSize: 18.sp,
      color: ColorConstants.primaryText,
    )
  );

  static TextStyle farsanLabel = farsanRead.copyWith(
    fontSize: 30.sp,
    fontWeight: FontWeight.normal,
  );

}
