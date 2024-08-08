import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:storysphere_mobileapp/constants/string.dart';
import 'package:storysphere_mobileapp/constants/utils/color_constant.dart';
import 'package:storysphere_mobileapp/constants/utils/font_constant.dart';
import 'package:storysphere_mobileapp/constants/utils/responsive.dart';
import 'package:storysphere_mobileapp/routing/router.gr.dart';
import 'package:storysphere_mobileapp/views/log_in/services/login_service.dart';
import 'package:google_sign_in/google_sign_in.dart';


@RoutePage()
class LogInPage extends StatefulWidget {
  bool? newAccount;
  LogInPage({super.key, this.newAccount});
  
  @override
  State<LogInPage> createState() => _LogInPage();
}

class _LogInPage extends State<LogInPage> {
  final LoginService _loginService = LoginService();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _errorMessage = '';
  bool _obscureText = true;
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  late bool isKeyboardVisible;

  @override
  Widget build(BuildContext context) {
    isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;
    return PopScope(
      canPop:false,
      child: Scaffold(
        body:
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(Strings.loginBackgroundImage,),
              fit: BoxFit.cover,
             ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.sp),
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
                      context.pushRoute(const ForgotPasswordPage());
                    },
                    child: Text(Strings.forgotPassword, style: FontConstant.subTitleText,),
                  ),
                ),
                
                20.verticalSpace,
                ElevatedButton(
                  onPressed: _login,
                  child:Padding(padding: EdgeInsets.symmetric(horizontal: 60.sp, vertical: 15.sp),
                      child: Text(Strings.login, style: FontConstant.headline3White, textAlign: TextAlign.center,),),
                  
                ),
                20.verticalSpace,
                if (_errorMessage.isNotEmpty)
                  Text(
                    _errorMessage,
                    style: FontConstant.subTitleText.copyWith(
                      color: ColorConstants.errorText,),
                    textAlign: TextAlign.center,
                  ),

                //or continute with
                isKeyboardVisible 
                ? 0.verticalSpace
                : Row(
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
                
                20.verticalSpace,
                isKeyboardVisible 
                ? 0.verticalSpace
                : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,           
                  children: [
                    Center(
                      child: ElevatedButton(
                        onPressed: _handleGoogleSignIn,
                         style: ElevatedButton.styleFrom(
                          backgroundColor:  ColorConstants.primaryText,
                          padding: EdgeInsets.all(5.sp), // Remove padding
                          minimumSize: Size.zero,   // Remove minimum size constraints
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          shape: const CircleBorder(),
                        ),
                        child: 
                        Responsive.isMobile(context) 
                        ? Container(
                          width: 53.sp,
                          height: 53.sp,
                          child: Image.network(
                            'http://pngimg.com/uploads/google/google_PNG19635.png',
                            fit:BoxFit.contain
                          ),
                      ) : 0.verticalSpace,
                                        
                      ),
                    ),
                  ]
                ),

                30.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(Strings.registerHintText, style: FontConstant.subTitleText,),
                    5.horizontalSpace,
                    InkWell(
                      onTap: (){
                       context.pushRoute(const SignUpPage());
                      },
                      child: Text(Strings.register, style: FontConstant.subTitleText.copyWith(fontWeight: FontWeight.bold)),
                    )
                  ],
                )

              ],
            ),
        ),
      )),
    );
  }
  Future<void> _handleGoogleSignIn() async {
    try {
      await _googleSignIn.signIn();
      // Perform actions after successful sign-in (e.g., navigate to a different screen)
    } catch (error) {
      print(error);
    }
  }

  Future<void> _login() async {
    String username = _usernameController.text;
    String password = _passwordController.text;

    try {
      bool isLoggedIn = await _loginService.login(username, password);
      if (isLoggedIn) {
        if (widget.newAccount != null && widget.newAccount!){
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          context.pushRoute(AddFavCategory(userId: prefs.getInt('userId') ?? -1));
        }
         
        else
          context.pushRoute(const HSHomePage());
      } else {
        setState(() {
          _errorMessage = 'Đăng nhập thất bại. Vui lòng kiểm tra lại\nusername/email hoặc mật khẩu của bạn';
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'Đã có lỗi xảy ra. Hãy thử kiểm tra kết nối internet của bạn và thử lại sau.';
      });
    }
  }

}
