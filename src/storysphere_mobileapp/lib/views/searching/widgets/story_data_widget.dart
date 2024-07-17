import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storysphere_mobileapp/constants/utils/font_constant.dart';
import 'package:storysphere_mobileapp/constants/utils/icon_svg.dart';

class StoryDataWidget extends StatelessWidget {
  final int viewCount;
  final int voteCount;
  final int? chapterCount;
  final int? commentCount;
  const StoryDataWidget({super.key, required this.viewCount, required this.voteCount, this.commentCount, this.chapterCount});

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
         IconsSVG.view,
         5.horizontalSpace,
         Text(viewCount.toString(), style: FontConstant.dataDisplay,),

         15.horizontalSpace,
         IconsSVG.likeNormal,
         5.horizontalSpace,
         Text(voteCount.toString(), style: FontConstant.dataDisplay,),

         15.horizontalSpace,
         chapterCount != null ? IconsSVG.chapterList : IconsSVG.comment,
         5.horizontalSpace,
         chapterCount != null ? Text(chapterCount.toString(), style: FontConstant.dataDisplay,): Text(commentCount.toString(), style: FontConstant.dataDisplay,),

    ]);
  }
  
}
