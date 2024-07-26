import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storysphere_mobileapp/constants/string.dart';
import 'package:storysphere_mobileapp/constants/utils/font_constant.dart';


class NotFoundWidget extends StatelessWidget {
  const NotFoundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
          child: Column(
            children: [
              40.verticalSpace,
              SizedBox(
                width: 220.sp,
                height: 100.sp,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5.sp),
                  child: Image.asset('assets/images/404-error.png', fit: BoxFit.cover,))
                ),
              20.verticalSpace,
              Text(Strings.contentNotFound, style: FontConstant.headline2Light,)
            ])   
    );
  }
  
}
