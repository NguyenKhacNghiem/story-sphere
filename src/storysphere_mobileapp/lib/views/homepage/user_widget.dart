import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storysphere_mobileapp/constants/string.dart';
import 'package:storysphere_mobileapp/constants/utils/color_constant.dart';
import 'package:storysphere_mobileapp/constants/utils/font_constant.dart';
import 'package:storysphere_mobileapp/constants/utils/icon_svg.dart';

class UserHomepageWidget extends StatelessWidget {
  const UserHomepageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 35.sp),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(Strings.hello),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            Wrap(
              children: [
                Icons_SVG.user,
                Padding(padding: EdgeInsets.all(3.sp),),
                Text('Mỹ Diệu', style: FontConstant.userNameText,),
              ],
            ),
           
            ElevatedButton(
              onPressed: (){},
              child: 
              Container(
                width: 20.sp,
                height: 20.sp,
                color: ColorConstants.headingGreen,
                child: Icons_SVG.notificatioBing,
              ),),
          ],)
          
        ],),
    );
  }
  
}
