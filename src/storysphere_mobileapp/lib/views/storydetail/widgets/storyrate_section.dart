import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storysphere_mobileapp/constants/utils/icon_svg.dart';

class StoryRatingSectionWidget extends StatelessWidget {
  final double ratePoint;
  const StoryRatingSectionWidget({super.key, required this.ratePoint});

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
         ratePoint >= 1.0 ? IconsSVG.starYellow : IconsSVG.starTag,
         4.horizontalSpace,
         ratePoint >= 2.0 ? IconsSVG.starYellow : IconsSVG.starTag,
         4.horizontalSpace,
         ratePoint >= 3.0 ? IconsSVG.starYellow : IconsSVG.starTag,
         4.horizontalSpace,
         ratePoint >= 4.0 ? IconsSVG.starYellow : IconsSVG.starTag,
         4.horizontalSpace,
         ratePoint > 4.5  ? IconsSVG.starYellow : IconsSVG.starTag,
    
    ]);
  }
  
}
