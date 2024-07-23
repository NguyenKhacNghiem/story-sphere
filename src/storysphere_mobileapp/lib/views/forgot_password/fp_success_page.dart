import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storysphere_mobileapp/constants/string.dart';
import 'package:storysphere_mobileapp/constants/utils/color_constant.dart';
import 'package:storysphere_mobileapp/constants/utils/font_constant.dart';
import 'package:storysphere_mobileapp/routing/router.gr.dart';

class FPUpdateSuccessPage extends StatelessWidget {
   FPUpdateSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      backgroundColor: ColorConstants.bgWhite,
      body:  
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.sp, vertical: 20.sp),
        child:
          Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 66.sp,
                  height: 66.sp,
                  child: Image.asset('assets/images/tick_image.png', fit: BoxFit.cover,),
                ),
                10.verticalSpace,
                Text(Strings.updatePasswordDone, style: FontConstant.titleBigDisplayGreen),
                40.verticalSpace,

                Text(Strings.updatePasswordDoneMessage, style: FontConstant.darkSubtitle, textAlign: TextAlign.center,),

                50.verticalSpace,
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: (){
                       context.pushRoute(LogInPage());
                    },
                    child:Padding(padding: EdgeInsets.symmetric(horizontal: 60.sp, vertical: 15.sp),
                        child: Text(Strings.signInText, style: FontConstant.headline3White, textAlign: TextAlign.center,),), 
                  ),
                ),
                
                
                
              ],)
        ),
    );
   }
}
