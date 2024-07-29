import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storysphere_mobileapp/constants/string.dart';
import 'package:storysphere_mobileapp/constants/utils/color_constant.dart';
import 'package:storysphere_mobileapp/constants/utils/font_constant.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:storysphere_mobileapp/services/forgot_passowrd_service.dart';
import 'package:storysphere_mobileapp/views/forgot_password/fp_updatepass_page.dart';

class FPEnteringOTPPage extends StatefulWidget {
  final String email;
  final int otpCode;
  final int userId;
  const FPEnteringOTPPage({super.key, required this.email, required this.otpCode, required this.userId});

  @override
  State<FPEnteringOTPPage> createState() => _FPEnteringOTPPage();
}

class _FPEnteringOTPPage extends State<FPEnteringOTPPage> {
  TextEditingController otpController = TextEditingController();
  bool showMessage = false;
  bool resentOTP = false;
  late String trueEmail;
  late int trueOTP;
  late int trueUserId;

  @override
  Widget build(BuildContext context) {
    if (!resentOTP){
      trueEmail = widget.email;
      trueOTP = widget.otpCode;
      trueUserId = widget.userId;
    }
  
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
                Align(
                  alignment: Alignment.topLeft,
                  child:Text(Strings.identityVerify, style: FontConstant.titleBigDisplayGreen,)
                ),
                5.verticalSpace,
                Text(Strings.emailSentReminder1 + widget.email + Strings.emailSentReminder2, style: FontConstant.darkSubtitle),
                30.verticalSpace,

                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: PinCodeTextField(
                    appContext: context,
                    length: 4,
                    keyboardType: TextInputType.number,
                    controller: otpController,
                    textStyle: FontConstant.titleBigDisplayGreen,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 40,
                      activeFillColor: ColorConstants.bgWhite,
                      selectedFillColor: ColorConstants.bgWhite,
                      inactiveFillColor: ColorConstants.bgWhite,
                      activeColor: ColorConstants.activeOrange,
                      selectedColor: ColorConstants.activeOrange,
                      inactiveColor: ColorConstants.sliderGrey,
                    ),
                    onCompleted: (value) {
                       checkOTP(value);
                    },
                  ),
                ),
                5.verticalSpace,

                if (showMessage)
                  Text(
                    Strings.wrongOTP,
                    style: FontConstant.subTitleText.copyWith(color: ColorConstants.errorText),
                  ),

                30.verticalSpace,
                Text(Strings.didnotReceive, style: FontConstant.darkSubtitle,),
                5.verticalSpace,
                InkWell(
                  onTap: (){
                    resendOTP();
                  },
                  child: Text(Strings.reSend, style: FontConstant.subTitleText.copyWith(
                    fontWeight: FontWeight.bold,
                    color: ColorConstants.buttonLightGreen,
                  ),)
                )
              ],)
        ),
    );
  }

  void checkOTP(String inputOtpCode){
    //check
    int otp = int.tryParse(inputOtpCode) ?? 0;
    if (otp == trueOTP){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FPUpdatePassword(userId: trueUserId,)),
        );
    } else {
      setState(() {
        showMessage = true;
      });
    }

     
   }

   Future<void> resendOTP() async {
    //send POST request
     try {
        final response = await ForgotPasswordService().verifyEmail(trueEmail);
        debugPrint('Request sent successfully: ${response.body}');
         final responseData = json.decode(response.body);
          setState(() {
            trueOTP = responseData['otp'];
            resentOTP = true;
          });
         
      } catch (e) {
        debugPrint('Error sending review: $e');
      }
      
   }
}
