import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storysphere_mobileapp/constants/string.dart';
import 'package:storysphere_mobileapp/constants/utils/color_constant.dart';
import 'package:storysphere_mobileapp/constants/utils/font_constant.dart';
import 'package:storysphere_mobileapp/constants/utils/icon_svg.dart';
import 'package:storysphere_mobileapp/models/chapter.dart';

class ChapterListWriteItemWidget extends StatelessWidget {
  final Chapter chapter;
  const ChapterListWriteItemWidget({super.key, required this.chapter});

  @override
  Widget build(BuildContext context) {
    double itemWidth = (MediaQuery.of(context).size.width - 60.sp).sp;
    String sampleChapterContent = chapter.chapterContent!.length > 180 ?  chapter.chapterContent!.substring(0, 180) : chapter.chapterContent!;
    Widget chapterData = Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
         IconsSVG.documentDraft,
         5.horizontalSpace,
         Column(
          children: [
            Text(chapter.chapterName ?? '', style: FontConstant.headline3White,),
            5.verticalSpace,
            Text(chapter.wordsCount.toString() + Strings.words, style: FontConstant.chapterData,),
            5.verticalSpace,
            Text(chapter.chapterStatus! == 2 ? Strings.published : Strings.drarf, style: FontConstant.chapterData,),
          ],
         ),
      ],);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.sp, vertical: 10.sp),
      child:
         Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: itemWidth,
              child: Text(
                chapter.chapterName ?? '', 
                style: FontConstant.chapterNameItem,
                overflow: TextOverflow.clip,
                softWrap: true,),
            ),
            2.verticalSpace,
            chapterData,

            10.verticalSpace,
            SizedBox(
              width: itemWidth,
              child: Text(
                sampleChapterContent,
                style: FontConstant.fromStoryLabel,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
            
            10.verticalSpace,
            Container(
              width: itemWidth,
              height: 1.sp,
              color: ColorConstants.primaryText,
            )
        ],)
    );
   
  }
  
}
