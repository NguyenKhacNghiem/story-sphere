import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storysphere_mobileapp/constants/string.dart';
import 'package:storysphere_mobileapp/constants/utils/color_constant.dart';
import 'package:storysphere_mobileapp/models/story.dart';
import 'package:storysphere_mobileapp/views/storydetail/widgets/storyinfo_section.dart';

class StoryCoverSectionWidget extends StatelessWidget {
  final Story story;
  const StoryCoverSectionWidget({super.key, required this.story});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      height: 445.sp,
      width: screenWidth,
      child: Stack(
        children: [
          // Background image
          Container(
            height: 444.sp,
            width: screenWidth,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(story.storyCover!),
                  fit: BoxFit.fitWidth,
                ),
              ),
          ),

          // Darker effect
          Container(
            height: screenWidth,
            decoration: BoxDecoration(
              color: ColorConstants.black.withOpacity(0.7), 
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child:
          Container(
          width: screenWidth,
          height: 300.sp,
          decoration: const BoxDecoration(
            gradient:  LinearGradient(
              colors: [ColorConstants.transparent, ColorConstants.darkGreenBackground],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          )),

          Positioned(
            top: 52.sp,
            left: ((screenWidth-165)/2 -20).sp,
            child: Container(
              width: 165.sp,
              height: 253.sp,
              decoration: BoxDecoration(
                color: ColorConstants.primaryText.withOpacity(0.15),
                borderRadius: BorderRadius.circular(5),
              ),)),
          Positioned(
            top: 92.sp,
            left: ((screenWidth-165)/2 + 20).sp,
            child: Container(
              width: 165.sp,
              height: 253.sp,
              decoration: BoxDecoration(
                color: ColorConstants.primaryText.withOpacity(0.15),
                borderRadius: BorderRadius.circular(5),
              ),)),

          //Content
         Positioned(
            top: 72.sp,
            left: ((screenWidth-165)/2).sp,
            child: SizedBox(
            width: 165.sp,
            height: 253.sp,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5.sp),
              child: Image.network(story.storyCover ?? Strings.defaultCover, fit: BoxFit.cover,))),
          ),



          //Book Information
           Positioned(
            top: 350.sp,
            child:
            SizedBox(
              width: screenWidth,
              child:  StoryInfoSection(story: story,),
            )
           
          ),
        ],
      )
    );
  }
  
}
