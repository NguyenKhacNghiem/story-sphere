import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storysphere_mobileapp/constants/utils/color_constant.dart';
import 'package:storysphere_mobileapp/constants/utils/font_constant.dart';
import 'package:storysphere_mobileapp/constants/utils/icon_svg.dart';
import 'package:storysphere_mobileapp/models/story.dart';
import 'package:storysphere_mobileapp/views/searching/widgets/story_data_widget.dart';

class BookResultSectionWidget extends StatelessWidget {
  final Story story;
  const BookResultSectionWidget({super.key, required this.story});

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
            width: 100.sp,
            height: 155.sp,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5.sp),
              child: Image.network(story.storyCover!, fit: BoxFit.cover,))),
        20.horizontalSpace,
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
               SizedBox(
                width: 160.sp,
                child: 
                Text(story.storyName ?? '', 
                      style: FontConstant.bookTitleItem, 
                      overflow: TextOverflow.clip,
                      textAlign: TextAlign.start,)),
              Container(
                decoration: BoxDecoration(
                  color: ColorConstants.tagYellow,
                  borderRadius: BorderRadius.circular(5.sp),
                ),
              child: 
              Padding(padding: EdgeInsets.all(5.sp),
              child: Wrap(
                direction: Axis.horizontal,
                children: [
                  IconsSVG.starTag,
                  5.horizontalSpace,
                  Text(story.ratingPoint == null ? '5.0' : story.ratingPoint.toString(), style: FontConstant.ratingPointDisplay,)
                ])),

              )
             ],),

             Text(story.bookAuthorName == null ? 'Vô danh' : story.bookAuthorName!, style: FontConstant.authorNameDisplay,),
             5.verticalSpace,
              SizedBox(
                width: 180.sp,
                child: 
             Text(story.storyContentOutline == null ? '' : story.storyContentOutline!, 
                  style: FontConstant.contentOutLine,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,)),

             10.verticalSpace,
             StoryDataWidget(viewCount: story.viewCount ?? 0, voteCount: story.voteCount ?? 0, chapterCount: story.chapterCount ?? 1,)
          ],
        )

    ]);
  }
  
}
