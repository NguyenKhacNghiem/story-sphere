import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storysphere_mobileapp/constants/utils/color_constant.dart';
import 'package:storysphere_mobileapp/constants/utils/font_constant.dart';
import 'package:storysphere_mobileapp/constants/utils/icon_svg.dart';
import 'package:storysphere_mobileapp/models/chapter.dart';

class ChapterListItemWidget extends StatelessWidget {
  final Chapter chapter;
  const ChapterListItemWidget({super.key, required this.chapter});

  @override
  Widget build(BuildContext context) {
    double itemWidth = (MediaQuery.of(context).size.width - 60.sp).sp;
    String sampleChapterContent = chapter.chapterContent!.length > 180 ?  chapter.chapterContent!.substring(0, 180) : chapter.chapterContent!;
    Widget chapterData = Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
         IconsSVG.view,
         5.horizontalSpace,
         Text(chapter.viewCount.toString(), style: FontConstant.dataDisplay,),

         15.horizontalSpace,
         IconsSVG.likeNormal,
         5.horizontalSpace,
         Text(chapter.voteCount.toString(), style: FontConstant.dataDisplay,),
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

            5.verticalSpace,
            SizedBox(
              width: itemWidth,
              child: Text(
                sampleChapterContent,
                style: FontConstant.fromStoryLabel,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
            
            5.verticalSpace,
            Container(
              width: itemWidth,
              height: 1.sp,
              color: ColorConstants.primaryText,
            )
        ],)
    );
   
  }
  
}
