import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storysphere_mobileapp/constants/string.dart';
import 'package:storysphere_mobileapp/constants/utils/color_constant.dart';
import 'package:storysphere_mobileapp/constants/utils/font_constant.dart';
import 'package:storysphere_mobileapp/routing/router.gr.dart';
import 'package:storysphere_mobileapp/services/account_service.dart';
import 'package:storysphere_mobileapp/views/log_in/services/login_service.dart';

@RoutePage()
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPage();
}

class _SignUpPage extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  String _errorMessage = '';
  bool _obscureText = true;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // top: false,
      child: Scaffold(
        body: SingleChildScrollView(
          child: 
        Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(Strings.loginBackgroundImage,),
              fit: BoxFit.cover,),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 20.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(Strings.register, style: FontConstant.titleBigDisplayWhite,),
                30.verticalSpace,

                //EMAIL
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(Strings.emailstr, style: FontConstant.dropdownText, textAlign: TextAlign.left,),
                ),
                5.verticalSpace,
                TextField(
                  controller: _emailController,
                  style: FontConstant.authorNameDisplay,
                  decoration: const InputDecoration(hintText: Strings.emailstr, hintFadeDuration: Durations.medium1),
                ),
                20.verticalSpace,

                //USERNAME
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(Strings.userStr, style: FontConstant.dropdownText, textAlign: TextAlign.left,),
                ),
                5.verticalSpace,
                TextField(
                  controller: _usernameController,
                  style: FontConstant.authorNameDisplay,
                  decoration: const InputDecoration(hintText: Strings.userStr, hintFadeDuration: Durations.medium1),
                ),
                20.verticalSpace,

                //PASSWORD
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
                20.verticalSpace,
                //CONFIRM PASSWORD
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(Strings.confirmEnterPassword, style: FontConstant.dropdownText, textAlign: TextAlign.left,),
                ),
                5.verticalSpace,
                TextField(
                  obscureText: _obscureText,
                  controller: _confirmPasswordController,
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
                ElevatedButton(
                  onPressed: (){
                    validationAndSubmit();
                  },
                  child:Padding(padding: EdgeInsets.symmetric(horizontal: 60.sp, vertical: 15.sp),
                      child: Text(Strings.register, style: FontConstant.headline3White, textAlign: TextAlign.center,),),
                  
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
      )),
    );
  }

  
  Future<void> validationAndSubmit() async {
    String username = _usernameController.text;
    String password = _passwordController.text;
    String confirmPassword = _confirmPasswordController.text;
    String email = _emailController.text;
    debugPrint('API Send');
    try {
      final response = await AccountService().register(username, password, confirmPassword, email);
      debugPrint('Review sent: ${response.body}');
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        if (responseData['code'] == 0 || responseData['code'] == 100) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(Strings.registerTYTitle),
                content: Text(Strings.registrationThankyou),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      context.pushRoute(LogInPage(newAccount: true));
                    },
                    child: Text('OK'),
                  ),
                ],
              );
            },
          );
        } else {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(Strings.error),
                content: Text(responseData['message']),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      context.pushRoute(LogInPage(newAccount: true));
                    },
                    child: Text('OK'),
                  ),
                ],
              );
            },
          );
         
        }
         
      }
      
    } catch (e) {
      debugPrint('Error sending review: $e');
    }
    
  }
}
