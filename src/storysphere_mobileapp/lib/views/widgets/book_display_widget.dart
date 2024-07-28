import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storysphere_mobileapp/constants/string.dart';
import 'package:storysphere_mobileapp/constants/utils/font_constant.dart';
import 'package:storysphere_mobileapp/models/story.dart';
import 'package:storysphere_mobileapp/routing/router.gr.dart';

class BookDisplayWidget extends StatelessWidget {
  final Story story;
  final bool? fromLib;

  const BookDisplayWidget({super.key, required this.story, this.fromLib});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => context.pushRoute(
          StoryDetailPage(
            story: story,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 5.sp, horizontal: 10.sp),
          child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 105.sp,
                height: 160.sp,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5.sp),
                  child: 
                  story.storyCover != null && story.storyCover! != "???"
                  ? Image.network(story.storyCover ?? '', fit: BoxFit.cover,)
                  : Image.network(Strings.defaultCover))),
              5.verticalSpace,
              SizedBox(
                width: 105.sp,
                child:Text (story.storyName ?? 'Null', style: FontConstant.subTitleText, overflow: TextOverflow.ellipsis,))
              
            ],),
        )
    );
  }
  
}
