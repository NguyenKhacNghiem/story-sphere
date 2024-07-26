import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storysphere_mobileapp/constants/string.dart';
import 'package:storysphere_mobileapp/constants/utils/color_constant.dart';
import 'package:storysphere_mobileapp/constants/utils/font_constant.dart';
import 'package:storysphere_mobileapp/views/forgot_password/fp_success_page.dart';

class FPUpdatePassword extends StatefulWidget {
  final int userId;
  const FPUpdatePassword({super.key, required this.userId});

  @override
  State<FPUpdatePassword> createState() => _FPUpdatePassword();
}

class _FPUpdatePassword extends State<FPUpdatePassword> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      backgroundColor: ColorConstants.bgWhite,
      body:  
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.sp, vertical: 20.sp),
        child:
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child:Text(Strings.updatePassword, style: FontConstant.titleBigDisplayGreen,)
                ),
                5.verticalSpace,
                Text(Strings.updatePasswordSubtitle, style: FontConstant.darkSubtitle),
                20.verticalSpace,

                 //PASSWORD
                Text(Strings.newPassword, style: FontConstant.darkSubtitle.copyWith(fontWeight: FontWeight.bold),),
    
                5.verticalSpace,
                TextField(
                  obscureText: _obscureText,
                  controller: _passwordController,
                  style: FontConstant.authorNameDisplay,
                  decoration: InputDecoration(
                    hintText: Strings.password, 
                    hintFadeDuration: Durations.medium1,
                    suffixIconColor: ColorConstants.secondaryText,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },),
                )),
                20.verticalSpace,

                //CONFIRM PASSWORD
                Text(Strings.confirmEnterPassword, style: FontConstant.darkSubtitle.copyWith(fontWeight: FontWeight.bold),),
               
                5.verticalSpace,
                TextField(
                  obscureText: _obscureText,
                  controller: _confirmPasswordController,
                  style: FontConstant.authorNameDisplay,
                  decoration: InputDecoration(
                    hintText: Strings.confirmPassword, 
                    hintFadeDuration: Durations.medium1,
                    suffixIconColor: ColorConstants.secondaryText,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },),
                )),

                
                40.verticalSpace,
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: (){
                       updatePassword();
                    },
                    child:Padding(padding: EdgeInsets.symmetric(horizontal: 60.sp, vertical: 15.sp),
                        child: Text(Strings.next, style: FontConstant.headline3White, textAlign: TextAlign.center,),), 
                  ),
                ),
                
                
                
              ],)
        ),
    );
   }

   void updatePassword(){
     //send API

     //route
     Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FPUpdateSuccessPage()),
    );
   }
}
