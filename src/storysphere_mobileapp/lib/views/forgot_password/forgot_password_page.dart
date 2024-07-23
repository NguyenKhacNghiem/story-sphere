import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storysphere_mobileapp/constants/string.dart';
import 'package:storysphere_mobileapp/constants/utils/color_constant.dart';
import 'package:storysphere_mobileapp/constants/utils/font_constant.dart';
import 'package:storysphere_mobileapp/constants/utils/icon_svg.dart';
import 'package:storysphere_mobileapp/views/forgot_password/fp_otp_page.dart';

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
      backgroundColor: ColorConstants.bgWhite,
      body: 
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.sp, vertical: 10.sp),
        child:
          Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(Strings.forgotPassword, style: FontConstant.titleBigDisplayGreen,),
                ),
                10.verticalSpace,
                Text(Strings.forogotPasswordReminder, style: FontConstant.darkSubtitle),

                40.verticalSpace,

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconsSVG.sms,
                  2.horizontalSpace,
                  Container(
                    width: MediaQuery.of(context).size.width*0.7,
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: ColorConstants.formStrokeColor, width: 0.5.sp))
                    ),
                    child: TextField(
                      controller: emailController,
                    style:  FontConstant.categoryDescrip.copyWith(color: ColorConstants.secondaryText),
                    decoration: const InputDecoration(
                      hintText: Strings.enterEmail,
                      fillColor: ColorConstants.transparent,
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      hintStyle: TextStyle(color: ColorConstants.secondaryText),
                    ),
                  onSubmitted: (String value) {
                   
                  },
                  ),
                  ),
                  
                ],),

                40.verticalSpace,
                ElevatedButton(
                  onPressed: (){
                     sendEmailHandle();
                  },
                  child:Padding(padding: EdgeInsets.symmetric(horizontal: 60.sp, vertical: 15.sp),
                      child: Text(Strings.sendActivationEmail, style: FontConstant.headline3White, textAlign: TextAlign.center,),), 
                ),
                
              ],
            
          )),
    );
   }

   void sendEmailHandle(){
    String email = emailController.text;
    int otpCode = 1940;
    int userId = 1;
    //send POST request
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => FPEnteringOTPPage(email: email, otpCode: otpCode, userId: userId,)),
      );
   }
}
