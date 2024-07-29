import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storysphere_mobileapp/constants/string.dart';
import 'package:storysphere_mobileapp/constants/utils/font_constant.dart';


class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
          child: Column(
            children: [
              40.verticalSpace,
              SizedBox(
                width: 100.sp,
                height: 100.sp,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5.sp),
                  child: Image.asset('assets/images/empty-box.png', fit: BoxFit.fill,))
                ),
              20.verticalSpace,
              Text(Strings.noDataToDisplay, style: FontConstant.categoryDescrip,)
            ])   
    );
  }
  
}
