import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storysphere_mobileapp/constants/string.dart';
import 'package:storysphere_mobileapp/constants/utils/color_constant.dart';
import 'package:storysphere_mobileapp/constants/utils/font_constant.dart';
import 'package:storysphere_mobileapp/constants/utils/icon_svg.dart';

@RoutePage()
class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPage();
}

class _ForgotPasswordPage extends State<ForgotPasswordPage> {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      body:  
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 10.sp),
        child:
          Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(Strings.forgotPassword, style: FontConstant.titleBigDisplayGreen,),
                5.verticalSpace,
                Text(Strings.forogotPasswordReminder, style: FontConstant.subTitleText.copyWith(
                    fontWeight: FontWeight.w200, 
                    color: ColorConstants.darkText),),
                30.verticalSpace,

                Row(children: [
                  IconsSVG.sms,
                  2.horizontalSpace,
                  TextField(
                    style:  FontConstant.categoryDescrip.copyWith(color: ColorConstants.secondaryText),
                    decoration: const InputDecoration(
                      hintText: Strings.enterEmail,
                      fillColor: ColorConstants.transparent,
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      hintStyle: TextStyle(color: ColorConstants.darkGreenBackground),
                    ),
                  onSubmitted: (String value) {
                   
                  },
                  ),
                ],),

                30.verticalSpace,
                



              ],
            
          )),
    );
   }
}
