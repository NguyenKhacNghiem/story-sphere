import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storysphere_mobileapp/constants/utils/font_constant.dart';

class BookDisplayWidget extends StatelessWidget {
  final String imageUrl;
  final String title;

  const BookDisplayWidget({super.key, required this.imageUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.sp, horizontal: 10.sp),
      child: Column(
       mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 105.sp,
            height: 160.sp,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5.sp),
              child: Image.asset(imageUrl, fit: BoxFit.cover,))),
          5.verticalSpace,
          SizedBox(
            width: 105.sp,
            child:Text (title, style: FontConstant.subTitleText, overflow: TextOverflow.ellipsis,))
          
        ],),
    );
  }
  
}
