import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storysphere_mobileapp/constants/utils/font_constant.dart';
import 'package:storysphere_mobileapp/models/chapter.dart';

class ChapterNameWidget extends StatelessWidget {
  final Chapter chapter;
  const ChapterNameWidget({super.key, required this.chapter});

  @override
  Widget build(BuildContext context) {
    String dateString = 'D';
    if (chapter.createdDate != null) {
       dateString = "${chapter.createdDate!.day}/${chapter.createdDate!.month}/${chapter.createdDate!.year}";
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 200.sp,
          child: Text(
            chapter.chapterName ?? '', 
            style: FontConstant.dataDisplay,
            overflow: TextOverflow.ellipsis,
            softWrap: true,),
        ),
        Text(dateString, style: FontConstant.userIntroduction,)
    ],);
  }
  
}
