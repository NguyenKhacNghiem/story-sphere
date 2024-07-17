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
    color: ColorConstants.headingGreen);

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

  //BE VIETNAM PRO

  static TextStyle subTitleText = GoogleFonts.beVietnamPro(
      textStyle: TextStyle(
        fontSize: 13.sp,
        fontWeight: FontWeight.w300,
        color: ColorConstants.lightText,
        height: 1.33.sp,
  ));

  static TextStyle contentOutLine = subTitleText.copyWith(
    fontSize: 14,
  );

  static TextStyle dataDisplay = subTitleText.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w700,
  );

  static TextStyle userNameText = subTitleText.copyWith(
    fontSize: 20.sp,
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

  static TextStyle authorNameDisplay = subTitleText.copyWith(
    fontSize: 14.sp,
    color: ColorConstants.secondaryText,
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

  // static TextStyle headline1StoryTitle = GoogleFonts.roboto(
  //     textStyle: TextStyle(
  //   fontSize: 24,
  //   fontWeight: FontWeight.w700,
  //   color: ColorConstant.whiteA700,
  //   height: 1.33,
  // ));

  // static TextStyle headline2 = GoogleFonts.roboto(
  //     textStyle: const TextStyle(
  //   fontSize: 22,
  //   fontWeight: FontWeight.w700,
  //   height: 1.33,
  // ));

  // static TextStyle headline2White = GoogleFonts.roboto(
  //     textStyle: const TextStyle(
  //   fontSize: 22,
  //   fontWeight: FontWeight.w500,
  //   height: 1.33,
  // ));

  // static TextStyle headline3 = GoogleFonts.roboto(
  //     textStyle: const TextStyle(
  //   fontSize: 20,
  //   fontWeight: FontWeight.w700,
  //   height: 1.33,
  // ));

  // static TextStyle headline3White =
  //     GoogleFonts.roboto(textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, height: 1.33, color: ColorConstant.whiteA700));

  // static TextStyle headline4 = GoogleFonts.roboto(
  //     textStyle: const TextStyle(
  //   fontSize: 16,
  //   fontWeight: FontWeight.w600,
  //   height: 1.33,
  // ));

  // static TextStyle headline4White =
  //     GoogleFonts.roboto(textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, height: 1.33, color: ColorConstant.whiteA700));

  // static TextStyle bookListingTitle = GoogleFonts.roboto(
  //     textStyle: const TextStyle(
  //   fontSize: 14,
  //   fontWeight: FontWeight.w700,
  //   height: 1.30,
  // ));

  // static TextStyle bookListingTitleNavy = GoogleFonts.roboto(
  //     textStyle: TextStyle(
  //   fontSize: 14,
  //   fontWeight: FontWeight.w700,
  //   height: 1.30,
  //   color: ColorConstant.navyPrimary,
  // ));

  // static TextStyle bookListingTitleBottomSheet = GoogleFonts.roboto(
  //     textStyle: TextStyle(
  //   fontSize: 14,
  //   fontWeight: FontWeight.w700,
  //   color: ColorConstant.honeyPrimary,
  //   height: 1.00,
  // ));

  // static TextStyle bookListingTitleWhite =
  //     GoogleFonts.roboto(textStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, height: 1.00, color: ColorConstant.whiteA700));

  // static TextStyle bookListingSubtitle = GoogleFonts.roboto(
  //     textStyle: const TextStyle(
  //   fontSize: 14,
  //   height: 1.20,
  // ));

  // static TextStyle bookListingSubtitleBottomSheet = GoogleFonts.roboto(textStyle: TextStyle(fontSize: 14, height: 1.00, color: ColorConstant.honeyPrimary));

  // static TextStyle bookListingSubtitleWhite = GoogleFonts.roboto(
  //     textStyle: TextStyle(
  //   fontSize: 14,
  //   height: 1.00,
  //   color: ColorConstant.whiteA700,
  // ));

  // static TextStyle tinyBodyText = GoogleFonts.roboto(
  //     textStyle: const TextStyle(
  //   fontSize: 10,
  //   height: 1.00,
  // ));

  // static TextStyle largestBodyText = GoogleFonts.roboto(
  //     textStyle: const TextStyle(
  //   fontSize: 20,
  //   height: 1.00,
  // ));

  // static TextStyle tinyBodyTextWhite = GoogleFonts.roboto(textStyle: TextStyle(fontSize: 12, height: 1.00, color: ColorConstant.whiteA700));

  // static TextStyle largestBodyTextWhite = GoogleFonts.roboto(textStyle: TextStyle(fontSize: 20, height: 1.00, color: ColorConstant.whiteA700));

  // static TextStyle contentIntro = GoogleFonts.charm(
  //     textStyle: TextStyle(
  //   color: ColorConstant.navyPrimary,
  //   fontSize: 25,
  //   height: 1.50,
  // ));

  // static TextStyle contentIntroWhite = GoogleFonts.charm(
  //     textStyle: TextStyle(
  //   fontSize: 25,
  //   height: 1.50,
  //   color: ColorConstant.whiteA700,
  // ));

  // static TextStyle bodyTextNavy = GoogleFonts.lora(textStyle: const TextStyle(fontSize: 16, letterSpacing: 1.0, height: 1.60, fontWeight: FontWeight.w400));
  // static TextStyle introText = GoogleFonts.lora(textStyle: const TextStyle(fontSize: 14, letterSpacing: 1.0, height: 1.4, fontWeight: FontWeight.w400));
  // static TextStyle tinyBodyTextNavy = GoogleFonts.lora(textStyle: const TextStyle(fontSize: 13, letterSpacing: 1.0, height: 1.60, fontWeight: FontWeight.w400));
  // static TextStyle tinyBodyTextBold = GoogleFonts.lora(textStyle: const TextStyle(fontSize: 13, letterSpacing: 1.0, height: 1.60, fontWeight: FontWeight.w700));
  // static TextStyle tinyBodyTextBoldMobile =
  //     GoogleFonts.lora(textStyle: const TextStyle(fontSize: 11, letterSpacing: 1.0, height: 1.60, fontWeight: FontWeight.w700));
  // static TextStyle homeCommentText =
  //     GoogleFonts.lora(textStyle: TextStyle(fontSize: 14, letterSpacing: 1.0, height: 1.60, fontWeight: FontWeight.w400, color: ColorConstant.whiteA700));
  // static TextStyle homeCommentTextNavy =
  //     GoogleFonts.lora(textStyle: TextStyle(fontSize: 14, letterSpacing: 1.0, height: 1.60, fontWeight: FontWeight.w400, color: ColorConstant.navyPrimary));
  // static TextStyle bodyTextNavySmall =
  //     GoogleFonts.lora(textStyle: const TextStyle(fontSize: 15, letterSpacing: 1.0, height: 1.60, fontWeight: FontWeight.w400));
  // static TextStyle homeQuoteItalic =
  //     GoogleFonts.lora(textStyle: const TextStyle(fontSize: 13, letterSpacing: 1.0, height: 1.60, fontWeight: FontWeight.w400, fontStyle: FontStyle.italic));
  // static TextStyle homeQuoteItalicMobile =
  //     GoogleFonts.lora(textStyle: const TextStyle(fontSize: 13, letterSpacing: 1.0, height: 1.60, fontWeight: FontWeight.w400, fontStyle: FontStyle.italic));
  // static TextStyle homeQuoteBold = GoogleFonts.raleway(textStyle: const TextStyle(fontSize: 20, height: 1.50, fontWeight: FontWeight.bold));
  // static TextStyle homeQuoteBoldMobile = GoogleFonts.raleway(textStyle: const TextStyle(fontSize: 16, height: 1.50, fontWeight: FontWeight.bold));
  // static TextStyle bodyTextWhite =
  //     GoogleFonts.lora(textStyle: TextStyle(fontSize: 16, letterSpacing: 1.2, height: 1.60, fontWeight: FontWeight.w400, color: ColorConstant.whiteA700));

  // static TextStyle activeLink =
  //     GoogleFonts.lora(textStyle: TextStyle(fontSize: 16, letterSpacing: 1.2, height: 1.60, fontWeight: FontWeight.w700, color: ColorConstant.honeyPrimary));

  // static TextStyle ratingNumber =
  //     GoogleFonts.roboto(textStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, height: 1.00, color: ColorConstant.navyPrimary));
  // static TextStyle statusLabel =
  //     GoogleFonts.roboto(textStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, height: 1.00, color: ColorConstant.whiteA700));
  // static TextStyle ageWarning = GoogleFonts.roboto(
  //     textStyle: const TextStyle(
  //   fontSize: 12,
  //   fontWeight: FontWeight.w700,
  //   height: 1.00,
  // ));
  // static TextStyle dateFormat =
  //     GoogleFonts.roboto(textStyle: const TextStyle(fontSize: 11, letterSpacing: 1.0, height: 1.60, fontWeight: FontWeight.w400, color: ColorConst.grey800));

  // static TextStyle tagTitleWhite = GoogleFonts.roboto(
  //     textStyle: TextStyle(
  //   fontSize: 12,
  //   fontWeight: FontWeight.w700,
  //   height: 1.00,
  //   color: ColorConstant.whiteA700,
  // ));
  // static TextStyle registrationIntoWeb = GoogleFonts.roboto(
  //     textStyle: const TextStyle(
  //   fontSize: 14,
  //   height: 1.5,
  // ));

  // static TextStyle registrationIntroMobile = GoogleFonts.roboto(
  //     textStyle: const TextStyle(
  //   fontSize: 12,
  //   height: 1.2,
  // ));

  // static TextStyle authorRegistrationLabels = GoogleFonts.roboto(
  //     textStyle: const TextStyle(
  //   fontSize: 16,
  //   fontWeight: FontWeight.w700,
  //   height: 1.00,
  // ));

  // static TextStyle userCreditAmountChange = GoogleFonts.roboto(
  //     textStyle:
  //         const TextStyle(fontSize: 22, fontWeight: FontWeight.w700, height: 1.33, color: ColorConst.chartColorYellow, fontFamily: AutofillHints.birthdayDay));

  // static TextStyle headlineUserCredit = GoogleFonts.roboto(
  //     textStyle: const TextStyle(
  //   fontSize: 25,
  //   fontWeight: FontWeight.w700,
  //   height: 1.33,
  //   color: ColorConst.chartColorYellow,
  // ));

  // static TextStyle userCreditLabels = GoogleFonts.roboto(
  //     textStyle: const TextStyle(
  //   fontSize: 16,
  //   fontWeight: FontWeight.w700,
  //   height: 1.00,
  //   color: ColorConst.chartColorYellow,
  // ));
}
