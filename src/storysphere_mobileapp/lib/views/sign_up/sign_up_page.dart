import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storysphere_mobileapp/constants/string.dart';
import 'package:storysphere_mobileapp/constants/utils/color_constant.dart';
import 'package:storysphere_mobileapp/constants/utils/font_constant.dart';
import 'package:storysphere_mobileapp/routing/router.gr.dart';

@RoutePage()
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPage();
}

class _SignUpPage extends State<SignUpPage> {

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _errorMessage = '';
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // top: false,
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(Strings.loginBackgroundImage,),
              fit: BoxFit.cover, ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 20.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(Strings.login, style: FontConstant.titleBigDisplayWhite,),
                30.verticalSpace,

                Align(
                  alignment: Alignment.topLeft,
                  child: Text(Strings.usernameOrEmail, style: FontConstant.dropdownText, textAlign: TextAlign.left,),
                ),
                5.verticalSpace,
                TextField(
                  controller: _usernameController,
                  style: FontConstant.authorNameDisplay,
                  decoration: const InputDecoration(hintText: Strings.userStr, hintFadeDuration: Durations.medium1),
                ),
                20.verticalSpace,

                Align(
                  alignment: Alignment.topLeft,
                  child: Text(Strings.password, style: FontConstant.dropdownText, textAlign: TextAlign.left,),
                ),
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
                2.verticalSpace,
                Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: (){
                     
                    },
                    child: Text(Strings.forgotPassword, style: FontConstant.subTitleText,),
                  ),
                ),
                
                20.verticalSpace,
                ElevatedButton(
                  onPressed: (){},
                  child:Padding(padding: EdgeInsets.symmetric(horizontal: 60.sp, vertical: 15.sp),
                      child: Text(Strings.login, style: FontConstant.headline3White, textAlign: TextAlign.center,),),
                  
                ),
                20.verticalSpace,
                if (_errorMessage.isNotEmpty)
                  Text(
                    _errorMessage,
                    style: FontConstant.subTitleText.copyWith(color: ColorConstants.errorText),
                  ),

                //or continute with
                Row(
                  children: [
                    const Expanded(
                      child: Divider(
                        color: ColorConstants.sliderGrey,
                        thickness: 1,
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 8.sp),
                      child: Text(
                        Strings.orContinuteWith,
                        style: FontConstant.subTitleText
                      ),
                    ),
                    const Expanded(
                      child: Divider(
                        color: ColorConstants.sliderGrey,
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
                
                30.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(Strings.signInHintText, style: FontConstant.subTitleText,),
                    5.horizontalSpace,
                    InkWell(
                      onTap: (){
                        context.pushRoute(LogInPage());
                      },
                      child: Text(Strings.login, style: FontConstant.subTitleText.copyWith(fontWeight: FontWeight.bold)),
                    )
                  ],
                )

              ],
            ),
        ),
      )
      ),
    );
  }
}
