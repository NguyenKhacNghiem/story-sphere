import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storysphere_mobileapp/constants/utils/color_constant.dart';
import 'package:storysphere_mobileapp/models/story.dart';
import 'package:storysphere_mobileapp/views/storydetail/storyinfo_section.dart';

class BookResultSectionWidget extends StatelessWidget {
  final Story story;
  const BookResultSectionWidget({super.key, required this.story});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Row(
      children: [
        SizedBox(
            width: 165.sp,
            height: 253.sp,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5.sp),
              child: Image.network(story.storyCover!, fit: BoxFit.cover,))),

    ]);
  }
  
}
