import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storysphere_mobileapp/constants/utils/color_constant.dart';

class StorySphereTextTheme extends TextTheme {
  TextStyle get defaultTextTheme {
    return const TextStyle(
      color: ColorConstants.textColorGrey,
    );
  }

  @override
  TextStyle get displayLarge {
    return defaultTextTheme.copyWith(
      fontSize: 30.sp,
    );
  }

  @override
  TextStyle get displayMedium {
    return defaultTextTheme.copyWith(
      fontSize: 26.sp,
    );
  }

  @override
  TextStyle get displaySmall {
    return defaultTextTheme.copyWith(
      fontSize: 24.sp,
      fontWeight: FontWeight.w700,
    );
  }

  @override
  TextStyle get headlineLarge {
    return defaultTextTheme.copyWith(
      fontSize: 20.sp,
      fontWeight: FontWeight.w700,
    );
  }

  @override
  TextStyle get headlineMedium {
    return defaultTextTheme.copyWith(
      fontSize: 20.sp,
      fontWeight: FontWeight.w700,
    );
  }

  @override
  TextStyle get headlineSmall {
    return defaultTextTheme.copyWith(
      fontSize: 18.sp,
      fontWeight: FontWeight.w700,
    );
  }

  @override
  TextStyle get labelLarge {
    return defaultTextTheme.copyWith(
      fontSize: 18.sp,
    );
  }

  @override
  TextStyle get labelMedium {
    return defaultTextTheme.copyWith(
      fontSize: 16.sp,
    );
  }

  @override
  TextStyle get labelSmall {
    return defaultTextTheme.copyWith(
      fontSize: 12.sp,
      fontWeight: FontWeight.w500,
    );
  }

  @override
  TextStyle get bodyLarge {
    return defaultTextTheme.copyWith(
      fontSize: 18.sp,
    );
  }

  @override
  TextStyle get bodyMedium {
    return defaultTextTheme.copyWith(
      fontSize: 16.sp,
    );
  }

  @override
  TextStyle get bodySmall {
    return defaultTextTheme.copyWith(
      fontSize: 14.sp,
      fontWeight: FontWeight.w700,
    );
  }
}
