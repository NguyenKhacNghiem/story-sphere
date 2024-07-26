import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storysphere_mobileapp/constants/string.dart';
import 'package:storysphere_mobileapp/constants/utils/color_constant.dart';
import 'package:storysphere_mobileapp/constants/utils/font_constant.dart';
import 'package:storysphere_mobileapp/constants/utils/icon_svg.dart';
import 'package:storysphere_mobileapp/routing/router.gr.dart';

class SearchingBarWidget extends StatelessWidget {
  SearchingBarWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorConstants.buttonPastelGreen,
          width: 1.sp,),
        borderRadius: BorderRadius.circular(5.sp),
      ),
      child: Row(
        children: [
            10.horizontalSpace,
            IconsSVG.searchingBarIcon,
            10.horizontalSpace,
            Container(
              width: 1,
              height: 23,
              color: ColorConstants.buttonPastelGreen,
            ),
              Expanded(
              child: Padding(
                padding: EdgeInsets.all(5.sp),
                child: TextField(
                  style:  FontConstant.searchingText,
                  decoration: const InputDecoration(
                    hintText: Strings.hintSearching,
                    fillColor: ColorConstants.transparent,
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    hintStyle: TextStyle(color: ColorConstants.buttonPastelGreen),
                  ),
                onSubmitted: (String value) {
                  context.pushRoute(SearchingResultsPage(data: value));
              },
              ),
            ),)
      ])
    );
          
  }
  
}
