import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storysphere_mobileapp/constants/string.dart';
import 'package:storysphere_mobileapp/constants/utils/font_constant.dart';
import 'package:storysphere_mobileapp/constants/utils/icon_svg.dart';
import 'package:storysphere_mobileapp/models/chapter.dart';

class ChapterListWriteItemWidget extends StatelessWidget {
  final Chapter chapter;
  const ChapterListWriteItemWidget({super.key, required this.chapter});

  @override
  Widget build(BuildContext context) {
    double itemWidth =(MediaQuery.of(context).size.width - 100.sp).sp;
    Widget chapterData = Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(padding: EdgeInsets.symmetric(vertical: 5.sp),
        child: IconsSVG.documentDraft,
        ),
         
         10.horizontalSpace,
         Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: itemWidth,
              child:  
              Text(chapter.chapterName ?? '', 
                style: FontConstant.headline3White.copyWith(height: 1.5.sp), 
                overflow: TextOverflow.clip,
              ),
            ),
           
            3.verticalSpace,
            Text(chapter.wordsCount.toString() + Strings.words, style: FontConstant.chapterData,),
            3.verticalSpace,
            Text(chapter.chapterStatus! == 2 ? Strings.published : Strings.drarf, style: FontConstant.chapterData,),
          ],
         ),
      ],);

    return chapterData;
    
    
   
  }
  
}
