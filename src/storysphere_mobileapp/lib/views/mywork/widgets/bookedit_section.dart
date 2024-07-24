import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storysphere_mobileapp/constants/string.dart';
import 'package:storysphere_mobileapp/constants/utils/color_constant.dart';
import 'package:storysphere_mobileapp/constants/utils/font_constant.dart';
import 'package:storysphere_mobileapp/constants/utils/icon_svg.dart';
import 'package:storysphere_mobileapp/models/story.dart';
import 'package:storysphere_mobileapp/routing/router.gr.dart';

// ignore: must_be_immutable
class BookEditSectionWidget extends StatelessWidget {
  final Story story;
  BookEditSectionWidget({super.key, required this.story});
  late Widget buttonList;

  @override
  Widget build(BuildContext context) {
    initData(context);

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
              SizedBox(
              width: 200.sp,
              child: 
              Text(story.storyName ?? '', 
                    style: FontConstant.bookTitleItem, 
                    overflow: TextOverflow.clip,
                    textAlign: TextAlign.start,)),
              

             Text(story.bookAuthorName == null ? 'Vô danh' : story.bookAuthorName!, style: FontConstant.authorNameDisplay,),
             5.verticalSpace,
              SizedBox(
                width: 200.sp,
                child: 
             Text(story.storyContentOutline == null ? '' : story.storyContentOutline!, 
                  style: FontConstant.contentOutLine,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,)),

             10.verticalSpace,
             buttonList,
          ],
        )

    ]);
  }

  initData(BuildContext context){
    buttonList = Row(
      children: [
        ElevatedButton(
           style: ElevatedButton.styleFrom(
                    backgroundColor: ColorConstants.transparent,
                    shadowColor: ColorConstants.transparent,
                    padding: EdgeInsets.zero, // Remove padding
                    minimumSize: Size.zero,   // Remove minimum size constraints
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap, // Shrink wrap the button
                  ),
          onPressed: () {
            context.pushRoute(EditStoryPage(story: story));
          },
          child: Container(
            decoration: BoxDecoration(
              color: ColorConstants.secondaryText,
              borderRadius: BorderRadius.circular(5.sp),
            ),
            
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 5.sp),
            child: Text(Strings.edit, style: FontConstant.buttonTextWhite,),),
          )
          ),
        5.horizontalSpace,

        ElevatedButton(
           style: ElevatedButton.styleFrom(
                    backgroundColor: ColorConstants.transparent,
                    shadowColor: ColorConstants.transparent,
                    padding: EdgeInsets.zero, // Remove padding
                    minimumSize: Size.zero,   // Remove minimum size constraints
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap, // Shrink wrap the button
                  ),
          onPressed: () {
            Navigator.pop(context);
            context.pushRoute(AddChapterPage(storyId: story.storyId ?? -1));
          },
          child: Container(
            decoration: BoxDecoration(
              color: ColorConstants.buttonLightGreen,
              borderRadius: BorderRadius.circular(5.sp),
            ),
            
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 5.sp),
            child: 
              Wrap(
                children: [
                  IconsSVG.add,
                  5.horizontalSpace,
                   Text(Strings.newChapter, style: FontConstant.buttonTextWhite,),
                ],))
           
          )
          ),
      ],
    );

  }
  
}
